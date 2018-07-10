package com.qihn.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


import com.qihn.dao.BaseDao;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.*;
import org.springframework.dao.DataAccessException;
import org.springframework.orm.hibernate4.HibernateCallback;

import javax.annotation.Resource;


public abstract class BaseDaoImpl<T> implements BaseDao<T> {
	private final static Log log = LogFactory.getLog(BaseDaoImpl.class);

	public abstract List<T> findByProperties(T entity, PageInfo pageInfo, Integer number, String orderby, String upDown);

	public abstract Long countByProperties(T entity);

	public abstract T findByProperties(T entity);

	public abstract Map<String, Object> buildHQL(T entity);

	@Resource(name="sessionFactory")
	private SessionFactory sessionFactory;

	protected final Session getCurrentSession() {
		return sessionFactory.getCurrentSession();
	}

	/*
	 * 通过反射批量删除实体、ids以"-"分隔
	 * 
	 * */
	public void batchDelete(Class<T> entityClass, String ids) {
		if (Utils.isNotNullOrEmpty(ids)) {
			String[] arr = ids.split("-");
			for (int i = 0; i < arr.length; i++) {
				this.delete(entityClass, arr[i]);
			}
		}
	}
	/*
	 * 删除单个实体
	 * */
	public void delete(final Class<T> entityClass, final Serializable id) {
		String hql = "delete from " + entityClass.getName() + " c where c.id = '" + id+"'";
		log.info("method delete : " + hql);
		if (id == null)
			return ;
		int row = getCurrentSession().createQuery(hql).executeUpdate();
		if (row > 0) {
			log.info("successfully delete " + entityClass.getName() + " id = " + id + " on " + Utils.formatLongDate());
		}
		return ;
	}

	public void delete(T entity) {
		 getCurrentSession().delete(entity);
	}

	
	/*
	 * 分页查找
	 * String hql 条件
	 *  Map<String, Object> params 参数
	 *  pageInfo 分页信息
	 *  Integer number 直接查找第几页
	 * */
	@SuppressWarnings("unchecked")
	public List<T> find(final String hql, final Map<String, Object> params, final PageInfo pageInfo, final Integer number) {
		List<T> result = null;
		Query query = getCurrentSession().createQuery(hql);
		log.info("method find : " + hql);
		query.setProperties(params);
		if (pageInfo != null) {
			result = query.setFirstResult(pageInfo.getFirstResult()).setMaxResults(pageInfo.getPageSize()).list();
			//log.info("query.setFirstResult: "+pageInfo.getFirstResult());
		} else {
			//result = query.list();
			if(number==null){
				result = query.setFirstResult(0).setMaxResults(500).list();
			}else{
				result = query.setFirstResult(0).setMaxResults(number).list();
			}
			if (number != null && number != 0 && result != null) {
				if (number <= result.size())
					result = result.subList(0, number);
			}
		}
		return result;
	}

	public Long count(final String hql, final Map<String, Object> params) {
		Query query = getCurrentSession().createQuery(hql);
		log.info("method count : " + hql);
		query.setProperties(params);
		Object o = query.uniqueResult();
		if (o != null)
			return (Long) o;
		return 0l;
	}

	@SuppressWarnings("unchecked")
	public List<T> findAll(Class<T> entityClass, String orderby, String upDown) {
		if (entityClass == null)
			return null;
		StringBuffer hql = new StringBuffer();
		hql.append(" from " + entityClass.getName() + " c");
		hql = this.buildOrderByAscOrDesc(hql, orderby, upDown);
		//log.info("method findAll : " + hql);
		return  (List<T>)getCurrentSession().createQuery(hql.toString()).list();
	}

	@SuppressWarnings("unchecked")
	public T findById(Class<T> entityClass, Serializable id) {
		//log.info("method findById : " + entityClass + " : id = " + id);
		//return (T) this.getHibernateTemplate().load(entityClass, id);
		return  (T)getCurrentSession().get(entityClass,id);
	}

	@SuppressWarnings("unchecked")
	public List<Object> findSByQL(final String sql, final Map<String, Object> params) {
		//log.info("method findSQL : " + sql);
		if (Utils.isNullorEmpty(sql))
			return null;
		SQLQuery query = getCurrentSession().createSQLQuery(sql);
		query.setProperties(params);
		return query.list();
	}

	public void merge(T entity) {
		//log.info(entity.getClass().getSimpleName()+": "+entity.toString());
		log.info(entity.getClass().getSimpleName()+": "+Utils.obj2json(entity));
		getCurrentSession().merge(entity);
		//log.info("merge success!" + entity.getClass().getName());
	}

	/**
	 * 拼装 ‘排序’条件 对其进行合法性检查、增强可读性、程序健壮性、
	 * 但 orderby应为对象属性字符串、否则出现hibernate运行异常。          如果出现按照多个属性排序，则。。。。
	 * @param hql
	 * @param orderby
	 * @param upDown
	 * @return
	 */
	public StringBuffer buildOrderByAscOrDesc(StringBuffer hql, String orderby, String upDown) {
		if (Utils.isNotNullOrEmpty(orderby)) {
			hql.append(" order by c." + orderby.trim());
		}
		if (Utils.isNotNullOrEmpty(upDown)) {
			if (upDown.trim().equalsIgnoreCase("asc") || upDown.trim().equalsIgnoreCase("desc"))
				hql.append(" " + upDown.trim());
		}
		return hql;
	}

	public void save(T entity) {
		log.info(entity.getClass().getSimpleName()+": "+entity.toString());
		getCurrentSession().save(entity);
	}

	public void update(T entity) {
		//log.info(entity.getClass().getSimpleName()+": "+entity.toString());
		log.info(entity.getClass().getSimpleName()+": "+Utils.obj2json(entity));
		getCurrentSession().update(entity);
		
	}

	@SuppressWarnings("unchecked")
	public List<Object> findByHql(final String hql, final Map<String, Object> params) {
		// TODO Auto-generated method stub
		SQLQuery query = getCurrentSession().createSQLQuery(hql);
		query.setProperties(params);
		//log.info("sql statement operate database:"+hql);
		return query.list();
	}

	public void batchSave(List<T> list) {
		// TODO Auto-generated method stub
		for(T t:list){
			getCurrentSession().save(t);
		}
	}
	
	
}
