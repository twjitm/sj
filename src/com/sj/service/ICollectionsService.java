package com.sj.service;

import java.util.List;

import com.sj.entity.Collections;

public interface ICollectionsService extends IBaseService<Collections>{
public List<Collections> getCollectionsByUId(Integer uId);

public Collections getCollections(Integer uId,Integer entityId, Integer type);
	
}
