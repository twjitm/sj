package com.sj.service.Impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.base.IBaseDao;
import com.sj.entity.Books;
import com.sj.entity.Borrows;
import com.sj.entity.Papers;
import com.sj.entity.Periodicals;
import com.sj.service.IBooksService;
import com.sj.service.IBorrowsService;
import com.sj.service.IPapersService;
import com.sj.service.IPeriodicalsService;
@Service
public class BorrowsService extends BaseService<Borrows> implements IBorrowsService {
@Resource
private IBaseDao<Borrows> baseDao;
@Resource IBooksService booksService;
@Resource IPeriodicalsService periodicalsService ;
@Resource IPapersService papersService;

	@Override
	public List<Borrows> getBorrowsByUId(Integer uId) {
		String hql="from Borrows where UId="+uId;
		//update(t);
		return baseDao.find(hql);
	}

/**
 * 协同过滤
 */
	@Override
	public  Map<String, Object> getBrroWsLike(Integer uId) {
	    Map<String,Object>entitys=new HashMap<String, Object>();
	    String hql="from Borrows where UId="+uId;
	    List<Borrows> borrows = baseDao.find(hql);
	    List<Books> books=new ArrayList<Books>();
		List<Periodicals> periodicals=new ArrayList<Periodicals>();
		List<Papers> papers=new ArrayList<Papers>();
	    if(borrows!=null){
	    	for(Borrows borrow:borrows){
	    		if(borrow.getBkId()!=null){
	    			Books books2 = booksService.getBooksById(borrow.getBkId());
	    			if(books2!=null){
	    				books.add(books2);
	    			}
	    		}if(borrow.getPrId()!=null){
	    			Periodicals periodicals2 = periodicalsService.getEntityById(Periodicals.class, borrow.getPrId());
	    		    if(periodicals2!=null){
	    		    	periodicals.add(periodicals2);
	    		    }
	    		
	    		}if(borrow.getPlId()!=null){
	    			Papers papers2 = papersService.getEntityById(Papers.class, borrow.getPlId());
	    			if(papers2!=null){
	    				papers.add(papers2);
	    			}
	    			
	    		}
	    	}
	    }
	    List<Books>likebooks=booksService.getLikeBooks(books);
	    List<Periodicals>likeperiodicals=periodicalsService.getLikeperiodicals(periodicals);
		List<Papers>likepapers=papersService.getLikePapers(papers);
	     entitys.put("books", likebooks);
	     entitys.put("periodicals", likeperiodicals);
	     entitys.put("papers", likepapers);
		return entitys;
	}


	@Override
	public void updateBorrows(Borrows borrows) {
		String hql="update Borrows set bwIsreturn=1 where id="+borrows.getId();
		baseDao.update(hql);
	}


	@Override
	public List<Borrows> getBorrowsByUIdandRentun(Integer uId) {
		String hql="from Borrows where UId="+uId+" and bwIsreturn=0";
		return baseDao.find(hql);
	}

}
