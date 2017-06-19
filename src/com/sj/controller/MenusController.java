package com.sj.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sj.base.BaseController;
import com.sj.entity.Menu;
import com.sj.entity.User;
import com.sj.service.IMenuService;
@RequestMapping("menu")
@Controller
public class MenusController extends BaseController {
	@Resource
	private IMenuService menuService;

     /**
      * 菜单控制权限
      * @param request
      * @return
      */
	@RequestMapping("menus")
	@ResponseBody
	public List<Menu> list(HttpServletRequest request){
		User user = getconcurrentUser(request);
		if(user==null){
			user =new User();
			user.setUrType(3);
		}
		List<Menu> menus= menuService.getMenuByuserType(user.getUrType());
		return menus;
	}
}
