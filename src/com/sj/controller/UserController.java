package com.sj.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sj.base.BaseController;
import com.sj.entity.Menu;
import com.sj.entity.User;
import com.sj.service.IBooksService;
import com.sj.service.IMenuService;
import com.sj.service.IUserService;
import com.sj.utils.MD5Utils;

@Controller
@RequestMapping("user")
public class UserController extends BaseController {
	@Resource
	private IUserService userService;
	@Resource
	private IMenuService menuService;
	
	@ResponseBody
	@RequestMapping("login")
	public User login(HttpServletRequest request , User user){
		MD5Utils md5Utils=new MD5Utils();
		System.out.println(user.getUrAccess());
		String psd = md5Utils.getMD5ofStr(user.getUrPsd());
		System.out.println(psd);
		User login= userService.login(user.getUrAccess(),psd);
		if(!user.getUrAccess().equals("admin")){
		  int years= Integer.parseInt(user.getUrAccess().substring(0, 4));
		  System.out.println(years);
		  Calendar a=Calendar.getInstance();
		  int curryear=a.get(Calendar.YEAR);
		  if(curryear-years>4||curryear-years==-1){//新老生不能登录
			  login=new User();
			  login.setUrType(3);//禁止登录状态
			return  login; 
		  }
		}
		if(login==null){
			return null;
		}else{
			setconcurrentUser(login,request);
			request.getSession().setAttribute(request.getSession().getId(), login);//向session设置
			List<Menu> menulist= menuService.getMenuByuserType(login.getUrType());
			request.setAttribute("menulist", menulist);
			return login;
		}
	}
	 
	
	/**
	 * 初始化菜单
	 * @param request
	 * @return
	 */
	   @RequestMapping("menus")
	   @ResponseBody
	 public List<Menu> intiMenu(HttpServletRequest request){
		   User user = getconcurrentUser(request);
		      if(user==null){
		    	  user =new User();
		    	  user.setUrType(3);
		      }
		    List<Menu> menus= menuService.getMenuByuserType(user.getUrType());
		   return menus;
	 }
	
	
	/**
	 * 跳转到登陆页
	 * @param request
	 * @return
	 */
	@RequestMapping("loginUI")
	public String loginUI(HttpServletRequest request ,Integer loginType){
		if(loginType==0){//管理员和普通用户登录
			return "/user/login";
		}else if(loginType==1){//超管登陆
			return "/user/superLogin";
		}
		return "/user/login";
	}

	/**
	 * 退出登录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("loginOut")
	public String loginOut(HttpServletRequest request ,HttpServletResponse response){
		request.getSession().removeAttribute(request.getSession().getId());
		removeconcurrentUser(request);
		return "/user/login";
	}
	 @RequestMapping("userinfor")
	public String userInfro(HttpServletRequest request){
		User user= getconcurrentUser(request);
		request.setAttribute("user",userService.getEntityById(User.class,user.getId()));
		return "/user/userinfor";
	}
	 /**
	  * 更新用户
	  * @param request
	  * @param user
	  * @return
	  */
	 @RequestMapping("update")
	 @ResponseBody
		public String updateUser(HttpServletRequest request,User user){
		 System.out.println(user.getId());
      		 userService.updateUser(user);
      		setconcurrentUser(userService.getEntityById(User.class,user.getId()), request);
		 return "success";
		}
	 /**
	  * 跳转到修改密码
	  * @return
	  */
	 @RequestMapping("updatepsdUI")
	 public String updatePsdUI(){
		return "/user/updatepsd";
	}
	 /**
	  * 修改密码
	  * @param request
	  * @param oldPsd
	  * @param newPsd
	  * @return
	  */
	 @RequestMapping("updatepsd")
	 @ResponseBody
	 public String updatePsdUI(HttpServletRequest request ,String oldPsd,String newPsd){
		   MD5Utils md5Utils=new MD5Utils();
		   oldPsd=   md5Utils.getMD5ofStr(oldPsd);
		   newPsd=   md5Utils.getMD5ofStr(newPsd);
		   
	         User user=getconcurrentUser(request);
	         user= userService.login(user.getUrAccess(), oldPsd);
	         if(newPsd.length()<7){
	        	 return "short";
	         }
	         if(oldPsd.equals(user.getUrPsd())){
	        	 user.setUrPsd(newPsd);
	        	 userService.updatepsd(user.getId(),newPsd);
	        	 return "success";
	         }else{
	        	 return "error"; 
	         }
	}
	 /**
	  * 跳转到登录页
	  * @param request
	  * @return
	  */
	 @RequestMapping("registerUI")
	 public String registerUI(HttpServletRequest request){
		 return "user/register";
	 }
	 
	 /**
	  * 注册用户
	  * @param request
	  * @param user
	  * @return
	  */
	 @RequestMapping("register")
	 public String register(HttpServletRequest request,User user){
		User isuser= userService.getUserByAccess(user.getUrAccess()) ;
		if(isuser==null){
			user.setUrAccess(user.getUrBarcode());
			user.setUrType(1);
			MD5Utils md5Utils=new MD5Utils();
			String md5 = md5Utils.getMD5ofStr(user.getUrPsd());
			user.setUrPsd(md5);
			userService.save(user);
			return "user/login";	
		 }
		return null; 
	 }
	 
	 
	 @RequestMapping("forgetUI")
	 public String forgetUI(HttpServletRequest request){
		return "/user/forgotPsd";
		 
	 }
	 /**
	  * 忘记密码
	  * @param request
	  * @param access
	  * @param iphone
	  * @param newpsd
	  * @return
	  */
	 
	 @RequestMapping("forget")
	 public String forget(HttpServletRequest request,String access,String iphone, String newpsd){
		User user= userService.getUserByAccessAndIphone(access,iphone);
		MD5Utils md5Utils=new MD5Utils();
		String md5 = md5Utils.getMD5ofStr(newpsd);
		userService.updatepsd(user.getId(),md5);
		return "/user/login";
		 
	 }
}
