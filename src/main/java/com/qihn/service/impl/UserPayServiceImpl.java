package com.qihn.service.impl;

import com.qihn.dao.UserPayDAO;
import com.qihn.pojo.UserPay;
import com.qihn.pojo.UserPay;
import com.qihn.service.UserPayService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("userPayService")
public class UserPayServiceImpl extends BaseServiceImpl<UserPay> implements UserPayService {

    private static Log log = LogFactory.getLog(UserPayServiceImpl.class);
    @Resource(name="userPayDAO")
    private UserPayDAO userPayDAO;
    @Override
    public void batchDelete(Class<UserPay> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.userPayDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(UserPay entity) {
        // TODO Auto-generated method stub
        return this.userPayDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<UserPay> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.userPayDAO.delete(entityClass, id);
    }

    @Override
    public void delete(UserPay entity) {
        // TODO Auto-generated method stub
        this.userPayDAO.delete(entity);
    }

    @Override
    public List<UserPay> findAll(Class<UserPay> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.userPayDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.userPayDAO.findByHql(hql, params);
    }

    @Override
    public UserPay findById(Class<UserPay> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.userPayDAO.findById(entityClass, id);
    }

    @Override
    public List<UserPay> findByProperties(UserPay entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.userPayDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public UserPay findByProperties(UserPay entity) {
        // TODO Auto-generated method stub
        return this.userPayDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.userPayDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(UserPay entity) {
        // TODO Auto-generated method stub
        this.userPayDAO.merge(entity);
    }

    @Override
    public void save(UserPay entity) {
        // TODO Auto-generated method stub
        this.userPayDAO.save(entity);
    }

    @Override
    public void update(UserPay entity) {
        // TODO Auto-generated method stub
        this.userPayDAO.update(entity);
    }

}
