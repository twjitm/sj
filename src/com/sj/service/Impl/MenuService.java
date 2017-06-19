package com.sj.service.Impl;


import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.dao.IMenuDao;
import com.sj.dao.IPowerDao;
import com.sj.entity.Menu;
import com.sj.entity.Power;
import com.sj.service.IMenuService;

/**
 * 菜单管理
 * @author 文江
 *
 */
@Service
public class MenuService extends BaseService<Menu> implements IMenuService {
@Resource
private IPowerDao powerDao;
@Resource
private IMenuDao menuDao;
	
	@Override
	public List<Menu> getMenuByuserType(Integer uType) {
	 List<Power>powers=	powerDao.getPowerByuserType(uType);
	 if(powers==null||powers.size()==0)return null;
	 Integer [] ids=new Integer[powers.size()];
	  for(int i=0;i<powers.size();i++){
		  ids[i]=powers.get(i).getMenuId();
	  }
	List<Menu> firstMenu=  menuDao.getFirstMenus(ids);//first
	 for(int i=0;i<firstMenu.size();i++){
		 List<Menu> chilMenu = menuDao.getMenuByParentId(firstMenu.get(i).getId());
		 firstMenu.get(i).setMenus(chilMenu);
	 }
	 
		return firstMenu;
	}



}
