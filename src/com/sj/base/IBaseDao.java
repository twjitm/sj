package com.sj.base;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;






public interface IBaseDao<T> {
	public Serializable Save(T t);// 保存

	public T Get(String hql);// hql不带参数的获得一个T类型的对�?

	public T Get(String hql, Map<String, Object> params);// hql带参数的获得�?��T类型的对�?

	public void delete(T t);// 删除�?��T类型的对�?

	public void update(T t);// 更新�?��T类型的对�?
	/**
	 * 通过hql更新数据�?
	 * @param hql
	 */
	public void update(String hql);
	/**
	 * 通过hql删除数据
	 * @param hql
	 */

	public void delete(String hql) ;

	public void saveOrUpdate(T t);// 保存或更新一个T类型的对�?

	public List<T> find(String hql);// hql不带参数的获得多个T类型的对�?

	public List<T> find(String hql,List<Object> listPara);

	public List<T> find(String hql, Map<String, Object> params);// hql带参数的获得多个T类型的对�?

	public List<T> find(String hql, Integer page, Integer rows);// hql不带参数的获得多个T类型的对象，进行分页

	public List<T> find(String hql, Map<String, Object> params, Integer page,
			Integer rows);// hql带参数的获得多个T类型的对象，进行分页

	public Long count(String hql);// hql不带参数的获得多个T类型的对象的总记录数

	public Long count(String hql, Map<String, Object> params);// hql带参数的获得多个T类型的对象的总记录数

	/** 
	 * @param offset 从第几条记录�?��查询 
	 * @param pagesize 每页显示多少条记�?
	 *  @return 
	 */
	//public Page find(PageModel pageModel,String hql, Map<String, Object> params);
	//public Page find(PageModel pageModel,String hql);
	/**
	 * 查询�?��单独的字�?
	 * @param hql
	 * @return
	 */
	public String getField(String hql);

	public BigDecimal bigDemical(String hql);

	public int getNextId(String sequenceName);

	/**
	 * 得到符合条件的字段的集合
	 * @param hql
	 * @return
	 */
	public List<String> getFieldList(String hql);

	public String getOneField(String sql);

	/**
	 * 执行sql语句返回结果
	 * @param sql
	 * @return
	 */
	public List<T> getResult(String sql,Integer page, Integer rows);
	/**
	 * 由sql得到符合条件的数�?
	 * @param sql
	 * @return
	 */
	public List getValueOfResult(String sql);
	/**
	 * 根据id获取实体
	 * @param id
	 */

	T getEntityById(Class<T> class1, Integer id);
	List<T> findAll(Class<T> class1);
}
