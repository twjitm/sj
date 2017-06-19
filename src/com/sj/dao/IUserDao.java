package com.sj.dao;

import com.sj.base.IBaseDao;
import com.sj.entity.User;

public interface IUserDao extends IBaseDao<User>{

	User login(String access,String pas);

	User getUserbyacontandPsd(String account, String psd);
	
}
