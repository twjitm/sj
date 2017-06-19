package com.sj.dao;

import java.util.List;

import com.sj.base.IBaseDao;
import com.sj.entity.Menu;


public interface IMenuDao extends IBaseDao<Menu>{
	/**
	 * 获取1级菜单
	 * @param ids
	 * @return
	 */
	public List<Menu> getFirstMenus(Integer [] ids);
	/**
	 * 获取子菜单
	 * @param parentId
	 * @return
	 */
	public List<Menu> getMenuByParentId(Integer parentId);

}
