package com.qihn.service.impl;

import com.qihn.dao.MessageDAO;
import com.qihn.pojo.Message;
import com.qihn.pojo.Message;
import com.qihn.service.BaseService;
import com.qihn.service.MessageService;
import com.qihn.utils.PageInfo;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {

    private static Log log = LogFactory.getLog(MessageServiceImpl.class);
    @Resource(name="messageDAO")
    private MessageDAO messageDAO;
    @Override
    public void batchDelete(Class<Message> entityClass, String ids) {
        // TODO Auto-generated method stub
        this.messageDAO.batchDelete(entityClass, ids);
    }

    @Override
    public Long countByProperties(Message entity) {
        // TODO Auto-generated method stub
        return this.messageDAO.countByProperties(entity);
    }

    @Override
    public void delete(Class<Message> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        this.messageDAO.delete(entityClass, id);
    }

    @Override
    public void delete(Message entity) {
        // TODO Auto-generated method stub
        this.messageDAO.delete(entity);
    }

    @Override
    public List<Message> findAll(Class<Message> entityClass, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.messageDAO.findAll(entityClass, orderby, upDown);
    }

    @Override
    public List<Object> findByHQL(String hql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.messageDAO.findByHql(hql, params);
    }

    @Override
    public Message findById(Class<Message> entityClass, Serializable id) {
        // TODO Auto-generated method stub
        return this.messageDAO.findById(entityClass, id);
    }

    @Override
    public List<Message> findByProperties(Message entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        return this.messageDAO.findByProperties(entity, pageInfo, number, orderby, upDown);
    }

    @Override
    public Message findByProperties(Message entity) {
        // TODO Auto-generated method stub
        return this.messageDAO.findByProperties(entity);
    }

    @Override
    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return this.messageDAO.findBySQL(sql, params);
    }

    @Override
    public void merge(Message entity) {
        // TODO Auto-generated method stub
        this.messageDAO.merge(entity);
    }

    @Override
    public void save(Message entity) {
        // TODO Auto-generated method stub
        this.messageDAO.save(entity);
    }

    @Override
    public void update(Message entity) {
        // TODO Auto-generated method stub
        this.messageDAO.update(entity);
    }
}
