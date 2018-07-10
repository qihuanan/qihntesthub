package com.qihn.dao;

import com.qihn.utils.PageInfo;

import java.io.Serializable;
import java.util.List;
import java.util.Map;


public interface BaseDao<T> {

	/**
	 * 增加、修改实体方法。
	 * @param entity
	 */
	public void merge(T entity) ;

	public void save(T entity);

	public void update(T entity);

	/**
	 * 此方法支持hibernate 配置的级联删除
	 * @param entity
	 */
	public void delete(T entity);

	/**
	 * 删除实体 根据 id 此方法不支持 hibernate 配置的级联删除
	 * @param entityClass
	 * @param id
	 */
	public void delete(Class<T> entityClass, Serializable id);

	/**
	 * 批量删除实体。
	 * @param entityClass
	 * @param ids
	 */
	public void batchDelete(Class<T> entityClass, String ids);
	
	public void batchSave(List<T> list);

	/**
	 * 查询所有实体。
	 * @param entityClass：实体对象
	 * @param orderby：对象属性
	 * @param upDown： asc 或 desc
	 * @return
	 */
	public List<T> findAll(Class<T> entityClass, String orderby, String upDown);

	/**
	 * 根据实体属性查询符合条件的实体集合
	 * @param entity
	 * @param pageInfo
	 * @param number
	 * @param orderby：对象属性，支持级联的、对象级别的属性。
	 * @param upDown： asc 或 desc 空 或 null 则底层按默认排序
	 * @return
	 */
	public List<T> findByProperties(T entity, PageInfo pageInfo, Integer number, String orderby, String upDown);
	

	/**
	 * 根据实体属性查询符合条件的实体个数、返回总记录数
	 * @param entity
	 * @return
	 */
	public Long countByProperties(T entity);

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
	 * 原始SQL 查询
	 * @param hql
	 * @param params
	 * @return
	 */
	public List<Object> findBySQL(final String sql, final Map<String, Object> params);

	/**
	 * 底层实现接口、一般用户不需调用此方法。
	 * @param hql
	 * @param params
	 * @param pageInfo
	 * @return
	 */
	public List<T> find(final String hql, final Map<String, Object> params, final PageInfo pageInfo, final Integer number);

	/**
	 * 底层HQL 拼装方法、一般用户不需调用此方法。
	 * @param entity
	 * @return
	 */
	public Map<String, Object> buildHQL(T entity);

	/**
	 * 底层实现接口、一般用户不需调用此方法。返回总记录数.
	 * @param hql
	 * @param params
	 * @param pageInfo
	 * @return
	 */
	public Long count(final String hql, final Map<String, Object> params);
	
	/**
	 * 执行本身的hql 语句
	 * @param hql
	 * @return 最后修改：Dec 15, 2011 8:23:28 PM qihn
	 */
	public List<Object> findByHql(final String hql, final Map<String, Object> params);

}
