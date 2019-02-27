package com.qihn.controller;

import com.qihn.utils.HttpClientUtils;
import com.qihn.utils.JSONUtils;
import com.qihn.utils.Utils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by qihuanan on 2019/2/27 10:23
 * 100001-9999999 或 100000000001-109999999999	自营商品
 * 1000000001-1999999999 或 10000000001-99999999999	POP
 * https://p.3.cn/prices/mgets?skuids=2880540,100001
 * https://cd.jd.com/promotion/v2?callback=jQuery8145028&skuId=2880540&area=1_1_1_0&shopId=4&venderId=1&cat=1%2C3%2C1
 *
 * "code": "19",
 * "content": "满2件，总价打8折",
 * "code": "15",
 * "content": "满199元减40元",
 */
public class Test {
    private static Log log = LogFactory.getLog(Test.class);

    public static void main(String args[]){

        String priceurl = "https://p.3.cn/prices/mgets?skuids=";
        String couponurl = "https://cd.jd.com/promotion/v2?area=1_1_1_0&shopId=4&venderId=1&cat=1%2C3%2C1&skuId=";
        StringBuffer sb = new StringBuffer();
        for(int i=2880530;i<2880930;i++){
            sb.append(i).append(",");
            if(i%10==0){
                String str =  HttpClientUtils.getDataFromUri(priceurl+sb,null);
                //log.info("url:"+sb+" "+str);
                sb = new StringBuffer();
                if(StringUtils.isNotBlank(str)){
                     JSONArray array = new JSONArray(str);
                     for(int j=0;j<array.length();j++){
                         JSONObject json = array.getJSONObject(j);
                         if(!json.getString("p").equals("-1.00")){
                             String skuid = json.getString("id").replace("J_","");
                             String p = json.getString("p");
                             if(json.has("tpp")){
                                 String tpp = json.getString("tpp");
                                 log.info("sku-p-tpp:"+skuid+"-"+ p+"-"+ tpp);
                             }else {
                                 log.info("sku-p:"+skuid+"-"+ p);
                             }
                             str =  HttpClientUtils.getDataFromUri(couponurl+skuid,"gbk");
                             //log.info("coupon:"+str);
                             if(Utils.isNotNullOrEmpty(str)){
                                 JSONObject promotion = new JSONObject(str);
                                 if(promotion.has("skuCoupon")){
                                     JSONArray skuCouponArray = promotion.getJSONArray("skuCoupon");
                                     for(int k=0;k<skuCouponArray.length();k++){
                                         JSONObject couponjson = skuCouponArray.getJSONObject(k);
                                         if(couponjson.has("couponType")&& couponjson.getInt("couponType")==1){
                                            log.info("coupon-discount-quota:"+couponjson.getInt("trueDiscount")+"-"+couponjson.getInt("quota") );
                                         }

                                     }
                                 }

                                 if(promotion.has("prom")){
                                    JSONObject prom =  promotion.getJSONObject("prom");
                                    if(prom!=null && prom.has("pickOneTag")){
                                        JSONArray pickArray = prom.getJSONArray("pickOneTag");
                                        if(pickArray.length()>0){
                                            for(int l=0;l<pickArray.length();l++){
                                                JSONObject pick = pickArray.getJSONObject(l);
                                                log.info("prom-code:"+pick.getString("code")+"-"+ pick.getString("content"));
                                                if(pick.getString("code").equals("15")){
                                                    //log.info("prom-code:"+pick.getString("code")+"-"+ pick.getString("content"));
                                                    String pattern = "(\\D*)(\\d+)(\\D*)(\\d+)(\\D*)";
                                                    Pattern r = Pattern.compile(pattern);
                                                    // 现在创建 matcher 对象
                                                    Matcher m = r.matcher(pick.getString("content"));
                                                    if (m.find()) {
                                                        log.info("满减 "+m.group(2)+" "+m.group(4));
                                                    }

                                                    log.info("pattern: "+m.group()+" ");
                                                }else if(pick.getString("code").equals("19")){
                                                    //log.info("prom:"+pick.getString("content"));
                                                }else {
                                                    //log.info("prom:"+pick.getString("content"));
                                                }



                                            }
                                        }
                                    }
                                 }


                             }
                             log.info("");
                         }
                     }
                }
            }

        }



    }

}
