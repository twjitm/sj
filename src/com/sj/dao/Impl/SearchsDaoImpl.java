package com.sj.dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sj.base.BaseDao;
import com.sj.dao.ISearchsDao;
import com.sj.entity.Querys;

@Repository
public class SearchsDaoImpl extends BaseDao<Querys> implements ISearchsDao{

	@Override
	public List<Querys> getSearchsList(Integer userId) {
		 String hql="from Querys s where s.uId="+userId +" order by s.serachDate";
		return this.find(hql);
	}

	@Override
	public Querys getSearchsById(Integer sId) {
		 String hql="from Searchs s where s.id="+sId;
		 Querys s= this.Get(hql);
		 return s;
	}
}
