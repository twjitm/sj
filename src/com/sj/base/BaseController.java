package com.sj.base;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import com.sj.entity.User;




@Controller
public class BaseController {

	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		dateFormat.setLenient(false);  
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));    //true:允许输入空�?，false:不能为空�?
	}  
	/**
	 * 获取当前用户
	 * @param request
	 * @return
	 */
	@Autowired
	private HttpServletRequest request;
	@Resource
	private HttpSession session;
	private Map<String , User>linePerson=new HashMap<String, User>();
	/**
	 * 获取当前登录用户
	 * @param request
	 * @return
	 */
	protected User getconcurrentUser(HttpServletRequest request) {  
		//System.out.println("当前session=id"+request.getSession().getId());
		User user=(User) session.getServletContext().getAttribute(request.getSession().getId());
		//	    	(Users) this.request.getSession().getAttribute("user"); 
		if(user==null){
          //默认用户			
			user=new User();
			user.setId(0);
			user.setUrAccess("default");
		}
		return user;
	}

	/**
	 * 设置当前用户
	 * @param request
	 * @param user
	 */
	protected void setconcurrentUser(User user,HttpServletRequest request){  
		System.out.println("当前session=id"+request.getSession().getId());
		session.getServletContext().setAttribute(request.getSession().getId(), user);
		linePerson.put(request.getSession().getId(), user);
	}  
	/**
	 * 移除登录用户
	 * @param request
	 */
	protected void removeconcurrentUser(HttpServletRequest request){
		session.getServletContext().removeAttribute(request.getSession().getId());
		linePerson.remove(request.getSession().getId());
	}

	/**
	 * 获取当前在线用户数量
	 * @return
	 */
	protected Integer getOnLineUserNumber(){
		return linePerson.size();

	}

	public  User getUser(HttpServletRequest request) {
		return getconcurrentUser(request);
	}
	
	protected	String  formatDataTostring(Date date){
		
		return null;
	}
}
