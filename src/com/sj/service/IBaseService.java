package com.sj.service;

import java.util.List;

import com.sj.entity.User;

public interface IBaseService<T> {
	T getEntityById(Class<T> class1, Integer id);
	public List<T> getAll(Class<T> class1);
	public List<T> getEntityByProperty(Class<T> class1,Object obj);
	public void delete(T t);
	public void update(T t);
	public void save(T t);
	public void deleteById(Class<T>class1,Integer id);
	
	

}
