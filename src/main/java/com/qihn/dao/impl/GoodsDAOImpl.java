package com.qihn.dao.impl;

import com.qihn.dao.GoodsDAO;
import com.qihn.pojo.Goods;
import com.qihn.pojo.Goods;
import com.qihn.utils.PageInfo;
import com.qihn.utils.Utils;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository("goodsDAO")
public class GoodsDAOImpl extends BaseDaoImpl<Goods> implements GoodsDAO {

    /**
     * 构建用户查询条件信息。
     */
    @Override
    public Map<String, Object> buildHQL(Goods entity) {
        // TODO Auto-generated method stub1
        Map<String, Object> params = new HashMap<String, Object>();
        StringBuffer hql = new StringBuffer();
        if(Utils.isNotNullOrEmpty(entity)){
            if(Utils.isNotNullOrEmpty(entity.getId())){
                hql.append(" and c.id =:id");
                params.put("id", entity.getId());
            }else if(Utils.isNotNullOrEmpty(entity.getUpdatetime())){
                hql.append(" and c.updatetime =:updatetime");
                params.put("updatetime", entity.getUpdatetime());
            }else{
                if(Utils.isNotNullOrEmpty(entity.getSkuid())) {
                    hql.append(" and c.skuid =:getSkuid");
                    params.put("getSkuid", entity.getSkuid());
                }
                if(Utils.isNotNullOrEmpty(entity.getDomain())) {
                    hql.append(" and c.domain =:getDomain");
                    params.put("getDomain", entity.getDomain());
                }
                if(Utils.isNotNullOrEmpty(entity.getCid3())) {
                    hql.append(" and c.cid3 =:getCid3");
                    params.put("getCid3", entity.getCid3());
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
    public Long countByProperties(Goods entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = "select count(*) from Goods c where 1=1 " + hql.toString();
        return this.count(hqlStr, params);
    }

    /**
     * 执行分页查询，复用构建的用户查询条件。
     */
    @Override
    public List<Goods> findByProperties(Goods entity, PageInfo pageInfo, Integer number, String orderby, String upDown) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        hql = this.buildOrderByAscOrDesc(hql, orderby, upDown);
        String hqlStr = " from Goods c where 1=1 " + hql.toString();
        return this.find(hqlStr, params, pageInfo, number);
    }

    /**
     * 根据用户条件，查找唯一的用户信息
     */
    @Override
    public Goods findByProperties(Goods entity) {
        // TODO Auto-generated method stub
        Map<String, Object> returnMap = this.buildHQL(entity);
        StringBuffer hql = (StringBuffer) returnMap.get("hql");
        Map<String, Object> params = (Map<String, Object>) returnMap.get("params");
        String hqlStr = " from Goods c where 1=1 " + hql.toString();
        List<Goods> tempResult = this.find(hqlStr, params, null, null);
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
