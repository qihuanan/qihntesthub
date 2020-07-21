package com.qihn.dao.impl;

import com.qihn.dao.WeItemUserDAO;
import com.qihn.pojo.WeItemUser;
import com.qihn.pojo.WeItemUser;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("weItemUserDAO")
public class WeItemUserDAOImpl extends BaseDaoImpl<WeItemUser> implements WeItemUserDAO {


    @Override
    public Map<String, Object> buildHQL(WeItemUser entity) {
        // TODO Auto-generated method stub
        Map<String, Object> params = new HashMap<String, Object>();
        StringBuffer hql = new StringBuffer();
        if(Utils.isNotNullOrEmpty(entity)){
            if(Utils.isNotNullOrEmpty(entity.getId())){
                hql.append(" and c.id =:id");
                params.put("id", entity.getId());
            }else{
                if(Utils.isNotNullOrEmpty(entity.getUserid())){
                    hql.append(" and c.userid =:getUserid");
                    params.put("getUserid", entity.getUserid());
                }
                if(Utils.isNotNullOrEmpty(entity.getWeItemid())){
                    hql.append(" and c.weItemid =:getWeItemid");
                    params.put("getWeItemid", entity.getWeItemid());
                }
                if(Utils.isNotNullOrEmpty(entity.getCate())){
                    hql.append(" and c.cate =:getCate");
                    params.put("getCate", entity.getCate());
                }
                if(Utils.isNotNullOrEmpty(entity.getSelected())){
                    hql.append(" and c.selected =:getSelected");
                    params.put("getSelected", entity.getSelected());
                }
                if(Utils.isNotNullOrEmpty(entity.getYudingdate())){
                    hql.append(" and c.yudingdate =:getYudingdate");
                    params.put("getYudingdate", entity.getYudingdate());
                }
                if(Utils.isNotNullOrEmpty(entity.getQuhuodate())){
                    hql.append(" and c.quhuodate =:getQuhuodate");
                    params.put("getQuhuodate", entity.getQuhuodate());
                }
                if(Utils.isNotNullOrEmpty(entity.getName())){
                    hql.append(" and c.name like :name");
                    params.put("name", "%"+entity.getName()+"%");
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
    public Long countByProperties(WeItemUser entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = "select count(*) from WeItemUser c where 1=1 " + hql.toString();
        return this.count(hqlStr, params);
    }

    /**
     * 执行分页查询，复用构建的用户查询条件。
     */
    @Override
    public List<WeItemUser> findByProperties(WeItemUser entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        hql = this.buildOrderByAscOrDesc(hql, orderby, upDown);
        String hqlStr = " from WeItemUser c where 1=1 " + hql.toString();
        return this.find(hqlStr, params, pageInfo, number);
    }

    /**
     * 根据用户条件，查找唯一的用户信息
     */
    @Override
    public WeItemUser findByProperties(WeItemUser entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = " from WeItemUser c where 1=1 " + hql.toString();
        List<WeItemUser> tempResult = this.find(hqlStr, params, null, null);
        if (Utils.isNotNullOrEmpty(tempResult)) {
            return tempResult.get(0);
        }
        return null;
    }

    public List<Object> findBySQL(String sql, Map<String, Object> params) {
        // TODO Auto-generated method stub
        return null;
    }

}

