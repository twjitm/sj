package com.sj.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.dao.ICollectionsDao;
import com.sj.entity.Collections;
import com.sj.service.ICollectionsService;
@Service
public class CollectionsService extends BaseService<Collections> implements ICollectionsService{
@Resource
private ICollectionsDao collectionsDao;
	@Override
	public List<Collections> getCollectionsByUId(Integer uId) {
		String hql="from Collections where uid="+uId;
		return collectionsDao.find(hql);
	}
	@Override
	public Collections getCollections(Integer uid,Integer entityId, Integer type) {
		String hql="from Collections where uid="+uid+" and entityId="+entityId+" and type="+type;
		return collectionsDao.Get(hql);
	}

}
