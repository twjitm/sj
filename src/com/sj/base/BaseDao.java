package com.sj.base;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class BaseDao<T> implements IBaseDao<T> {
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public Serializable Save(T t) {
		return this.getCurrentSession().save(t);
	}

	@Override
	public T Get(String hql) {
		Query query = this.getCurrentSession().createQuery(hql);
		List<T> l = query.list();
		if (l != null && l.size() > 0) {
			return l.get(0);
		}
		return null;
	}

	@Override
	public T Get(String hql, Map<String, Object> params) {

		Query query = this.getCurrentSession().createQuery(hql);

		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				query.setParameter(key, params.get(key));
			}
		}

		List<T> l = query.list();
		if (l != null && l.size() > 0) {
			return l.get(0);
		}

		return null;
	}

	@Override
	public void delete(T t) {
		this.getCurrentSession().delete(t);
		//this.getCurrentSession().flush();

	}

	@Override
	public void update(T t) {
		this.getCurrentSession().merge(t);
		//this.getCurrentSession().;

	}

	@Override
	public void delete(String hql) {
		update(hql);

	}

	@Override
	public void update(String hql) {
		Query query = this.getCurrentSession().createQuery(hql);
		query.executeUpdate();
		this.getCurrentSession().flush();
	}

	@Override
	public void saveOrUpdate(T t) {
		this.getCurrentSession().saveOrUpdate(t);

	}

	@Override
	public List<T> find(String hql) {
		Query query = this.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	public List<T> find(String hql, Map<String, Object> params) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				query.setParameter(key, params.get(key));
			}
		}
		return query.list();
	}

	@Override
	public List<T> find(String hql, Map<String, Object> params, Integer page,
			Integer rows) {
		Query query = this.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				if (params.get(key).getClass().getName()
						.equals("java.lang.String")) {
					query.setString(key, params.get(key).toString());
				} else {
					query.setParameter(key, params.get(key));
				}

			}
		}
		return query.setFirstResult((page - 1) * rows).setMaxResults(rows)
				.list();
	}

	@Override
	public List<T> find(String hql, Integer page, Integer rows) {
		Query query = this.getCurrentSession().createQuery(hql);
		return query.setFirstResult((page - 1) * rows).setMaxResults(rows)
				.list();
	}

	@Override
	public Long count(String hql) {
		Query query = this.getCurrentSession().createQuery(hql);
		return ((Number) query.uniqueResult()).longValue();
	}

	@Override
	public String getField(String hql) {
		Query query = this.getCurrentSession().createQuery(hql);
		return (String) query.list().get(0);
	}

	@Override
	public List<String> getFieldList(String hql) {
		Query query = this.getCurrentSession().createQuery(hql);
		return query.list();
	}

	@Override
	public Long count(String hql, Map<String, Object> params) {

		Query query = this.getCurrentSession().createQuery(hql);
		if (params != null && !params.isEmpty()) {
			for (String key : params.keySet()) {
				if (params.get(key).getClass().getName()
						.equals("java.lang.String")) {
					query.setString(key, params.get(key).toString());
				} else {
					query.setParameter(key, params.get(key));
				}
			}
		}
		return ((Number) query.uniqueResult()).longValue();
	}

	@Override
	public BigDecimal bigDemical(String sql) {
		SQLQuery query = this.getCurrentSession().createSQLQuery(sql);
		return (BigDecimal) query.list().get(0);
	}

	@Override
	public List<T> find(String hql, List<Object> listPara) {
		// TODO Auto-generated method stub
		Query query = this.getCurrentSession().createQuery(hql);
		if (listPara != null && !listPara.isEmpty()) {
			for (int i = 0; i < listPara.size(); i++) {
				query.setParameter(i, listPara.get(i));
			}
		}
		return query.list();
	}

	@Override
	public int getNextId(String sequenceName) {
		String sql = "select " + sequenceName + ".nextval from dual";
		SQLQuery query = this.getCurrentSession().createSQLQuery(sql);
		return ((BigDecimal) query.uniqueResult()).intValue();
	}

	@Override
	public String getOneField(String sql) {
		SQLQuery query = this.getCurrentSession().createSQLQuery(sql);
		return query.uniqueResult().toString();
	}

	@Override
	public List<T> getResult(String sql, Integer page, Integer rows) {
		SQLQuery query = this.getCurrentSession().createSQLQuery(sql);
		return query.setFirstResult((page - 1) * rows).setMaxResults(rows).list();
	}

	@Override
	public List getValueOfResult(String sql) {
		// TODO Auto-generated method stub
		SQLQuery query = this.getCurrentSession().createSQLQuery(sql);
		return query.list();
	}

	@Override
	public T getEntityById(Class<T>class1, Integer id) {
		String className=class1.getName();
		Query qry = this.getCurrentSession().createQuery("from "+className+" where id="+id);
		List list = qry.setMaxResults(1).list();  
		if (list.isEmpty())  
			return null;  
		return (T) list.get(0);   
	}

	@Override
	public List<T> findAll(Class<T> class1) { 
		String hql="from "+class1.getName();
		System.out.println(hql);
		Query qry=this.getCurrentSession().createQuery(hql);
		List<T> list= find(hql);
		System.out.println(list.size());
		if (list.isEmpty())  
			return null;  
		else{
			return list;  
		}
		
	}

}
