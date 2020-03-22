package com.qihn.service.impl;

import com.qihn.dao.LineDAO;
import com.qihn.pojo.Line;
import com.qihn.service.LineService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("lineService")
public class LineServiceImpl extends BaseServiceImpl<Line> implements LineService {

    private static Log log = LogFactory.getLog(LineServiceImpl.class);
    @Resource(name="lineDAO")
    private LineDAO lineDao;
    @Override
    public void batchDelete(Class<Line> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.lineDao.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Line entity) {
        // TODO Auto-generated method stub
        return this.lineDao.countByProperties(entity);
    }

    @Override
    public void delete(Class<Line> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.lineDao.delete(entityClass, id);
    }

    @Override
    public void delete(Line entity) {
        // TODO Auto-generated method stub
        this.lineDao.delete(entity);
    }

    @Override
    public List<Line> findAll(Class<Line> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.lineDao.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.lineDao.findByHql(hql, params);
    }

    @Override
    public Line findById(Class<Line> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.lineDao.findById(entityClass, id);
    }

    @Override
    public List<Line> findByProperties(Line entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.lineDao.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Line findByProperties(Line entity) {
        // TODO Auto-generated method stub
        return this.lineDao.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.lineDao.findBySQL(sql, params);
    }

    @Override
    public void merge(Line entity) {
        // TODO Auto-generated method stub
        this.lineDao.merge(entity);
    }

    @Override
    public void save(Line entity) {
        // TODO Auto-generated method stub
        this.lineDao.save(entity);
    }

    @Override
    public void update(Line entity) {
        // TODO Auto-generated method stub
        this.lineDao.update(entity);
    }


}
