package com.sj.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.sj.base.IBaseDao;
import com.sj.service.IBaseService;


@Service
public class BaseService<T> implements IBaseService<T> { 
    @Resource 
    IBaseDao<T> baseDao;
	@Override
	public T getEntityById( Class<T> class1,Integer id) {
		return baseDao.getEntityById(class1, id);
	}

	@Override
	public List<T> getEntityByProperty(Class<T> class1, Object obj) {
		return null;
	}

	@Override
	public void delete(T t) {
		baseDao.delete(t);
	}

	@Override
	public void update(T t) {
		baseDao.update(t);		
	}

	@Override
	public void save(T t) {
		baseDao.Save(t);		
	}

	@Override
	public List<T> getAll(Class<T> class1) {
		return baseDao.findAll(class1);
	}

	@Override
	public void deleteById( Class<T>class1,Integer id) {
		String hql="delete from "+class1.getName()+" where id="+id;
		 baseDao.delete(hql);
	}

}
