package com.qihn.service.impl;

import com.qihn.dao.WeItemUserDAO;
import com.qihn.pojo.WeItemUser;
import com.qihn.pojo.WeItemUser;
import com.qihn.service.BaseService;
import com.qihn.service.WeItemUserService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("weItemUserService")
public class WeItemUserServiceImpl extends BaseServiceImpl<WeItemUser> implements WeItemUserService {


    private static Log log = LogFactory.getLog(WeItemUserServiceImpl.class);
    @Resource(name="weItemUserDAO")
    private WeItemUserDAO weItemUserDAO;
    @Override
    public void batchDelete(Class<WeItemUser> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.weItemUserDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(WeItemUser entity) {
        // TODO Auto-generated method stub
        return this.weItemUserDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<WeItemUser> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.weItemUserDAO.delete(entityClass, id);
    }

    @Override
    public void delete(WeItemUser entity) {
        // TODO Auto-generated method stub
        this.weItemUserDAO.delete(entity);
    }

    @Override
    public List<WeItemUser> findAll(Class<WeItemUser> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weItemUserDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weItemUserDAO.findByHql(hql, params);
    }

    @Override
    public WeItemUser findById(Class<WeItemUser> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.weItemUserDAO.findById(entityClass, id);
    }

    @Override
    public List<WeItemUser> findByProperties(WeItemUser entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weItemUserDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public WeItemUser findByProperties(WeItemUser entity) {
        // TODO Auto-generated method stub
        return this.weItemUserDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weItemUserDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(WeItemUser entity) {
        // TODO Auto-generated method stub
        this.weItemUserDAO.merge(entity);
    }

    @Override
    public void save(WeItemUser entity) {
        // TODO Auto-generated method stub
        this.weItemUserDAO.save(entity);
    }

    @Override
    public void update(WeItemUser entity) {
        // TODO Auto-generated method stub
        this.weItemUserDAO.update(entity);
    }

}

