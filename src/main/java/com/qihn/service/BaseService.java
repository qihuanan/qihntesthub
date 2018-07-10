package com.qihn.service;

import com.qihn.utils.PageInfo;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


public interface BaseService<T> {

	/**
	 * 增加、修改实体方法。
	 * @param entity
	 */
	public void merge(T entity);

	public void save(T entity);

	public void update(T entity);
	
	public void delete(T entity);

	/**
	 * 删除实体 根据 id
	 * @param entityClass
	 * @param id
	 */
	
	public void delete(Class<T> entityClass, Serializable id);

	/**
	 * 查询所有实体。
	 * @param entityClass：类
	 * @param orderby：对象属性，支持级联的、对象级别的属性。
	 * @param upDown： asc 或 desc 空 或 null 则底层按默认排序
	 * @return
	 */
	public List<T> findAll(Class<T> entityClass, String orderby, String upDown);

	/**
	 * 根据实体属性查询符合条件的实体集合
	 * @param entity
	 * @param pageInfo 分页对象，default: pageSize = 10;
	 * @param number   查询数量，低于pageInfo 的优先级。
	 * @param orderby：对象属性，支持级联的、对象级别的属性。
	 * @param upDown： asc 或 desc 空 或 null 则底层按默认排序
	 * @return
	 */
	public List<T> findByProperties(T entity, PageInfo pageInfo, Integer number, String orderby, String upDown);

	/**
	 * 根据实体属性查询符合条件的实体
	 * @param entity
	 * @return
	 */
	public T findByProperties(T entity);

	/**
	 * 根据ID 查找实体
	 * @param entityClass
	 * @param id
	 * @return
	 */
	public T findById(Class<T> entityClass, Serializable id);

	/**
	 * 根据实体属性查询符合条件的实体个数、返回总记录数
	 * @param entity
	 * @return
	 */
	public Long countByProperties(T entity);

	/**
	 * 批量删除实体。
	 * @param entityClass
	 * @param ids
	 */
	public void batchDelete(Class<T> entityClass, String ids);

	/**
	 * hql 拼装查询
	 * @param hql
	 * @param params
	 * @return List<Object>
	 * 2012-11-16 下午05:18:08 qihn
	 */
	public List<Object> findByHQL(String hql, Map<String, Object> params);
	
	public List<Object> findBySQL(String sql, Map<String, Object> params);
	
}
