package com.qihn.service.impl;

import com.qihn.service.BaseService;
import com.qihn.utils.PageInfo;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Transactional
public abstract class BaseServiceImpl<T> implements BaseService<T> {

	public abstract void delete(Class<T> entityClass, Serializable id);

	public abstract List<T> findAll(Class<T> entityClass, String orderby, String upDown);

	public abstract T findById(Class<T> entityClass, Serializable id);

	public abstract List<T> findByProperties(T entity, PageInfo pageInfo, Integer number, String orderby, String upDown);

	public abstract T findByProperties(T entity);

	public abstract void merge(T entity);

	public abstract Long countByProperties(T entity);

	public abstract void save(T entity);

	public abstract void update(T entity);

	public abstract void batchDelete(Class<T> entityClass, String ids);
	
	public abstract List<Object> findByHQL(String hql, Map<String, Object> params);
	
	public abstract void delete(T entity);
	
	public abstract List<Object> findBySQL(String sql, Map<String, Object> params);
}
