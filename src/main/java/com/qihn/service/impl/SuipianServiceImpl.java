package com.qihn.service.impl;

import com.qihn.dao.SuipianDAO;
import com.qihn.pojo.Suipian;
import com.qihn.pojo.Suipian;
import com.qihn.service.SuipianService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("suipianService")
public class SuipianServiceImpl extends BaseServiceImpl<Suipian> implements SuipianService {


    private static Log log = LogFactory.getLog(SuipianServiceImpl.class);
    @Resource(name="suipianDAO")
    private SuipianDAO suipianDAO;
    @Override
    public void batchDelete(Class<Suipian> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.suipianDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Suipian entity) {
        // TODO Auto-generated method stub
        return this.suipianDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<Suipian> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.suipianDAO.delete(entityClass, id);
    }

    @Override
    public void delete(Suipian entity) {
        // TODO Auto-generated method stub
        this.suipianDAO.delete(entity);
    }

    @Override
    public List<Suipian> findAll(Class<Suipian> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.suipianDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.suipianDAO.findByHql(hql, params);
    }

    @Override
    public Suipian findById(Class<Suipian> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.suipianDAO.findById(entityClass, id);
    }

    @Override
    public List<Suipian> findByProperties(Suipian entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.suipianDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Suipian findByProperties(Suipian entity) {
        // TODO Auto-generated method stub
        return this.suipianDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.suipianDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(Suipian entity) {
        // TODO Auto-generated method stub
        this.suipianDAO.merge(entity);
    }

    @Override
    public void save(Suipian entity) {
        // TODO Auto-generated method stub
        this.suipianDAO.save(entity);
    }

    @Override
    public void update(Suipian entity) {
        // TODO Auto-generated method stub
        this.suipianDAO.update(entity);
    }

}

