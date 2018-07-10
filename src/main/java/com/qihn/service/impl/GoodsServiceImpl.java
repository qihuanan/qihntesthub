package com.qihn.service.impl;

import com.qihn.dao.GoodsDAO;
import com.qihn.pojo.Goods;
import com.qihn.service.GoodsService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;
@Service("goodsService")
public class GoodsServiceImpl extends BaseServiceImpl<Goods> implements GoodsService {

    private static Log log = LogFactory.getLog(GoodsServiceImpl.class);
    @Resource(name="goodsDAO")
    private GoodsDAO goodsDAO;
    @Override
    public void batchDelete(Class<Goods> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.goodsDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Goods entity) {
        // TODO Auto-generated method stub
        return this.goodsDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<Goods> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.goodsDAO.delete(entityClass, id);
    }

    @Override
    public void delete(Goods entity) {
        // TODO Auto-generated method stub
        this.goodsDAO.delete(entity);
    }

    @Override
    public List<Goods> findAll(Class<Goods> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.goodsDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.goodsDAO.findByHql(hql, params);
    }

    @Override
    public Goods findById(Class<Goods> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.goodsDAO.findById(entityClass, id);
    }

    @Override
    public List<Goods> findByProperties(Goods entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.goodsDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Goods findByProperties(Goods entity) {
        // TODO Auto-generated method stub
        return this.goodsDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.goodsDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(Goods entity) {
        // TODO Auto-generated method stub
        this.goodsDAO.merge(entity);
    }

    @Override
    public void save(Goods entity) {
        // TODO Auto-generated method stub
        this.goodsDAO.save(entity);
    }

    @Override
    public void update(Goods entity) {
        // TODO Auto-generated method stub
        this.goodsDAO.update(entity);
    }


}
