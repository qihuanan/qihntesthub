package com.qihn.controller;

import com.qihn.pojo.Goods;
import com.qihn.utils.JSONUtils;
import com.qihn.utils.Utils;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.internal.util.StringUtils;
import com.taobao.api.request.*;
import com.taobao.api.response.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class TaobaoController {
    private static Log log = LogFactory.getLog(TaobaoController.class);
    //https://eco.taobao.com/router/rest
    //http://gw.api.taobao.com/router/rest
   static String url = "https://eco.taobao.com/router/rest";
   static String appkey = "24959069";
   static String secret = "7a89f63c329248a86f515d29a362d038";
   static String sessionKey = Utils.getProperty2("sessionKey_tb2");// "610060001b09b4d1be9f3f4342fbff666f9fb5bed26d3d0361069958";//sessionkey（accesstoken）
   static String refresh_token =Utils.getProperty2("refresh_token_tb2");// "6101a0001cbe80831959495e02401e7d688588f4703b638361069958";
    //mm_15225015_46756201_1652820187
   static long site_id = 46756201l;
   static long adzone_id = 1652820187l;

    public static void main(String[] args) {
        try {//
            TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
            TbkJuTqgGetRequest req = new TbkJuTqgGetRequest();
            req.setAdzoneId(adzone_id);
            req.setFields("click_url,pic_url,reserve_price,zk_final_price,total_amount,sold_num,title,category_name,start_time,end_time");
            req.setStartTime(StringUtils.parseDateTime(Utils.getDate2(0,0,0)+" 00:00:00" ));
            req.setEndTime(StringUtils.parseDateTime(Utils.getDate2(0,0,0)+" 23:59:59" ));
            log.info("start "+ Utils.getDate5(-2) + " "+ Utils.getDate5(6));
            req.setPageNo(1L);
            req.setPageSize(96L);
            TbkJuTqgGetResponse rsp = client.execute(req);
            System.out.println(rsp.getBody());
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    /**
     * 淘抢购
     * @param goods
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/tbs/tqg", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView taoqianggou(@ModelAttribute("goods") Goods goods, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkJuTqgGetRequest req = new TbkJuTqgGetRequest();
        req.setAdzoneId(adzone_id);
        req.setFields("click_url,pic_url,reserve_price,zk_final_price,total_amount,sold_num,title,category_name,start_time,end_time");
        req.setStartTime(StringUtils.parseDateTime(Utils.getDate2(0,0,0)+" 00:00:00" ));
        req.setEndTime(StringUtils.parseDateTime(Utils.getDate2(0,0,0)+" 23:59:59" ));
        if(Utils.isNotNullOrEmpty(goods) && goods.getRecpoint().equals("1") ){
            req.setStartTime(StringUtils.parseDateTime(Utils.getDate2(0,0,1)+" 00:00:00" ));
            req.setEndTime(StringUtils.parseDateTime(Utils.getDate2(0,0,1)+" 23:59:59" ));
        }
        req.setPageNo(1L);
        req.setPageSize(96L);
        TbkJuTqgGetResponse rsp = client.execute(req);
        List list = rsp.getResults();
        mv.addObject("list", list);
        mv.setViewName("web/webtbtqg");
        return mv;
    }

        @RequestMapping(value = "/tbs", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView searchtb(@ModelAttribute("goods") Goods goods, HttpServletRequest request) throws Exception{

        ModelAndView mv = new ModelAndView();
        if(goods==null || Utils.isNullorEmpty(goods.getName())){
            goods = new Goods();
            goods.setName("女装");
            String huashu = (String)request.getSession().getServletContext().getAttribute("huashu");
            if(Utils.isNullorEmpty(huashu)){
                huashu = "女装,男装,零食,饮料";
            }
            String [] arr = huashu.split(",");
            int i = (int) (Math.random() * arr.length);
            goods.setName(arr[i]);
        }
        boolean istmall = Utils.isNotNullOrEmpty(goods.getRecpoint()) && goods.getRecpoint().equals("1");
        TbkScMaterialOptionalResponse rsp = this.superS(goods.getName(),goods.getOrderby(),istmall);
        if(rsp!=null && rsp.getResultList()!=null && rsp.getResultList().size()>0){
            mv.addObject("list", rsp.getResultList());
            //log.info("list: "+JSONUtils.toJSON(rsp.getResultList()));
        }else{
            mv.addObject("list", rsp.getResultList());
            //log.info("list: "+ rsp.getBody());
        }
        mv.setViewName("web/webtb");
        return mv;
    }

    //排序_des（降序），排序_asc（升序），销量（total_sales），淘客佣金比率（tk_rate），
    // 累计推广量（tk_total_sales），总支出佣金（tk_total_commi），价格（price）
    public TbkScMaterialOptionalResponse superS(String q,String orderby,boolean tmall){
        try {
            TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
            TbkScMaterialOptionalRequest req = new TbkScMaterialOptionalRequest();
            //req.setStartDsr(10L);
            req.setPageSize(50L);
            //req.setPageNo(1L);
            req.setPlatform(2L);
            //req.setEndTkRate(1234L);
            //req.setStartTkRate(1234L);
            //req.setEndPrice(10L);
            //req.setStartPrice(10L);
            //req.setIsOverseas(false);
            req.setIsTmall(tmall);
            req.setSort(orderby);
            //req.setItemloc("杭州");
            //req.setCat("16,18");
            req.setQ(q);
            req.setAdzoneId(adzone_id);
            req.setSiteId(site_id);
            //req.setHasCoupon(false);
            //req.setIp("13.2.33.4");
            //req.setIncludeRfdRate(true);
            //req.setIncludeGoodRate(true);
            //req.setIncludePayRate30(true);
            //req.setNeedPrepay(true);
            req.setNeedFreeShipment(true);
            //req.setNpxLevel(2L);
            TbkScMaterialOptionalResponse rsp = client.execute(req, sessionKey);
            //System.out.println(rsp.getBody());
            //System.out.println(JSONUtils.toJSON(rsp.getResultList()) );
            return  rsp;
        }catch (Exception e){

        }

        return null;
    }



    public static void refreshTBtokenAndset(){
        try {//
            String res = getRefreshtoken();
            JSONObject json = new JSONObject(res);
            Map map = JSONUtils.fromJson(json.getJSONObject("top_auth_token_refresh_response").getString("token_result"),Map.class);
            String filepath = Utils.getPropertyFilepath();
            String access_token = map.get("access_token").toString();
            String refreshtoken = map.get("refresh_token").toString();
            log.info("更新tbkey前 "+sessionKey + refresh_token);
            sessionKey = access_token;
            refresh_token = refreshtoken;
            Utils.updateProperties(filepath,"sessionKey_tb2",map.get("access_token").toString() );
            Utils.updateProperties(filepath,"refresh_token_tb2",map.get("refresh_token").toString() );
            log.info("更新tbkey后 "+sessionKey + refresh_token);

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static String getRefreshtoken() throws Exception{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TopAuthTokenRefreshRequest req = new TopAuthTokenRefreshRequest();
        req.setRefreshToken(refresh_token);
        TopAuthTokenRefreshResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
        return rsp.getBody();
    }



    public void coupon()throws Exception{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkDgItemCouponGetRequest req = new TbkDgItemCouponGetRequest();
        req.setAdzoneId(adzone_id);
        req.setPlatform(2L);
        //req.setCat("16,18");
        req.setPageSize(1L);
        req.setQ("女装");
        req.setPageNo(1L);
        TbkDgItemCouponGetResponse rsp = client.execute(req);
        System.out.println(JSONUtils.toJSON(rsp));
    }










}
