package com.sj.dao.Impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sj.base.BaseDao;
import com.sj.dao.IMenuDao;
import com.sj.entity.Menu;


@Repository
public class MenuDaoImpl extends BaseDao<Menu> implements IMenuDao{

	@Override
	public List<Menu> getFirstMenus(Integer[] id) {
		String str="";
		for(int i=0;i<id.length;i++){
			str=str+id[i]+",";
		}
		str=str.substring(0, str.length()-1);
		String hql="from Menu where id in("+str+") and parentId=0 order by orderNum";
		return this.find(hql);
	}

	@Override
	public List<Menu> getMenuByParentId(Integer parentId) {
		String hql="from Menu where parentId="+parentId;
		return this.find(hql);
	}

}
