package com.sj.service;

import java.util.List;

import com.sj.entity.Periodicals;

public interface IPeriodicalsService extends IBaseService<Periodicals>{
 /**
  * 获取最期刊
  * @return
  */
	public  List<Periodicals>   getnewPeriodicals();
	public  List<Periodicals>   getnewPeriodicals(Integer page,Integer row);
	public List<Periodicals> getnewPeriodicals(Integer cp, Integer row, Integer type,
			String keycontect);
	public List<Periodicals> getLikeperiodicals(List<Periodicals> periodicals);
 }
