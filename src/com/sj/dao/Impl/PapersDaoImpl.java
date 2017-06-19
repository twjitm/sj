package com.sj.dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sj.base.BaseDao;
import com.sj.dao.IPapersDao;
import com.sj.entity.Papers;
@Repository
public class PapersDaoImpl extends BaseDao<Papers> implements IPapersDao  {

	@Override
	public List<Papers> getNewPapers() {
		String hql="from Papers where YEARWEEK(date_format(prLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) ";
		return this.find(hql);
	}

	@Override
	public List<Papers> getNewPapers(Integer page, Integer row) {
		String hql="from Papers where YEARWEEK(date_format(prLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) ";
		return this.find(hql,page,row);
	}

	@Override
	public List<Papers> getNewPapers(Integer page, Integer row, Integer type,
			String keycontect) {
		String hql="from Papers where YEARWEEK(date_format(prLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) and ";
		String base="";
		switch (type) {
		    case 0:
		    	base="prName like'%"+keycontect+"%'";
			break;
		    case 1:
		    	base="prAuthor like'%"+keycontect+"%'";
				break;
		    case 2:
		    	base="prSummary like'%"+keycontect+"%'";
				break;
		   default:
			break;
		}
		hql=hql+base;
		return this.find(hql,page,row);
	}

}
