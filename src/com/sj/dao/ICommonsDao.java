package com.sj.dao;

import java.util.List;

import com.sj.base.IBaseDao;
import com.sj.entity.Commons;

public interface ICommonsDao extends IBaseDao<Commons> {
	public List<Commons> getCommons(Integer entityId,Integer type );
}
