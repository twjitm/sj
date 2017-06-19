package com.sj.dao;

import java.util.List;

import com.sj.base.IBaseDao;
import com.sj.entity.Power;


public interface IPowerDao extends IBaseDao<Power> {
	/**
	 * 根据用户类型获取用户的那些菜单
	 * @param type
	 * @return
	 */
public List<Power> getPowerByuserType(Integer type);
	
}
