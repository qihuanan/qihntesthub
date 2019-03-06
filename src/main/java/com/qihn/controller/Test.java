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
import java.util.Date;
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
 * "content": "满2件，总价打8折",  3911883
 * "code": "15",
 * "content": "满199元减40元",
 */
public class Test {
    private static Log log = LogFactory.getLog(Test.class);

    public static void main(String args[]){


        String priceurl = "https://p.3.cn/prices/mgets?skuids=";
        String couponurl = "https://cd.jd.com/promotion/v2?area=1_1_1_0&shopId=4&venderId=1&cat=1%2C3%2C1&skuId=";
        StringBuffer sb = new StringBuffer();
        for(int i=154057;i<154159;i++){ // 3911880  2880530
            sb.append(i).append(",");
            if(i%10==0){
                String str =  HttpClientUtils.getDataFromUri(priceurl+sb,null);
                //log.info("url:"+sb+" "+str);
                sb = new StringBuffer();
                if(StringUtils.isNotBlank(str)){
                     JSONArray array = new JSONArray(str);
                     for(int j=0;j<array.length();j++){

                         try{
                             JSONObject json = array.getJSONObject(j);
                             if(!json.getString("p").equals("-1.00")){
                                 String skuid = json.getString("id").replace("J_","");
                                 String p = json.getString("p");
                                 Double price = Double.parseDouble(p);
                                 Double priceQuanhou = Double.parseDouble(p);//券后价
                                 Double priceLast = priceQuanhou; //券、满减后价
                                 int singleflag = 1;// 1 单件直接  0 多件凑单满减
                                 if(json.has("tpp")){
                                     String tpp = json.getString("tpp");
                                     price = Double.parseDouble(tpp);
                                     priceQuanhou = price;
                                     priceLast = priceQuanhou;
                                     Double plusp = (Double.parseDouble(p)-Double.parseDouble(tpp));
                                     Double pluszhekou = (1-plusp/priceQuanhou)*100;
                                     log.info("sku-p-tpp:"+skuid+"-价格："+ p+"-plus会员价："+ tpp+" 优惠："+ String.format("%.2f", plusp) +"元！,约"+ String.format("%.0f", pluszhekou)+"折"+" 到手价："+ tpp);
                                 }else {
                                     log.info("sku-p:"+skuid+"-"+ p);
                                 }
                                 str =  HttpClientUtils.getDataFromUri(couponurl+skuid,"gbk");
                                 //log.info("coupon:"+str);
                                 if(Utils.isNotNullOrEmpty(str)){
                                     if(!str.startsWith("{")){
                                         log.error("999999999 "+str);
                                         continue;
                                     }
                                     JSONObject promotion = new JSONObject(str);
                                     if(promotion.has("skuCoupon")){
                                         JSONArray skuCouponArray = promotion.getJSONArray("skuCoupon");
                                         for(int k=0;k<skuCouponArray.length();k++){
                                             JSONObject couponjson = skuCouponArray.getJSONObject(k);
                                             if(couponjson.has("couponType")&& couponjson.getInt("couponType")==1){
                                                log.info("coupon-discount-quota:"+couponjson.getInt("trueDiscount")+"-"+couponjson.getInt("quota") );
                                                 Double quotalong = Double.parseDouble(couponjson.getInt("quota")+"");
                                                 Double discount = Double.parseDouble(couponjson.getInt("trueDiscount")+"");
                                                if(quotalong<price){//满减可以直接使用
                                                    priceQuanhou = (price-discount);
                                                    priceLast = priceQuanhou;
                                                    Double zhekou = (1-discount/price)*100;
                                                    log.info("券后=================："+priceQuanhou +" 优惠："+ String.format("%.2f", discount) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceQuanhou );
                                                }else {//价格小于直接满减的满价
                                                    if(quotalong<=price*3){
                                                        singleflag = 0;
                                                        priceQuanhou = (price- price/quotalong*discount);
                                                        priceLast = priceQuanhou;
                                                        Double zhekou = priceQuanhou/price*100;
                                                        log.info("券后约(凑单或多件)："+String.format("%.2f", priceQuanhou) +" 优惠："+ String.format("%.2f", priceQuanhou) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceQuanhou );

                                                    }

                                                }

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
                                                        log.info("prom-code:"+pick.getString("code")+"-"+ pick.getString("content"));
                                                        String pattern = "(\\D*)(\\d+)元(\\D*)(\\d+)元(\\D*)";
                                                        Pattern r = Pattern.compile(pattern);
                                                        Matcher m = r.matcher(pick.getString("content"));
                                                        if (m.find()) {
                                                            //log.info("满减 "+m.group(2)+" "+m.group(4));
                                                            Double man = Double.parseDouble(m.group(2));
                                                            Double jian = Double.parseDouble(m.group(4));
                                                            jian = new Double(priceLast/man).intValue()*jian; //每满-减
                                                            if(price>man){
                                                                //直接减
                                                                 priceLast = priceQuanhou-jian;
                                                                Double zhekou = (1-jian/price)*100;
                                                                log.info("直接满减后=========："+String.format("%.2f", priceLast) +" 优惠："+ String.format("%.2f", jian) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceLast );
                                                            }else {
                                                                //凑单减
                                                                singleflag = 0;
                                                                 priceLast = (priceQuanhou- price*(jian/man));
                                                                Double zhekou = (1-price*(jian/man)/price)*100;
                                                                log.info("凑单满减后约："+ String.format("%.2f", priceLast) +" 优惠："+ String.format("%.2f", price*(jian/man)) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceLast );
                                                            }

                                                            //log.info("pattern: "+m.group()+" ");
                                                        }
                                                    }else if(pick.getString("code").equals("19")){
                                                        String pattern = "(\\D*)(\\d+)件(\\D*)(\\d+)折(\\D*)(\\d+)件(\\D*)(\\d+)折(\\D*)";
                                                        Pattern r = Pattern.compile(pattern);
                                                        Matcher m = r.matcher(pick.getString("content"));
                                                        if (m.find()) {
                                                            //log.info("pattern: "+m.group()+" ");
                                                            singleflag = 1;

                                                            if(m.groupCount()>6){
                                                                //log.info("多件多折 "+m.group(2)+" "+m.group(4) +" "+m.group(6)+" "+m.group(8));
                                                                Double zhe = Double.parseDouble(m.group(8));
                                                                priceLast = priceQuanhou * (zhe*0.1);
                                                                 log.info("多件折后："+ String.format("%.2f", priceLast )  +" 优惠："+ String.format("%.2f", price-priceQuanhou * (zhe*0.1) ) +"元！,约"+ String.format("%.0f", zhe)+"折"   );
                                                            }else {
                                                                if(m.group(2).equals("1")){ // 1件 x 折的情况
                                                                    singleflag = 1;
                                                                }
                                                                //log.info("多件多折 "+m.group(2)+" "+m.group(4));
                                                                Double zhe = Double.parseDouble(m.group(4));
                                                                priceLast = priceQuanhou * (zhe*0.1);
                                                                log.info("多件折后："+ String.format("%.2f",priceLast )  +" 优惠："+ String.format("%.2f", price-priceQuanhou * (zhe*0.1) ) +"元！,约"+ String.format("%.0f", zhe)+"折"   );
                                                            }

                                                        }
                                                    }else {
                                                        //log.info("prom:"+pick.getString("content"));
                                                    }

                                                }
                                            }
                                        }
                                     }


                                 }
                                 log.info("sku-price-priceLast-singleflag: "+skuid+" "+price + " "+ priceLast + " "+singleflag);
                                 log.info("");
                                 log.info("");
                             }
                         }catch (Exception e){
                            e.printStackTrace();
                         }


                     }
                }
            }

        }



    }

}
