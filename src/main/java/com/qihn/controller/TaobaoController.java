package com.qihn.controller;

import com.qihn.utils.JSONUtils;
import com.qihn.utils.Utils;
import com.taobao.api.DefaultTaobaoClient;
import com.taobao.api.TaobaoClient;
import com.taobao.api.request.*;
import com.taobao.api.response.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.util.HashMap;
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


        //new TaobaoController().daogouS();
        try {//
            //access_token: 62006000ZZ9c2291be9f3f4342fbff666f9fb5bed26d3d0361069958
            //refresh_token: 6200a009ZZf90ac5fc605c9a06cd3f836b42a2d0a5fe509361069958

            new TaobaoController().superS("手机");

            //new TaobaoController().coupon();
        }catch (Exception e){
            e.printStackTrace();
        }
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

    public void itemget() throws Exception{
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkItemGetRequest req = new TbkItemGetRequest();
        req.setFields("num_iid,title,pict_url,small_images,reserve_price,zk_final_price,user_type,provcity,item_url,seller_id,volume,nick");
        req.setQ("女装");
        //req.setCat("16");

        //req.setSort("tk_rate_des");
        req.setIsTmall(false);
        req.setIsOverseas(false);

        TbkItemGetResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
    }


    public String daogouS(){
        TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
        TbkDgMaterialOptionalRequest req = new TbkDgMaterialOptionalRequest();
        /*req.setStartDsr(10L);
        req.setPageSize(20L);
        req.setPageNo(1L);
        req.setPlatform(1L);
        req.setEndTkRate(1234L);
        req.setStartTkRate(1234L);
        req.setEndPrice(10L);
        req.setStartPrice(10L);
        req.setIsOverseas(false);
        req.setIsTmall(false);
        req.setSort("tk_rate_des");
        req.setItemloc("杭州");*/
        //req.setCat("16");
        req.setQ("裙子");
        /*req.setHasCoupon(false);
        req.setIp("13.2.33.4");*/
        req.setAdzoneId(adzone_id);
        /*req.setNeedFreeShipment(true);
        req.setNeedPrepay(true);
        req.setIncludePayRate30(true);
        req.setIncludeGoodRate(true);
        req.setIncludeRfdRate(true);
        req.setNpxLevel(2L);*/
        try {
        TbkDgMaterialOptionalResponse rsp = client.execute(req);
        System.out.println(rsp.getBody());
        }catch (Exception e){

        }
        return null;
    }

    public String superS(String q){
        try {
            TaobaoClient client = new DefaultTaobaoClient(url, appkey, secret);
            TbkScMaterialOptionalRequest req = new TbkScMaterialOptionalRequest();
            //req.setStartDsr(10L);
            //req.setPageSize(20L);
            //req.setPageNo(1L);
            req.setPlatform(2L);
            //req.setEndTkRate(1234L);
            //req.setStartTkRate(1234L);
            //req.setEndPrice(10L);
            //req.setStartPrice(10L);
            //req.setIsOverseas(false);
            //req.setIsTmall(false);
            req.setSort("total_sales");//排序_des（降序），排序_asc（升序），销量（total_sales），淘客佣金比率（tk_rate）， 累计推广量（tk_total_sales），总支出佣金（tk_total_commi），价格（price）
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
            System.out.println(rsp.getBody());


        }catch (Exception e){

        }

        return null;
    }





}
