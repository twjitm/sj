package com.sj.service;

import com.sj.entity.User;

public interface IUserService extends IBaseService<User> {
 public User login(String accsee,String psd);

public User getUserByAccess(String urAccess);
public void updateUser(User user);

User getUserByAccessAndIphone(String urAccess, String iphone);

public void updatepsd(Integer id,String psd);
}
