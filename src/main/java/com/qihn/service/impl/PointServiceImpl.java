package com.qihn.service.impl;

import com.qihn.dao.PointDAO;
import com.qihn.pojo.Point;
import com.qihn.service.PointService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("pointService")
public class PointServiceImpl extends BaseServiceImpl<Point> implements PointService {

    private static Log log = LogFactory.getLog(PointServiceImpl.class);
    @Resource(name="pointDAO")
    private PointDAO pointDAO;
    @Override
    public void batchDelete(Class<Point> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.pointDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Point entity) {
        // TODO Auto-generated method stub
        return this.pointDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<Point> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.pointDAO.delete(entityClass, id);
    }

    @Override
    public void delete(Point entity) {
        // TODO Auto-generated method stub
        this.pointDAO.delete(entity);
    }

    @Override
    public List<Point> findAll(Class<Point> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.pointDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.pointDAO.findByHql(hql, params);
    }

    @Override
    public Point findById(Class<Point> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.pointDAO.findById(entityClass, id);
    }

    @Override
    public List<Point> findByProperties(Point entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.pointDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Point findByProperties(Point entity) {
        // TODO Auto-generated method stub
        return this.pointDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.pointDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(Point entity) {
        // TODO Auto-generated method stub
        this.pointDAO.merge(entity);
    }

    @Override
    public void save(Point entity) {
        // TODO Auto-generated method stub
        this.pointDAO.save(entity);
    }

    @Override
    public void update(Point entity) {
        // TODO Auto-generated method stub
        this.pointDAO.update(entity);
    }


}
