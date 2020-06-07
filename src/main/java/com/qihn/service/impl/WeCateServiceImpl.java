package com.qihn.service.impl;

import com.qihn.dao.WeCateDAO;
import com.qihn.pojo.WeCate;
import com.qihn.pojo.WeCate;
import com.qihn.service.WeCateService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("weCateService")
public class WeCateServiceImpl extends BaseServiceImpl<WeCate> implements WeCateService {



    private static Log log = LogFactory.getLog(WeCateServiceImpl.class);
    @Resource(name="weCateDAO")
    private WeCateDAO weCateDAO;
    @Override
    public void batchDelete(Class<WeCate> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.weCateDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(WeCate entity) {
        // TODO Auto-generated method stub
        return this.weCateDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<WeCate> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.weCateDAO.delete(entityClass, id);
    }

    @Override
    public void delete(WeCate entity) {
        // TODO Auto-generated method stub
        this.weCateDAO.delete(entity);
    }

    @Override
    public List<WeCate> findAll(Class<WeCate> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weCateDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weCateDAO.findByHql(hql, params);
    }

    @Override
    public WeCate findById(Class<WeCate> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.weCateDAO.findById(entityClass, id);
    }

    @Override
    public List<WeCate> findByProperties(WeCate entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weCateDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public WeCate findByProperties(WeCate entity) {
        // TODO Auto-generated method stub
        return this.weCateDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weCateDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(WeCate entity) {
        // TODO Auto-generated method stub
        this.weCateDAO.merge(entity);
    }

    @Override
    public void save(WeCate entity) {
        // TODO Auto-generated method stub
        this.weCateDAO.save(entity);
    }

    @Override
    public void update(WeCate entity) {
        // TODO Auto-generated method stub
        this.weCateDAO.update(entity);
    }

}


