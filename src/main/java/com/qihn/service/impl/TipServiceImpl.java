package com.qihn.service.impl;

import com.qihn.dao.TipDAO;
import com.qihn.pojo.Tip;
import com.qihn.pojo.Tip;
import com.qihn.service.TipService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("tipService")
public class TipServiceImpl extends BaseServiceImpl<Tip> implements TipService {
    private static Log log = LogFactory.getLog(TipServiceImpl.class);
    @Resource(name="tipDAO")
    private TipDAO tipDAO;
    @Override
    public void batchDelete(Class<Tip> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.tipDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Tip entity) {
        // TODO Auto-generated method stub
        return this.tipDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<Tip> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.tipDAO.delete(entityClass, id);
    }

    @Override
    public void delete(Tip entity) {
        // TODO Auto-generated method stub
        this.tipDAO.delete(entity);
    }

    @Override
    public List<Tip> findAll(Class<Tip> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.tipDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.tipDAO.findByHql(hql, params);
    }

    @Override
    public Tip findById(Class<Tip> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.tipDAO.findById(entityClass, id);
    }

    @Override
    public List<Tip> findByProperties(Tip entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.tipDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Tip findByProperties(Tip entity) {
        // TODO Auto-generated method stub
        return this.tipDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.tipDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(Tip entity) {
        // TODO Auto-generated method stub
        this.tipDAO.merge(entity);
    }

    @Override
    public void save(Tip entity) {
        // TODO Auto-generated method stub
        this.tipDAO.save(entity);
    }

    @Override
    public void update(Tip entity) {
        // TODO Auto-generated method stub
        this.tipDAO.update(entity);
    }
    
}
