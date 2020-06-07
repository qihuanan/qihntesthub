package com.qihn.service.impl;

import com.qihn.dao.WeItemDAO;
import com.qihn.pojo.WeItem;
import com.qihn.pojo.WeItem;
import com.qihn.service.WeItemService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("weItemService")
public class WeItemServiceImpl extends BaseServiceImpl<WeItem> implements WeItemService {



    private static Log log = LogFactory.getLog(WeItemServiceImpl.class);
    @Resource(name="weItemDAO")
    private WeItemDAO weItemDAO;
    @Override
    public void batchDelete(Class<WeItem> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.weItemDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(WeItem entity) {
        // TODO Auto-generated method stub
        return this.weItemDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<WeItem> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.weItemDAO.delete(entityClass, id);
    }

    @Override
    public void delete(WeItem entity) {
        // TODO Auto-generated method stub
        this.weItemDAO.delete(entity);
    }

    @Override
    public List<WeItem> findAll(Class<WeItem> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weItemDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weItemDAO.findByHql(hql, params);
    }

    @Override
    public WeItem findById(Class<WeItem> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.weItemDAO.findById(entityClass, id);
    }

    @Override
    public List<WeItem> findByProperties(WeItem entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weItemDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public WeItem findByProperties(WeItem entity) {
        // TODO Auto-generated method stub
        return this.weItemDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weItemDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(WeItem entity) {
        // TODO Auto-generated method stub
        this.weItemDAO.merge(entity);
    }

    @Override
    public void save(WeItem entity) {
        // TODO Auto-generated method stub
        this.weItemDAO.save(entity);
    }

    @Override
    public void update(WeItem entity) {
        // TODO Auto-generated method stub
        this.weItemDAO.update(entity);
    }

}

