package com.qihn.service.impl;

import com.qihn.controller.UserAsyncController;
import com.qihn.dao.UserDAO;
import com.qihn.pojo.User;
import com.qihn.service.BaseService;
import com.qihn.service.UserService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * Created by qihuanan on 2017/5/19.
 */
@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {
    private static Log log = LogFactory.getLog(UserServiceImpl.class);
    @Resource(name="userDAO")
    private UserDAO userDAO;
    @Override
    public void batchDelete(Class<User> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.userDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(User entity) {
        // TODO Auto-generated method stub
        return this.userDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<User> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.userDAO.delete(entityClass, id);
    }

    @Override
    public void delete(User entity) {
        // TODO Auto-generated method stub
        this.userDAO.delete(entity);
    }

    @Override
    public List<User> findAll(Class<User> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.userDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.userDAO.findByHql(hql, params);
    }

    @Override
    public User findById(Class<User> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.userDAO.findById(entityClass, id);
    }

    @Override
    public List<User> findByProperties(User entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.userDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public User findByProperties(User entity) {
        // TODO Auto-generated method stub
        return this.userDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.userDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(User entity) {
        // TODO Auto-generated method stub
        this.userDAO.merge(entity);
    }

    @Override
    public void save(User entity) {
        // TODO Auto-generated method stub
        this.userDAO.save(entity);
    }

    @Override
    public void update(User entity) {
        // TODO Auto-generated method stub
        this.userDAO.update(entity);
    }

    @Override
    public void testexception(List<User> list) throws  Exception{
        for(int i=0;i<list.size();i++){
            if(i==1){
               int j = 1/0;
            }
            this.userDAO.save(list.get(i));

        }
    }
}
