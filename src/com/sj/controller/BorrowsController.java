package com.sj.controller;

import java.awt.print.Book;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sj.base.BaseController;
import com.sj.entity.Books;
import com.sj.entity.Borrows;
import com.sj.entity.Papers;
import com.sj.entity.Periodicals;
import com.sj.entity.User;
import com.sj.service.IBooksService;
import com.sj.service.IBorrowsService;
import com.sj.service.IPapersService;
import com.sj.service.IPeriodicalsService;
import com.sj.service.IUserService;

@Controller
@RequestMapping("borrows")
public class BorrowsController extends BaseController {
	@Resource IBorrowsService borrowsService;
	@Resource IBooksService booksService;
	@Resource IPeriodicalsService periodicalsService ;
	@Resource IPapersService papersService;
	@Resource IUserService userService;
/**
 * 借阅历史
 * @param request
 * @return
 */
	@RequestMapping("list")
	public String list(HttpServletRequest request){
		User user=	getconcurrentUser(request);
		request.setAttribute("loginUser", user);
		request.setAttribute("loginType", user.getUrType());
		List<Books> books=new ArrayList<Books>();
		List<Periodicals> periodicals=new ArrayList<Periodicals>();
		List<Papers> papers=new ArrayList<Papers>();
		List<Borrows> borrows=new ArrayList<Borrows>(); 
		if(user.getUrType()==2){//管理员
			borrows=borrowsService.getAll(Borrows.class);
		}else{
			borrows=borrowsService.getBorrowsByUId(user.getId());
		}
		List<Borrows> borrows2=new ArrayList<Borrows>(); 
		for(int i=0;i<borrows.size();i++){
			User borrowuser=userService.getEntityById(User.class, borrows.get(i).getUId());
			if(borrowuser!=null){
				Borrows borrow = borrows.get(i);
				borrow.setUrName(borrowuser.getUrName());

				borrows2.add(borrow);
			}else{
				borrows2.add(borrows.get(i)); 
			}
		}


		if(borrows!=null){
			for(Borrows borrow:borrows){
				Integer prid=  borrow.getPrId();
				Integer bkid=  borrow.getBkId();
				Integer plid=  borrow.getPlId();
				if(prid!=null){
					Papers paper= papersService.getEntityById(Papers.class, prid);
					papers.add(paper);
				}
				if(bkid!=null){
					Books book= booksService.getEntityById(Books.class,bkid);
					books.add(book);
				}
				if(plid!=null){
					Periodicals periodical=periodicalsService.getEntityById(Periodicals.class, plid);
					periodicals.add(periodical);
				}
			}

        List<Borrows>borrows3=new ArrayList<Borrows>();
			for(int i=0;i<borrows2.size();i++){
				borrows2.get(i).getBkId();
				borrows2.get(i).getPlId();
				borrows2.get(i).getPrId();
				if(borrows2.get(i).getBkId()!=null){
				    Books b= booksService.getBooksById(borrows2.get(i).getBkId());
				    if(b!=null){
				    	Borrows borr=borrows2.get(i);
				    	borr.setBookName(b.getBkName());
				    	borrows3.add(borr);
				    }
				}
				if(borrows2.get(i).getPlId()!=null){
					System.out.println(borrows2.get(i).getPlId());
                     Periodicals p = periodicalsService.getEntityById(Periodicals.class, borrows2.get(i).getPlId());
                     Borrows borr=borrows2.get(i);
                     if(p!=null){
                    	 borr.setBookName(p.getPlName());
                     }else{
                    	 borr.setBookName(""); 
                     }
                     borrows3.add(borr);
				}
				if(borrows2.get(i).getPrId()!=null){
                 Papers p = papersService.getEntityById(Papers.class, borrows2.get(i).getPrId());
                 Borrows borr=borrows2.get(i);
                 borr.setBookName(p.getPrName());
                 borrows3.add(borr);
				}
			}

			request.setAttribute("borrows", borrows3);
			request.setAttribute("papers",papers );
			request.setAttribute("books",books );
			request.setAttribute("periodicals",periodicals);
		}
		return "borrows/list";

	}
	/**
	 * 根据兴趣爱好推荐图书
	 * @param request
	 * @return
	 */
	@RequestMapping("like")
	public String userLike(HttpServletRequest request){
		User user=	getconcurrentUser(request);
		Map<String,Object>likeentity=borrowsService.getBrroWsLike(user.getId());
		for(Map.Entry<String, Object> obj:likeentity.entrySet()){
			request.setAttribute(obj.getKey(), obj.getValue()); ;
		}
		return "borrows/like";
	}

	/**
	 * 借书规则
	 * @return
	 */
	@RequestMapping("regular")
	public String borrowRegular(){

		return "borrows/borrowRegular";

	}
	/**
	 * 跳转到借阅界面
	 * @param request
	 * @param id   
	 * @param type 0图书,1期刊,2论文,
	 * @return
	 */
	@RequestMapping("addUI")
	public String addUI(HttpServletRequest request,Integer id,Integer type){
		switch (type) {
		case 0:
			Books books = booksService.getEntityById(Books.class, id);
			request.setAttribute("books", books);
			break;
		case 1:
			Periodicals periodicals=periodicalsService.getEntityById(Periodicals.class, id);
			request.setAttribute("periodicals", periodicals);
			break;
		case 2:
			Papers papers=papersService.getEntityById(Papers.class, id);
			request.setAttribute("papers", papers);
			break;
		default:
			break;
		}
		request.setAttribute("type", type);
		return "books/submitborrows";
	}
	/**
	 * 借阅
	 * @param request
	 * @param borrows
	 * @return
	 */
	@RequestMapping("add")
	public String add(HttpServletRequest request,Borrows borrows){
		User user=getconcurrentUser(request);
		List<Borrows> borrowold=borrowsService.getBorrowsByUIdandRentun(user.getId());
		System.out.println("当前用户已经借阅这么多本书="+borrowold.size());
		boolean tag=true;
		if(borrowold!=null){
			switch (user.getUrType()) {
			case 0://专科生
				if(borrowold.size()>5)tag=false;
				break;//本科生

			case 1://研究生
				if(borrowold.size()>5)tag=false;
				break;
			case 2://博士生
				if(borrowold.size()>5)tag=false;
				break;
			case 3://留学生
				break;
			case 4://留学生
				if(borrowold.size()>5)tag=false;
				break;
			default:
				break;
			}
		}
		borrows.setUId(user.getId());
		Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		borrows.setBwBwtime(format.format(date));
		borrows.setBwIsreturn(0);
		if(borrowold.size()>5){
			return "forward:/books/allbook.do";
		}
		if(tag){
		   borrowsService.save(borrows);
		}
		return "forward:list.do";

	}
	/**
	 * 删除借阅记录
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("delete")
	public String delete(HttpServletRequest request,Integer id){
		borrowsService.deleteById(Borrows.class, id);
		return "forward:list.do";
	}
	/**
	 * 归还图书
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping("returns")
	public String returnbooks(HttpServletRequest request,Integer id){
		Borrows borrows=	borrowsService.getEntityById(Borrows.class, id);
		borrows.setBwIsreturn(1);
		borrowsService.updateBorrows(borrows);
		return "forward:list.do";
	}



}
