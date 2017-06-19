package com.sj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sj.base.BaseController;
import com.sj.entity.Leavemag;
import com.sj.service.IBaseService;
@RequestMapping("sys")
@Controller
public class SystemController extends BaseController{
	@Resource IBaseService<Leavemag> baseService;
	/**
	 * 跳转到留言页面
	 * @param request
	 * @return
	 */
	@RequestMapping("leavesmg")
	public String leaveMessageUI(HttpServletRequest request){
		List<Leavemag>leavemags= baseService.getAll(Leavemag.class);
		request.setAttribute("leavemags", leavemags);
		return "sys/leaveMessage";
	}
	/**
	 * 添加留言
	 * @param request
	 * @param leavemag
	 * @return
	 */
	@RequestMapping("add")
	public String add(HttpServletRequest request ,Leavemag leavemag){
		Date date=new Date();
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		leavemag.setMsgDate(f.format(date));
		leavemag.setMsgName(getconcurrentUser(request).getUrAccess());
		baseService.save(leavemag);
		return "forward:leavesmg.do";
	}
	/**
	 * 入关教育
	 * @return
	 */
	@RequestMapping("intolibstu")
	public String intolibstu(HttpServletRequest request){
		request.setAttribute("user", getconcurrentUser(request));
		return "/sys/intolibstu";
	}
}
