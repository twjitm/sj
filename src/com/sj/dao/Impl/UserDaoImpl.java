package com.sj.dao.Impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sj.base.BaseDao;
import com.sj.dao.IUserDao;
import com.sj.entity.User;
@Repository
public class UserDaoImpl extends BaseDao<User> implements IUserDao{

	@Override
	public User login(String access, String pas) {
		String hql="from User where urAccess=:access and urPsd=:pas";
		
		Map<String, Object>params=new HashMap<String, Object>();
		params.put("access", access);
		params.put("pas", pas);
		return this.Get(hql, params);
	}

	@Override
	public User getUserbyacontandPsd(String account,String psd){
		String hql="from User where urAccess='"+account+"'"+" and urPsd='"+psd+"'";
		System.out.println(hql);
		return 	this.Get(hql);
		
	}
}
