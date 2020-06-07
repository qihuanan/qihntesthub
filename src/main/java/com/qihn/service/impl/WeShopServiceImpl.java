package com.qihn.service.impl;

import com.qihn.dao.WeShopDAO;
import com.qihn.pojo.WeShop;
import com.qihn.pojo.WeShop;
import com.qihn.service.BaseService;
import com.qihn.service.WeShopService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("weShopService")
public class WeShopServiceImpl extends BaseServiceImpl<WeShop> implements WeShopService {

    private static Log log = LogFactory.getLog(WeShopServiceImpl.class);
    @Resource(name="weShopDAO")
    private WeShopDAO weShopDAO;
    @Override
    public void batchDelete(Class<WeShop> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.weShopDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(WeShop entity) {
        // TODO Auto-generated method stub
        return this.weShopDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<WeShop> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.weShopDAO.delete(entityClass, id);
    }

    @Override
    public void delete(WeShop entity) {
        // TODO Auto-generated method stub
        this.weShopDAO.delete(entity);
    }

    @Override
    public List<WeShop> findAll(Class<WeShop> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weShopDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weShopDAO.findByHql(hql, params);
    }

    @Override
    public WeShop findById(Class<WeShop> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.weShopDAO.findById(entityClass, id);
    }

    @Override
    public List<WeShop> findByProperties(WeShop entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.weShopDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public WeShop findByProperties(WeShop entity) {
        // TODO Auto-generated method stub
        return this.weShopDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.weShopDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(WeShop entity) {
        // TODO Auto-generated method stub
        this.weShopDAO.merge(entity);
    }

    @Override
    public void save(WeShop entity) {
        // TODO Auto-generated method stub
        this.weShopDAO.save(entity);
    }

    @Override
    public void update(WeShop entity) {
        // TODO Auto-generated method stub
        this.weShopDAO.update(entity);
    }

}

