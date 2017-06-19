package com.sj.filter;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sj.base.BaseController;


/**
 * 用户登录过滤器
 * @author 文江
 *
 */
public class LoginFilter implements Filter {
	private BaseController baseController;
	private static final String SHOW_LOGIN_PATH = "SHOW_LOGIN_PATH";    //显示登录页面  
	private static final String DO_LOGIN_PATH = "DO_LOGIN_PATH";        //登录操作不能过滤掉  
	private static final String LOGIN_PERSONID = "LOGIN_PERSONID";      //登录用户在session中的属性key -- session.setAttribute(key,value)      
	private static final String LOGINOUT_PATH="LOGINOUT_PATH";
	private String showloginPath;  
	private String dologinPath;//登录url
	private String loginout;
	/**
	 * 前台没有权限的url,后续根据业务逻辑添加
	 */
	private static  Map<String, String>nofilterUrl=new HashMap<String, String>();
	static{
		nofilterUrl.put("/user/registerUI.do", "/user/registerUI.do");
		nofilterUrl.put("/user/register.do", "/user/register.do");
		nofilterUrl.put("/books/readbook.do", "/books/readbook.do");
		nofilterUrl.put("/user/forgetUI.do", "/user/forgetUI.do");
		nofilterUrl.put("/user/forget.do", "/user/forget.do");

		//nofilterUrl.put(key, value)
	}


	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		System.out.println("doFilter过滤器来了----------------------");
		baseController=new BaseController();
		HttpServletRequest  httpReq  = (HttpServletRequest) request;  
		HttpServletResponse httpResp = (HttpServletResponse) response;  
		httpResp.setContentType("text/html");  
		//判断是否是登陆页面  
		String servletPath = httpReq.getServletPath(); //当前请求的路径
		System.out.println(servletPath);
		//flag:若为登陆页面的action路径 showloginPath/nologinPath,则赋值true，否则赋值false  
		boolean isfilter=nofilterUrl.get(servletPath)==null?false:true;
		boolean flag = false;
		if(servletPath.equals(showloginPath) || servletPath.equals(dologinPath)||servletPath.equals(loginout)||isfilter){  
			System.out.println("不过滤");
			chain.doFilter(request, response);  
			flag = true;  
			return;  
		}  
		else{   //如果不是登录页面，则需先判断用户是否已登录  
			Object loginId = httpReq.getSession().getAttribute(httpReq.getSession().getId()); 
			//
			if(loginId != null){//如果不为空,则进行已登录处理  
				//request.setAttribute("user", baseController.getUser(httpReq));
				chain.doFilter(request, response);  
			}else{//如果为空,则进行未登录处理  
				if ( httpReq.getQueryString() != null )  {  
					servletPath += "?"+httpReq.getQueryString();  
				}  
				httpReq.getSession().setAttribute("returnUri", servletPath);  
				if ( flag == false ) {    
					httpReq.getRequestDispatcher(showloginPath).forward(httpReq,httpResp);  
				}   
			}  
		}  
	}
	/**
	 * 初始化过滤器
	 */
	@Override
	public void init(FilterConfig config) throws ServletException {
		System.out.println("init过滤器来了----------------------");
		showloginPath = config.getInitParameter(SHOW_LOGIN_PATH);  
		dologinPath = config.getInitParameter(DO_LOGIN_PATH);  
		loginout=config.getInitParameter(LOGINOUT_PATH);
		System.out.println(loginout);
		if(showloginPath==null || showloginPath.equals("") || showloginPath.equals("null") ){  
			throw new ServletException("登录页面配置出错...");  
		}  
	}

}
