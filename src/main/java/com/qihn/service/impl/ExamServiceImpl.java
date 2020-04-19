package com.qihn.service.impl;

import com.qihn.dao.ExamDAO;
import com.qihn.pojo.Exam;
import com.qihn.pojo.Exam;
import com.qihn.service.ExamService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("examService")
public class ExamServiceImpl extends BaseServiceImpl<Exam> implements ExamService {


    private static Log log = LogFactory.getLog(ExamServiceImpl.class);
    @Resource(name="examDAO")
    private ExamDAO examDAO;
    @Override
    public void batchDelete(Class<Exam> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.examDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Exam entity) {
        // TODO Auto-generated method stub
        return this.examDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<Exam> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.examDAO.delete(entityClass, id);
    }

    @Override
    public void delete(Exam entity) {
        // TODO Auto-generated method stub
        this.examDAO.delete(entity);
    }

    @Override
    public List<Exam> findAll(Class<Exam> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.examDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.examDAO.findByHql(hql, params);
    }

    @Override
    public Exam findById(Class<Exam> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.examDAO.findById(entityClass, id);
    }

    @Override
    public List<Exam> findByProperties(Exam entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.examDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Exam findByProperties(Exam entity) {
        // TODO Auto-generated method stub
        return this.examDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.examDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(Exam entity) {
        // TODO Auto-generated method stub
        this.examDAO.merge(entity);
    }

    @Override
    public void save(Exam entity) {
        // TODO Auto-generated method stub
        this.examDAO.save(entity);
    }

    @Override
    public void update(Exam entity) {
        // TODO Auto-generated method stub
        this.examDAO.update(entity);
    }


}

