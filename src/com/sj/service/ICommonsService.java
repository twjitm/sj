package com.sj.service;

import java.util.List;

import com.sj.entity.Commons;

public interface ICommonsService extends IBaseService<Commons> {
	public List<Commons> getCommons(Integer entityId, Integer type);
}
