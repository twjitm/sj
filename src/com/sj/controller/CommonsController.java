package com.sj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sj.base.BaseController;
import com.sj.entity.Commons;
import com.sj.entity.User;
import com.sj.service.ICommonsService;
@Controller
@RequestMapping("commons")
public class CommonsController extends BaseController {
	@Resource
	private ICommonsService commounsService;
	
	//添加评论
	@RequestMapping("add")
	@ResponseBody
public List<Commons>add(HttpServletRequest request,Integer id,Integer type,String context){
		Commons commons =new Commons();
		commons.setComContext(context);
		Date date=new Date();
		SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        commons.setComTime(format.format(date));
        User user=getconcurrentUser(request);
        commons.setUserAccount(user.getUrAccess());
        commons.setEntityId(id);
        commons.setComType(type);
		commounsService.save(commons);
	return commounsService.getAll(Commons.class);
	}

}
