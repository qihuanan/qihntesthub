package com.qihn.service.impl;

import com.qihn.dao.LineUserDAO;
import com.qihn.pojo.LineUser;
import com.qihn.pojo.LineUser;
import com.qihn.service.LineUserService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
@Service("lineUserService")
public class LineUserServiceImpl extends BaseServiceImpl<LineUser> implements LineUserService {
    private static Log log = LogFactory.getLog(LineUserServiceImpl.class);
    @Resource(name="lineUserDAO")
    private LineUserDAO lineUserDAO;
    @Override
    public void batchDelete(Class<LineUser> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.lineUserDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(LineUser entity) {
        // TODO Auto-generated method stub
        return this.lineUserDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<LineUser> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.lineUserDAO.delete(entityClass, id);
    }

    @Override
    public void delete(LineUser entity) {
        // TODO Auto-generated method stub
        this.lineUserDAO.delete(entity);
    }

    @Override
    public List<LineUser> findAll(Class<LineUser> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.lineUserDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.lineUserDAO.findByHql(hql, params);
    }

    @Override
    public LineUser findById(Class<LineUser> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.lineUserDAO.findById(entityClass, id);
    }

    @Override
    public List<LineUser> findByProperties(LineUser entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.lineUserDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public LineUser findByProperties(LineUser entity) {
        // TODO Auto-generated method stub
        return this.lineUserDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.lineUserDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(LineUser entity) {
        // TODO Auto-generated method stub
        this.lineUserDAO.merge(entity);
    }

    @Override
    public void save(LineUser entity) {
        // TODO Auto-generated method stub
        this.lineUserDAO.save(entity);
    }

    @Override
    public void update(LineUser entity) {
        // TODO Auto-generated method stub
        this.lineUserDAO.update(entity);
    }
    
}
