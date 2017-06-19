package com.sj.dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.sj.base.BaseDao;
import com.sj.dao.IPeriodicalsDao;
import com.sj.entity.Periodicals;
@Repository
public class PeriodicalsDaoImpl extends BaseDao<Periodicals> implements IPeriodicalsDao{
	@Override
	public List<Periodicals> getnewPeriodicals() {
		String hql="from Periodicals where YEARWEEK(date_format(plLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) ";
		return this.find(hql);
	}

	@Override
	public List<Periodicals> getnewPeriodicals(Integer page, Integer row) {
		String hql="from Periodicals where YEARWEEK(date_format(plLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) ";
		return this.find(hql,page,row);
	}

	@Override
	public List<Periodicals> getnewPeriodicals(Integer page, Integer row,Integer type, String keycontect) {
		String hql="from Periodicals where YEARWEEK(date_format(plLibtime,'%Y-%m-%d'))=YEARWEEK(NOW()) and ";
        String base="";
		switch (type) {
		   case 0:
			   base="plName like '%"+keycontect+"%'";
			break;
		   case 1:
			   base="plAuthor like '%"+keycontect+"%'";
			break;
		   case 2:
			   base="plSummary like '%"+keycontect+"%'";
			break;

		default:
			break;
		}
		hql=hql+base;
		return this.find(hql,page,row);
		
		
	}

}
