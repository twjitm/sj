package com.sj.dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sj.base.BaseDao;
import com.sj.dao.IPowerDao;
import com.sj.entity.Power;


@Repository
public class PowerDaoImpl extends BaseDao<Power> implements IPowerDao{

	@Override
	public List<Power> getPowerByuserType(Integer type) {
	   String hql="from  Power p where p.userType="+type;
		return find(hql);
	}
 
}
