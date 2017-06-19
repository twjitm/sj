package com.sj.dao;

import java.util.List;

import com.sj.base.IBaseDao;
import com.sj.entity.Periodicals;

public interface IPeriodicalsDao extends IBaseDao<Periodicals>{
	public List<Periodicals> getnewPeriodicals();

	public List<Periodicals> getnewPeriodicals(Integer page, Integer row);

	public List<Periodicals> getnewPeriodicals(Integer page, Integer row,
			Integer type, String keycontect);

}
