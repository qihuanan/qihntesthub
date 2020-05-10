package com.qihn.service.impl;

import com.qihn.dao.BaoxiangDAO;
import com.qihn.pojo.Baoxiang;
import com.qihn.pojo.Baoxiang;
import com.qihn.service.BaoxiangService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("baoxiangService")
public class BaoxiangServiceImpl extends BaseServiceImpl<Baoxiang> implements BaoxiangService {

    private static Log log = LogFactory.getLog(BaoxiangServiceImpl.class);
    @Resource(name="baoxiangDAO")
    private BaoxiangDAO baoxiangDAO;
    @Override
    public void batchDelete(Class<Baoxiang> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.baoxiangDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Baoxiang entity) {
        // TODO Auto-generated method stub
        return this.baoxiangDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<Baoxiang> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.baoxiangDAO.delete(entityClass, id);
    }

    @Override
    public void delete(Baoxiang entity) {
        // TODO Auto-generated method stub
        this.baoxiangDAO.delete(entity);
    }

    @Override
    public List<Baoxiang> findAll(Class<Baoxiang> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.baoxiangDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.baoxiangDAO.findByHql(hql, params);
    }

    @Override
    public Baoxiang findById(Class<Baoxiang> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.baoxiangDAO.findById(entityClass, id);
    }

    @Override
    public List<Baoxiang> findByProperties(Baoxiang entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.baoxiangDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Baoxiang findByProperties(Baoxiang entity) {
        // TODO Auto-generated method stub
        return this.baoxiangDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.baoxiangDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(Baoxiang entity) {
        // TODO Auto-generated method stub
        this.baoxiangDAO.merge(entity);
    }

    @Override
    public void save(Baoxiang entity) {
        // TODO Auto-generated method stub
        this.baoxiangDAO.save(entity);
    }

    @Override
    public void update(Baoxiang entity) {
        // TODO Auto-generated method stub
        this.baoxiangDAO.update(entity);
    }


}
