package com.sj.service;

import java.util.List;

import com.sj.entity.Menu;


public interface IMenuService extends IBaseService<Menu> {
	/**
	 * 根据用户类型获取用户菜单
	 * @param uType
	 * @return
	 */
	public List<Menu> getMenuByuserType(Integer uType);
    


}
