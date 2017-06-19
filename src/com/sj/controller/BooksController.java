package com.sj.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javassist.URLClassPath;

import javax.annotation.Resource;
import javax.net.ssl.HttpsURLConnection;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.annotation.JsonSerialize.Typing;
import com.sj.base.BaseController;
import com.sj.entity.Books;
import com.sj.entity.Collections;
import com.sj.entity.Papers;
import com.sj.entity.Periodicals;
import com.sj.entity.User;
import com.sj.service.IBaseService;
import com.sj.service.IBooksService;
import com.sj.service.ICollectionsService;
import com.sj.service.ICommonsService;
import com.sj.service.IPapersService;
import com.sj.service.IPeriodicalsService;
import com.sj.utils.FileUtils;
@Controller
@RequestMapping("books")
public class BooksController extends BaseController{
	@Resource
	private IBooksService booksService;
	@Resource
	private IPapersService papersService;
	@Resource 
	private IPeriodicalsService periodicalsService;
	@Resource
	private ICommonsService commonsService;
	@Resource
	private ICollectionsService collectionsService;


	/**
	 * 获取最新的图书，论文，期刊(带检索)
	 * @param request
	 * @return
	 */

	Map<String, Object>param=new HashMap<String, Object>();
	@RequestMapping("newall")
	public String listnewAll(HttpServletRequest request,Integer cp,Integer type,String keycontect){
		System.out.println(cp+"*************************************************");
		if(cp==null){cp=0;}
		if(type==null){
			type=0;
		}else{
			param.put("type", type);
		}
		if(keycontect!=null){
			param.put("keycontect", keycontect);
		}else{
			param.put("keycontect", "");
		}
		if(type==null||keycontect==null){
			cp=cp+1;
			List<Books> listbooks=  booksService.getnewBooks(cp,10);
			List<Papers> listpapers = papersService.getnewPapers(cp,10);
			List<Periodicals> listperiodicals = periodicalsService.getnewPeriodicals(cp,10);
			request.setAttribute("listbooks", listbooks);
			request.setAttribute("listpapers", listpapers);
			request.setAttribute("listperiodicals",	 listperiodicals);
			cp=cp-1;
			request.setAttribute("page", cp);
			request.setAttribute("num", listbooks.size());
		}else{
			cp=cp+1;
			List<Books> listbooks=  booksService.getnewBooks(cp,10,(Integer)param.get("type"),param.get("keycontect").toString().trim()+"");
			List<Papers> listpapers = papersService.getnewPapers(cp,10,(Integer)param.get("type"),param.get("keycontect").toString().trim()+"");
			List<Periodicals> listperiodicals = periodicalsService.getnewPeriodicals(cp,10,(Integer)param.get("type"),param.get("keycontect").toString().trim()+"");
			request.setAttribute("listbooks", listbooks);
			request.setAttribute("listpapers", listpapers);
			request.setAttribute("listperiodicals",	 listperiodicals);
			cp=cp-1;
			request.setAttribute("page", cp);
			request.setAttribute("num", listbooks.size());
		}

		return "/books/list";
	}



	/**
	 * 查看图书详细信息
	 * @param request
	 * @param Id 
	 * @param type 类型 0 图书，1期刊，2论文
	 * @return
	 */
	@RequestMapping("bookInfor")
	public String bookInfor(HttpServletRequest request,Integer id,Integer type){
		System.out.println(id);
		switch (type) {
		case 0:
			Books book=booksService.getEntityById(Books.class, id);
			book.setBkBrowsenum(book.getBkBrowsenum()+1);
			booksService.update(book);
			request.setAttribute("books", book);
			break;
		case 1:
			Periodicals periodicals= periodicalsService.getEntityById(Periodicals.class, id);
			periodicals.setPlBrowsenum(periodicals.getPlBrowsenum()+1);
			periodicalsService.update(periodicals);
			request.setAttribute("periodicals",periodicals);
			break;
		case 2:
			Papers papers=  papersService.getEntityById(Papers.class, id);
			papers.setPrBorrownum(papers.getPrBorrownum()+1);
			papersService.update(papers);
			request.setAttribute("papers",papers );
			break;
		default:
			break;
		}
		request.setAttribute("commons",commonsService.getCommons(id, type));
		if(type==0){
			return "books/bookInfor";
		}
		if(type==1){
			return "books/periodicalsInfor";
		}if(type==2){
			return "books/papersInfor";
		}
		return null;
	}

	/**
	 * 删除图书或者是期刊或者是论文
	 * @param request
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping("delete")
	public String  delete(HttpServletRequest request,Integer id,Integer type){
		switch (type) {
		case 0:
			booksService.deleteById(Books.class, id);
			break;
		case 1:
			papersService.deleteById(Papers.class, id);
			break;
		case 2:
			periodicalsService.deleteById(Periodicals.class, id);
			break;
		default:
			break;
		}
		return "forward:adminlist.do";
	}

	/**
	 * 跳转到
	 * @param request
	 * @param type
	 * @return
	 */
	@RequestMapping("addbookUI")
	public String addbookUI(HttpServletRequest request,Integer type){
		String returnstr="";
		switch (type) {
		case 0://添加图书
			returnstr="/books/addbook";
			break;
		case 1://添加期刊
			returnstr="/books/addperiodicals";
			break;
		case 2://添加论文
			returnstr="/books/addparapers";
			break;
		default:
			break;
		}
		return returnstr;
	}
	//添加图书
	@RequestMapping("addBooks")
	public String addBooks(HttpServletRequest request,Books books,MultipartFile file){
		User user=	getconcurrentUser(request);
		String pdfurl= FileUtils.saveFile(user, request, file, "books");
		books.setPdfurl(pdfurl);
		books.setBkImage("");
		books.setBkBrowsenum(0);
		books.setBkLibtime(new Date());
		booksService.save(books);
		return "books/addbook";
	}
	/**
	 * 更新
	 * @param request
	 * @param books
	 * @return
	 */
	@RequestMapping("upBooks")
	public String upBooks(HttpServletRequest request,Books books){
		booksService.update(books);
		return "forward:adminlist.do";
	}
	
	//添加论文
	@RequestMapping("addPapers")
	public String addPapers(HttpServletRequest request,Papers papers,MultipartFile file){
		User user=	getconcurrentUser(request);
		String pdfurl= FileUtils.saveFile(user, request, file, "papers");
		papers.setPdfurl(pdfurl);
		papers.setPrLibtime(new Date());
		papers.setPrBorrownum(0);
		papers.setPrLooknum(0);
		papers.setPrCollectionnum(0);
		papersService.save(papers);
		return "books/addparapers";
	}
	@RequestMapping("upPapers")
	public String upPapers(HttpServletRequest request,Papers papers){
		papers.setPrLibtime(new Date());
		papers.setPrBorrownum(0);
		papers.setPrLooknum(0);
		papers.setPrCollectionnum(0);
		papersService.update(papers);
		return "forward:adminlist.do";
	}
	
	//添加期刊
	@RequestMapping("addPeriodicals")
	public String addPeriodicals(HttpServletRequest request,Periodicals periodicals,MultipartFile file){
		User user=	getconcurrentUser(request);
		String pdfurl= FileUtils.saveFile(user, request, file, "periodicals");
		periodicals.setPdfurl(pdfurl);
		periodicals.setPlLibtime(new Date());
		periodicals.setPlBrowsenum(0);
		periodicalsService.save(periodicals);
		return "/books/addperiodicals";
	}

	@RequestMapping("upPeriodicals")
	public String upPeriodicals(HttpServletRequest request,Periodicals periodicals){
		periodicals.setPlLibtime(new Date());
		periodicals.setPlBrowsenum(0);
		periodicalsService.update(periodicals);
		return "forward:adminlist.do";
	}


	//收藏-----------------------------------------------------

	//收藏列表
	@RequestMapping("collectionList")
	public String collectionList(HttpServletRequest request){
		User user=getconcurrentUser(request);
		List<Collections> list=collectionsService.getCollectionsByUId(user.getId());
		List<Books>books=new ArrayList<Books>();
		List<Periodicals>periodicals=new ArrayList<Periodicals>();
		List<Papers>papers=new ArrayList<Papers>();
		for(Collections collections:list){
			int type=collections.getType();
			int entytyid=collections.getEntityId();
			switch (type) {
			case 0:
				Books book=booksService.getEntityById(Books.class, entytyid);
				if(book!=null){books.add(book);}
				break;
			case 1:
				Periodicals periodical=periodicalsService.getEntityById(Periodicals.class, entytyid);
				if(periodical!=null){periodicals.add(periodical);}
				break;
			case 2:
				Papers paper=papersService.getEntityById(Papers.class, entytyid);
				if(paper!=null){papers.add(paper);}
				break;

			default:
				break;
			}
			request.setAttribute("books", books);
			request.setAttribute("periodicals", periodicals);
			request.setAttribute("papers", papers);
		}
		return "books/collectionList";
	}
	//删除收藏
	@RequestMapping("deletecollection")
	public String deletecollection(HttpServletRequest request,Integer entityId,Integer type){
		User user=getconcurrentUser(request);
		Collections collections=collectionsService.getCollections(user.getId(), entityId, type);
		if(collections!=null)
			collectionsService.deleteById(Collections.class, collections.getId());
		return "forward:collectionList.do";
	}

	//添加收藏
	@RequestMapping("addcollection")
	@ResponseBody
	public String addcollection(HttpServletRequest request,Integer entityId,Integer  type){
		User user=getconcurrentUser(request);
		Collections old=collectionsService.getCollections(user.getId(),entityId,type);
		if(old==null){
			Collections collections=new Collections();
			collections.setEntityId(entityId);
			collections.setType(type);
			collections.setUid(user.getId());
			collectionsService.save(collections);
			return "success";
		}else{
			return "exist";
		}
	}
	/**
	 * 在线阅读
	 * @param request
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping("readbook")
	public String readBook(HttpServletRequest request,Integer id,Integer type){
		System.out.println(request.getSession().getId());
		switch (type) {
		case 0:
			Books books= booksService.getBooksById(id);
			if(books!=null)
				request.setAttribute("books", books);
			request.setAttribute("type", 0);
			break;
		case 1:
			Periodicals periodicals=periodicalsService.getEntityById(Periodicals.class, id);
			if(periodicals!=null)
				request.setAttribute("periodicals", periodicals);
			request.setAttribute("type", 1);
			break;
		case 2:
			Papers papers=	papersService.getEntityById(Papers.class, id);
			if(papers!=null)
				request.setAttribute("papers", papers);
			request.setAttribute("type", 2);
			break;

		default:
			break;
		}
		return "/books/readif";
	}
	//------------------------------------管理员操作查询图书
	/**
	 * 管理员查询图书
	 * @param request
	 * @return
	 */
	@RequestMapping("adminlist")
	public String adminlist(HttpServletRequest request){
		request.setAttribute("loginUser", getconcurrentUser(request));
		List<Books> books = booksService.getAll(Books.class);
		List<Papers> papers = papersService.getAll(Papers.class);
		List<Periodicals> periodicals = periodicalsService.getAll(Periodicals.class);
		request.setAttribute("books", books);
		request.setAttribute("papers", papers);
		request.setAttribute("periodicals", periodicals);
		return "books/adminlist";
	}
	
	/**
	 * 获取全部图书，期刊，论文（前台分页查询）
	 * @param request
	 * @return
	 */
	@RequestMapping("allbook")
	public String allbook(HttpServletRequest request){
		List<Books> booklist = booksService.getAll(Books.class);
	    List<Periodicals> perilist = periodicalsService.getAll(Periodicals.class);
		List<Papers> paplist = papersService.getAll(Papers.class);
		request.setAttribute("listbooks", booklist);
		request.setAttribute("listperiodicals", perilist);
		request.setAttribute("listpapers", paplist);
		return "/books/allbook";
	}
	
	
	/**
	 * 跳转到更新页面
	 * @param request
	 * @param id
	 * @param type
	 * @return
	 */
	@RequestMapping("updateUI")
	public String  updateBooks(HttpServletRequest request,Integer id,Integer type){
		String reutrnurl = null;
		switch (type) {
		case 0:
		 Books books=	booksService.getEntityById(Books.class, id);
		 request.setAttribute("books", books);
			reutrnurl="/books/updatebook";
			break;
		case 1:
			 Periodicals periodicals = periodicalsService.getEntityById(Periodicals.class, id);
			reutrnurl="/books/updateperiodicals";
			request.setAttribute("periodicals", periodicals);
			break;
		case 2:
			Papers papers = papersService.getEntityById(Papers.class, id);
			request.setAttribute("papers",papers);
			reutrnurl="/books/updateparapers";
			break;
		default:
			break;
		}
		return reutrnurl;
	}

	public String mutualBorrows(HttpServletRequest request,String url){
		Properties pro = new Properties();
		FileInputStream in;
		try {
			in = new FileInputStream("Library.properties");
			pro.load(in);
			String ip = pro.getProperty("ip");    
			String intface = pro.getProperty("intface"); 
		} catch (Exception e) {

			e.printStackTrace();
		}
		return url;
	}
	
}
