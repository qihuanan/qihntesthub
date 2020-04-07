package com.qihn.service.impl;

import com.qihn.dao.TipUserDAO;
import com.qihn.pojo.TipUser;
import com.qihn.pojo.TipUser;
import com.qihn.service.BaseService;
import com.qihn.service.TipUserService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("tipUserService")
public class TipUserServiceImpl extends BaseServiceImpl<TipUser> implements TipUserService {



    private static Log log = LogFactory.getLog(TipUserServiceImpl.class);
    @Resource(name="tipUserDAO")
    private TipUserDAO tipUserDAO;
    @Override
    public void batchDelete(Class<TipUser> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.tipUserDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(TipUser entity) {
        // TODO Auto-generated method stub
        return this.tipUserDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<TipUser> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.tipUserDAO.delete(entityClass, id);
    }

    @Override
    public void delete(TipUser entity) {
        // TODO Auto-generated method stub
        this.tipUserDAO.delete(entity);
    }

    @Override
    public List<TipUser> findAll(Class<TipUser> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.tipUserDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.tipUserDAO.findByHql(hql, params);
    }

    @Override
    public TipUser findById(Class<TipUser> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.tipUserDAO.findById(entityClass, id);
    }

    @Override
    public List<TipUser> findByProperties(TipUser entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.tipUserDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public TipUser findByProperties(TipUser entity) {
        // TODO Auto-generated method stub
        return this.tipUserDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.tipUserDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(TipUser entity) {
        // TODO Auto-generated method stub
        this.tipUserDAO.merge(entity);
    }

    @Override
    public void save(TipUser entity) {
        // TODO Auto-generated method stub
        this.tipUserDAO.save(entity);
    }

    @Override
    public void update(TipUser entity) {
        // TODO Auto-generated method stub
        this.tipUserDAO.update(entity);
    }


}
