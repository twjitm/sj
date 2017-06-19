package com.sj.dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sj.base.BaseDao;
import com.sj.dao.ICommonsDao;
import com.sj.entity.Commons;
@Repository
public class CommonsDaoImpl extends BaseDao<Commons> implements ICommonsDao {

	@Override
	public List<Commons> getCommons(Integer entityId, Integer type) {
		String hql="from Commons where entityId="+entityId+" and comType="+type;
		return this.find(hql);
	}

}
