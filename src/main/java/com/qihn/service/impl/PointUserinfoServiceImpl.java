package com.qihn.service.impl;

import com.qihn.dao.PointUserinfoDAO;
import com.qihn.pojo.PointUserinfo;
import com.qihn.service.PointUserinfoService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("pointUserinfoService")
public class PointUserinfoServiceImpl extends BaseServiceImpl<PointUserinfo> implements PointUserinfoService {

    private static Log log = LogFactory.getLog(PointUserinfoServiceImpl.class);
    @Resource(name="pointUserinfoDAO")
    private PointUserinfoDAO pointUserinfoDAO;
    @Override
    public void batchDelete(Class<PointUserinfo> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.pointUserinfoDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(PointUserinfo entity) {
        // TODO Auto-generated method stub
        return this.pointUserinfoDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<PointUserinfo> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.pointUserinfoDAO.delete(entityClass, id);
    }

    @Override
    public void delete(PointUserinfo entity) {
        // TODO Auto-generated method stub
        this.pointUserinfoDAO.delete(entity);
    }

    @Override
    public List<PointUserinfo> findAll(Class<PointUserinfo> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.pointUserinfoDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.pointUserinfoDAO.findByHql(hql, params);
    }

    @Override
    public PointUserinfo findById(Class<PointUserinfo> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.pointUserinfoDAO.findById(entityClass, id);
    }

    @Override
    public List<PointUserinfo> findByProperties(PointUserinfo entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.pointUserinfoDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public PointUserinfo findByProperties(PointUserinfo entity) {
        // TODO Auto-generated method stub
        return this.pointUserinfoDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.pointUserinfoDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(PointUserinfo entity) {
        // TODO Auto-generated method stub
        this.pointUserinfoDAO.merge(entity);
    }

    @Override
    public void save(PointUserinfo entity) {
        // TODO Auto-generated method stub
        this.pointUserinfoDAO.save(entity);
    }

    @Override
    public void update(PointUserinfo entity) {
        // TODO Auto-generated method stub
        this.pointUserinfoDAO.update(entity);
    }


}
