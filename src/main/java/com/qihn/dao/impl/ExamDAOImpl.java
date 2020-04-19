package com.qihn.dao.impl;

import com.qihn.dao.ExamDAO;
import com.qihn.pojo.Exam;
import com.qihn.pojo.Exam;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.hibernate.SQLQuery;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("examDAO")
public class ExamDAOImpl extends BaseDaoImpl<Exam> implements ExamDAO {


    /**
     * 构建用户查询条件信息。
     */
    @Override
    public Map<String, Object> buildHQL(Exam entity) {
        // TODO Auto-generated method stub1
        Map<String, Object> params = new HashMap<String, Object>();
        StringBuffer hql = new StringBuffer();
        if(Utils.isNotNullOrEmpty(entity)){

            if(Utils.isNotNullOrEmpty(entity.getId())){
                hql.append(" and c.id =:id");
                params.put("id", entity.getId());
            }else{

                if(Utils.isNotNullOrEmpty(entity.getPointid())){
                    hql.append(" and c.pointid =:getPointid");
                    params.put("getPointid", entity.getPointid());
                }


            }
        }
        Map<String, Object> returnMap = new HashMap<String, Object>();
        returnMap.put("hql", hql);
        returnMap.put("params", params);
        return returnMap;
    }

    /**
     * 统计符合条件的用户数，复用构造的用户查询条件信息，为分页查询做数据支持
     */
    @Override
    public Long countByProperties(Exam entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = "select count(*) from Exam c where 1=1 " + hql.toString();
        return this.count(hqlStr, params);
    }

    /**
     * 执行分页查询，复用构建的用户查询条件。
     */
    @Override
    public List<Exam> findByProperties(Exam entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        hql = this.buildOrderByAscOrDesc(hql, orderby, upDown);
        String hqlStr = " from Exam c where 1=1 " + hql.toString();
        return this.find(hqlStr, params, pageInfo, number);
    }

    /**
     * 根据用户条件，查找唯一的用户信息
     */
    @Override
    public Exam findByProperties(Exam entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = " from Exam c where 1=1 " + hql.toString();
        List<Exam> tempResult = this.find(hqlStr, params, null, null);
        if (Utils.isNotNullOrEmpty(tempResult)) {
            return tempResult.get(0);
        }
        return null;
    }

    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        SQLQuery query = getCurrentSession().createSQLQuery(sql);
        query.setProperties(params);
        //log.info("sql statement operate database:"+hql);
        return query.list();
    }

}
