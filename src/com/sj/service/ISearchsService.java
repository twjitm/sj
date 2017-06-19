package com.sj.service;

import java.util.List;

import com.sj.entity.Querys;


public interface ISearchsService extends IBaseService<Querys>{
  
	public void add(Querys s);
	public List<Querys> getListByUserId(Integer uId);
	
}
