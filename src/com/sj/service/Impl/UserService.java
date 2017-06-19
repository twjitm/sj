package com.sj.service.Impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.dao.IUserDao;
import com.sj.entity.User;
import com.sj.service.IUserService;
@Service
public class UserService extends BaseService<User> implements IUserService{
@Resource
private IUserDao userDao;
	@Override
	public User login(String accsee, String psd) {
		 User user=userDao.getUserbyacontandPsd(accsee, psd);
		return user;
	}
	@Override
	public User getUserByAccess(String urAccess) {
		String hql="from User where urAccess="+urAccess+" or urBarcode="+urAccess;
		return baseDao.Get(hql);
	}
	@Override
	public void updateUser(User user) {
		String hql="update User set urName='"+user.getUrName()+"',urSex='"+
	         user.getUrSex()+"',srIphone='"+user.getSrIphone()+"',stuType="+user.getUrType()+" where id="+user.getId();
		userDao.update(hql);
	}
	
	@Override
	public User getUserByAccessAndIphone(String urAccess,String iphone) {
		String hql="from User where urAccess="+urAccess+" and srIphone="+urAccess;
		return baseDao.Get(hql);
	}
	@Override
	public void  updatepsd(Integer id, String psd) {
		String hql="update User set urPsd='"+psd+"' where id="+id;
		baseDao.update(hql);
	}
	

}
