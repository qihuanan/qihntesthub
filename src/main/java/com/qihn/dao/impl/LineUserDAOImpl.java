package com.qihn.dao.impl;

import com.qihn.dao.LineUserDAO;
import com.qihn.pojo.LineUser;
import com.qihn.pojo.LineUser;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("lineUserDAO")
public class LineUserDAOImpl extends BaseDaoImpl<LineUser> implements LineUserDAO {

    @Override
    public Map<String, Object> buildHQL(LineUser entity) {
        // TODO Auto-generated method stub
        Map<String, Object> params = new HashMap<String, Object>();
        StringBuffer hql = new StringBuffer();
        if(Utils.isNotNullOrEmpty(entity)){
            if(Utils.isNotNullOrEmpty(entity.getId())){
                hql.append(" and c.id =:id");
                params.put("id", entity.getId());
            }else{
                if(Utils.isNotNullOrEmpty(entity.getLineid())){
                    hql.append(" and c.lineid =:getLineid");
                    params.put("getLineid", entity.getLineid());
                }
                if(Utils.isNotNullOrEmpty(entity.getUserid())){
                    hql.append(" and c.userid =:getUserid");
                    params.put("getUserid", entity.getUserid());
                }
                if(Utils.isNotNullOrEmpty(entity.getFlag())){
                    hql.append(" and c.flag =:getFlag");
                    params.put("getFlag", entity.getFlag());
                }
                if(Utils.isNotNullOrEmpty(entity.getUser()) && Utils.isNotNullOrEmpty(entity.getUser().getName())){
                    hql.append(" and c.user.name like :name");
                    params.put("name", "%"+entity.getUser().getName()+"%");
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
    public Long countByProperties(LineUser entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = "select count(*) from LineUser c where 1=1 " + hql.toString();
        return this.count(hqlStr, params);
    }

    /**
     * 执行分页查询，复用构建的用户查询条件。
     */
    @Override
    public List<LineUser> findByProperties(LineUser entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        hql = this.buildOrderByAscOrDesc(hql, orderby, upDown);
        String hqlStr = " from LineUser c where 1=1 " + hql.toString();
        return this.find(hqlStr, params, pageInfo, number);
    }

    /**
     * 根据用户条件，查找唯一的用户信息
     */
    @Override
    public LineUser findByProperties(LineUser entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = " from LineUser c where 1=1 " + hql.toString();
        List<LineUser> tempResult = this.find(hqlStr, params, null, null);
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
