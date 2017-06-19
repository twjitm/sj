package com.sj.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.dao.ICommonsDao;
import com.sj.entity.Commons;
import com.sj.service.ICommonsService;
@Service
public class CommonsService extends BaseService<Commons> implements ICommonsService {
 @Resource
	private ICommonsDao commonsDao;
	
	@Override
	public List<Commons> getCommons(Integer entityId, Integer type) {
		return commonsDao.getCommons(entityId, type);
	}

}
