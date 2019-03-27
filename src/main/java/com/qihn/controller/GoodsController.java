package com.qihn.controller;

import com.qihn.pojo.Goods;
import com.qihn.pojo.User;
import com.qihn.service.GoodsService;
import com.qihn.service.GoodsService;
import com.qihn.service.UserService;
import com.qihn.utils.*;
import org.apache.commons.collections.ListUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


@Controller
@RequestMapping("/goods")
public class GoodsController extends BaseController {

    private static Log log = LogFactory.getLog(GoodsController.class);
    @Resource(name = "goodsService")
    private GoodsService goodsService;
    @Resource(name = "userService")
    private UserService userService;
    public static Map<String,Object> mmap = new HashMap<String, Object>();

    public static String runflag = "0";
    public static String updateflag = "0";

    public static String couponurl = "https://cd.jd.com/promotion/v2?area=1_1_1_0&shopId=1&cat=1%2C3%2C1&skuId=";
    public static String stockurl = "https://c.3.cn/stock?cat=1,1,1&venderId=0&area=1_1_1_1&buyNum=1&skuId=";

    public  static void main(String args[]){

        Goods goods = new Goods();
        goods.setRecpoint("http://item.jd.com/35205787401.html");

        Matcher matcher = Patterns.WEB_URL.matcher(goods.getRecpoint());
        Map<String,String> tmap = new HashMap<>();
        if (matcher.find()){
            String url = matcher.group();
            String result = goods.getRecpoint();
            System.out.println(url);
            String uuid = UUID.randomUUID().toString();
            result = result.replace(url,uuid);
            tmap.put(uuid,url);
            while (geturlfirst(result)!=null){
                 url  = geturlfirst(result);
                System.out.println(url);
                uuid = UUID.randomUUID().toString();
                result = result.replace(url,uuid);
                tmap.put(uuid,url);
            }
            System.out.println(result);
            for (Map.Entry<String, String> entry : tmap.entrySet()) {
                //resultText += "<a href=\"" + matcher.group() + "\">" + matcher.group() + "</a>";
               result = result.replace(entry.getKey(), "<a href=\"" + entry.getValue() + "\">" + entry.getValue() + "</a>");
            }
            System.out.println(result);
        }

        //System.out.println("rec:"+goods.getRecpoint());
        String url = "http://japi.jingtuitui.com/api/universal";
        String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&content="+goods.getRecpoint();
        String str =  HttpUtil.sendPost(url,data);
        System.out.println("test "+str);
        Map remap = JSONUtils.fromJson(str,Map.class);

    }


    @RequestMapping(value = "/updatepriceSingle", method = {RequestMethod.POST, RequestMethod.GET})
    public void updatepriceSingle(HttpServletRequest request) {
        long gid = new Long(request.getParameter("gid")) ;
        String priceurl = "https://px.3.cn/prices/mgets?source=wxsq&skuids=";
        String str =  HttpClientUtils.getDataFromUri(priceurl+gid,null);

        JSONArray array = null;
        if(StringUtils.isNotBlank(str)){
            try{
                array = new JSONArray(str);
            }catch (Exception e){
                log.info("url:"+priceurl+gid+" res:"+str);
                array = new JSONArray();
            }
            pricereset(array,true);
        }

    }

    @RequestMapping(value = "/updateprice", method = {RequestMethod.POST, RequestMethod.GET})
    public String updateprice(HttpServletRequest request){
        String priceurl = "https://pe.3.cn/prices/mgets?skuids=";
        updateflag =  request.getParameter("updateflag");
        String no =  request.getParameter("no");
        if(StringUtils.isEmpty(no)){
            no = "1";
        }
        if(updateflag.equals("1")){
            updateflag = "1";
            while (true && updateflag.equals("1")){
                if(!updateflag.equals("1")) break;
                List<User> list = this.userService.findByProperties(new User(),null,100,"updatetime","asc");
                if(list!=null && list.size()>0){
                    StringBuffer sb = new StringBuffer();
                    int b = 0;
                    if(no.equals("1")){

                    }
                    for(int i=0;i<list.size();i++){
                        if(!updateflag.equals("1")) break;
                       /* if(i%200==0){
                            try {
                                Thread.sleep(3000);
                            }catch (Exception e){
                            }
                            log.info("update running .... ");
                        }*/
                        sb.append(list.get(i).getGid()).append(",");
                        if(i%10==0){
                            b++;
                            if(b%4==0){
                                priceurl = "https://pe.3.cn/prices/mgets?source=wxsq&skuids=";
                            }else if(b%4==1) {
                                priceurl = "https://pm.3.cn/prices/mgets?source=wxsq&skuids=";
                            }else if(b%4==2) {
                                priceurl = "https://px.3.cn/prices/mgets?source=wxsq&skuids=";
                            }else{
                                priceurl = "https://p.3.cn/prices/mgets?source=wxsq&skuids=";
                            }
                            String str =  HttpClientUtils.getDataFromUri(priceurl+sb,null);
                            //log.info("url:"+sb+" "+str);

                            JSONArray array = null;
                            if(StringUtils.isNotBlank(str)){
                                try{
                                    array = new JSONArray(str);
                                }catch (Exception e){
                                    log.info("url:"+sb+" "+str);
                                    array = new JSONArray();
                                    try {
                                        log.info("休眠10秒");
                                        Thread.sleep(1000*1);
                                    }catch (Exception e1){
                                    }
                                    continue;
                                }
                                sb = new StringBuffer();
                                pricereset(array,false);
                            }

                        }

                    }
                }
            }

        }else{
            updateflag="0";
            log.info("update stop .... ");
        }


        return "redirect:/user/list";
    }

    @RequestMapping(value = "/getprice", method = {RequestMethod.POST, RequestMethod.GET})
    public String getprice(HttpServletRequest request){
       String run =  request.getParameter("run");
        if(run.equals("1")){
            runflag = "1";
           List<User> list = this.userService.findByProperties(new User(),null,1,"id","desc");
           if(list!=null && list.size()>0){
               if(list.get(0).getGid()!=null && list.get(0).getGid()>100000000001l){
                   this.runner(list.get(0).getGid());
               }else{
                   this.runner(100000000001l);// 100000000001   100001
               }
           }else {
               this.runner(100001);
           }

            //this.runner(600001);

        }else{
            runflag="0";
            log.info("get stop .... ");
        }


        return "redirect:/user/list";
    }


    /**
     * 100007654321l
     * 100000000001l
     * @param gid
     */
    private void runner( long gid){
        /*if(gid>9999999 || gid<100001){
            return;
        }*/
       /* if(gid>100009654321l || gid<100000000001l){
            log.info("达到最大值不执行... "+100009654321l);
            return;
        }*/

        String priceurl = "https://pe.3.cn/prices/mgets?skuids=";
        //String couponurl = "https://cd.jd.com/promotion/v2?area=1_1_1_0&shopId=4&venderId=1&cat=1%2C3%2C1&skuId=";
        StringBuffer sb = new StringBuffer();
        long a = 0;
        for(long i=gid;i<109999999999l;i++){
            if(!runflag.equals("1")){
                log.error("runflag 不执行！");
                break;
            }

            //log.info("get running .... ");

            if(i%1000==0){
                try{
                    Thread.sleep(1000*2);
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
            sb.append(i).append(",");
            if(i%10==0){
                //log.info("iiii: "+i);
                a++;
                if(a%2==0){
                    priceurl = "https://pe.3.cn/prices/mgets?source=wxsq&skuids=";
                }else {
                    priceurl = "https://px.3.cn/prices/mgets?source=wxsq&skuids=";
                }
                String str =  HttpClientUtils.getDataFromUri(priceurl+sb,null);
                log.info("url:"+sb+" "+str);

                JSONArray array = null;
                if(StringUtils.isNotBlank(str)){
                    try{
                         array = new JSONArray(str);
                    }catch (Exception e){
                        log.info("url:"+priceurl+sb+" res:"+str);
                        array = new JSONArray();
                        try {
                            log.info("休眠60秒");
                            Thread.sleep(1000*1);
                        }catch (Exception e1){
                            e.printStackTrace();
                        }

                        continue;
                    }
                    pricereset(array,false);
                }
                sb = new StringBuffer();
            }

        }

    }

    public static long cc = 0l;
    public static long get1w = 0l;
    static  long now = new Date().getTime();
    private void pricereset(JSONArray array,boolean showlog){

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
                        //log.info("sku-p-tpp:"+skuid+"-价格："+ p+"-plus会员价："+ tpp+" 优惠："+ String.format("%.2f", plusp) +"元！,约"+ String.format("%.0f", pluszhekou)+"折"+" 到手价："+ tpp);
                    }else {
                        //log.info("sku-p:"+skuid+"-"+ p);
                    }

                    int venderid = 0;
                    String stock = HttpClientUtils.getDataFromUri(stockurl+skuid,"gbk");
                    if(showlog){
                        log.info("stockurl: "+stockurl+skuid);
                        log.info("qihndebug-stock:"+stock);
                    }

                    if(stock!=null){
                        JSONObject outstockjson =null;
                        try{
                             outstockjson = new JSONObject(stock);
                        }catch (Exception e){
                            User user = new User();
                            user.setGid(Long.parseLong(skuid));
                            user = this.userService.findByProperties(user);
                            user.setUpdatetime(new Date().getTime());
                            this.userService.update(user);
                            continue;
                        }

                        if(outstockjson.has("stock")){
                            JSONObject stockjson = outstockjson.getJSONObject("stock");
                            if(stockjson.has("StockState")){
                                if(stockjson.getInt("StockState")!=33){
                                    //if(showlog)
                                        log.info("StockState != 33 ");
                                    User user = new User();
                                    user.setGid(Long.parseLong(skuid));
                                    user = this.userService.findByProperties(user);
                                    user.setUpdatetime(new Date().getTime());
                                    user.setOnsale("0");
                                    user.setZhekou(100);
                                    this.userService.update(user);
                                    continue;
                                }
                            }
                        }
                    }

                    String str =  HttpClientUtils.getDataFromUri(couponurl+skuid+"&venderId="+venderid,"gbk");
                    if(showlog){
                        log.info("url:"+couponurl+skuid+"&venderId="+venderid);
                        log.info("coupon:"+str);
                    }

                    StringBuffer couponsb = new StringBuffer("优惠：\n");
                    if(Utils.isNotNullOrEmpty(str)){
                        if(!str.startsWith("{")){
                            log.error("999999999 "+str);
                            continue;
                        }
                        JSONObject promotion = new JSONObject(str);

                        if(promotion.has("prom")){
                            JSONObject prom =  promotion.getJSONObject("prom");
                            if(prom!=null && prom.has("pickOneTag")){
                                JSONArray pickArray = prom.getJSONArray("pickOneTag");
                                if(pickArray.length()>0){
                                    for(int l=0;l<pickArray.length();l++){
                                        JSONObject pick = pickArray.getJSONObject(l);
                                        if(showlog)
                                            log.info("prom-code:"+pick.getString("code")+"-"+ pick.getString("content"));

                                        if(pick.getString("code").equals("15")){
                                            couponsb.append(pick.getString("content")).append("\n ");
                                            //log.info("prom-code:"+pick.getString("code")+"-"+ pick.getString("content"));
                                            String pattern = "(\\D*)(\\d+)元(\\D*)(\\d+)元(\\D*)";
                                            Pattern r = Pattern.compile(pattern);
                                            Matcher m = r.matcher(pick.getString("content"));
                                            if (m.find()) {
                                                //log.info("满减 "+m.group(2)+" "+m.group(4));
                                                Double man = Double.parseDouble(m.group(2));
                                                Double jian = Double.parseDouble(m.group(4));

                                                if(price>man){
                                                    //直接减
                                                    if(pick.getString("content").contains("每满")){
                                                        jian = new Double(priceLast/man).intValue()*jian; //每满-减
                                                    }else {
                                                        jian = jian;
                                                    }

                                                    priceLast = priceQuanhou-jian;
                                                    Double zhekou = (1-jian/price)*100;
                                                    if(showlog)
                                                        log.info("直接满减后=========："+String.format("%.2f", priceLast) +" 优惠："+ String.format("%.2f", jian) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceLast );
                                                }else {
                                                    //凑单减
                                                    singleflag = 0;
                                                    log.info("priceQuanhou-price-jian-man:"+ priceQuanhou+" "+price+" "+jian+" "+man );
                                                    priceLast = (priceQuanhou- price*(jian/man));
                                                    Double zhekou = (1-price*(jian/man)/price)*100;
                                                    // log.info("凑单满减后约："+ String.format("%.2f", priceLast) +" 优惠："+ String.format("%.2f", price*(jian/man)) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceLast );
                                                    if(showlog)
                                                        log.info("凑单满减： "+priceLast + " "+ zhekou);
                                                }

                                                //log.info("pattern: "+m.group()+" ");
                                            }
                                        }else if(pick.getString("code").equals("19")){
                                            couponsb.append(pick.getString("content")).append("\n ");
                                            String pattern = "(\\D*)(\\d+)件(\\D*)(\\d+)折(\\D*)(\\d+)件(\\D*)(\\d+)折(\\D*)";
                                            Pattern r = Pattern.compile(pattern);
                                            Matcher m = r.matcher(pick.getString("content"));
                                            if (m.find()) {
                                                if(showlog)
                                                    log.info("pattern: "+m.group()+" ");
                                                singleflag = 1;

                                                if(m.groupCount()>6){
                                                    //log.info("多件多折 "+m.group(2)+" "+m.group(4) +" "+m.group(6)+" "+m.group(8));
                                                    Double zhe = Double.parseDouble(m.group(8));
                                                    priceLast = priceQuanhou * (zhe*0.1);
                                                    //log.info("多件折后："+ String.format("%.2f", priceLast )  +" 优惠："+ String.format("%.2f", price-priceQuanhou * (zhe*0.1) ) +"元！,约"+ String.format("%.0f", zhe)+"折"   );
                                                    if(showlog)
                                                        log.info("多件折后： "+priceLast + " "+ zhe);
                                                }else {
                                                    if(m.group(2).equals("1")){ // 1件 x 折的情况
                                                        singleflag = 1;
                                                    }
                                                    //log.info("多件多折 "+m.group(2)+" "+m.group(4));
                                                    Double zhe = Double.parseDouble(m.group(4));
                                                    priceLast = priceQuanhou * (zhe*0.1);
                                                    if(showlog)
                                                        log.info("多件折后： "+priceLast + " "+ zhe);
                                                    //log.info("多件折后："+ String.format("%.2f",priceLast )  +" 优惠："+ String.format("%.2f", price-priceQuanhou * (zhe*0.1) ) +"元！,约"+ String.format("%.0f", zhe)+"折"   );
                                                }

                                            }
                                        }else {
                                            //log.info("prom:"+pick.getString("content"));
                                        }

                                    }
                                }
                            }
                        }


                        if(promotion.has("skuCoupon")){
                            JSONArray skuCouponArray = promotion.getJSONArray("skuCoupon");
                            double priceQuanhoutemp = priceQuanhou;//防止多个券叠加计算优惠
                            for(int k=0;k<skuCouponArray.length();k++){
                                priceQuanhou = priceQuanhoutemp;
                                JSONObject couponjson = skuCouponArray.getJSONObject(k);
                                if(couponjson.has("couponType")&& couponjson.getInt("couponType")==1){
                                    if(showlog)
                                        log.info("coupon-discount-quota:"+couponjson.getInt("trueDiscount")+"-"+couponjson.getInt("quota") );
                                    Double quotalong = Double.parseDouble(couponjson.getInt("quota")+"");
                                    Double discount = Double.parseDouble(couponjson.getInt("trueDiscount")+"");
                                    String beginTime = couponjson.getString("beginTime");
                                    String nowtime = Utils.getDate2(0,0,0);
                                    //优惠券不到使用时间的逻辑，这里如果是大额优惠券，后续可以提醒...
                                    if(beginTime.compareTo(nowtime)>0){
                                        //log.info("优惠券不到使用日期，"+beginTime);
                                        continue;
                                    }

                                    couponsb.append("券："+quotalong+ "-"+discount).append("\n");
                                    if(quotalong<price){//满减可以直接使用
                                        priceQuanhou = (price-discount);
                                        priceLast = priceQuanhou;
                                        Double zhekou = (1-discount/price)*100;
                                        if(showlog)
                                            log.info("券后===============："+priceQuanhou +" 优惠："+ String.format("%.2f", discount) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceQuanhou );
                                    }else {//优惠券 价格小于直接满减的满价
                                        if(quotalong<=price*2){
                                            singleflag = 0;
                                            priceQuanhou = priceQuanhou - priceQuanhou*(discount/quotalong);
                                            if(priceQuanhou<priceLast){
                                                priceLast = priceQuanhou;
                                            }
                                            Double zhekou = priceLast/price*100;
                                            if(showlog)
                                                log.info("价格小于直接满减的满价 "+ priceQuanhou + " "+ priceLast + " "+zhekou );
                                            //log.info("券后约(凑单或多件)："+String.format("%.2f", priceQuanhou) +" 优惠："+ String.format("%.2f", priceQuanhou) +"元！,约"+ String.format("%.0f", zhekou)+"折"+" 到手价："+ priceQuanhou );

                                        }

                                    }

                                }
                            }
                        }



                    }
                    log.info("sku-price-priceLast-singleflag: "+skuid+" "+price + " "+ priceLast + " "+singleflag);
                    //log.info("");
                    //log.info("");
                    User user = new User();
                    user.setGid(Long.parseLong(skuid));
                    user = this.userService.findByProperties(user);
                    if(user==null){
                        user = new User();
                        user.setGid(Long.parseLong(skuid));
                    }
                    user.setOneflag(singleflag);
                    user.setPrice(price.intValue());

                    user.setUpdatetime(new Date().getTime() );
                    user.setCouponprom(couponsb.toString());
                    user.setOnsale("1");

                    if(user.getId()==null){
                        user.setPrice3(priceLast.intValue()==0?1:priceLast.intValue());
                        user.setPrice2(user.getPrice3());
                        user.setZhekou(100 );
                        user.setYouhui(0);
                        user.setPricelowest(priceLast.intValue());
                        this.userService.save(user);
                    }else {
                        user.setPrice2(user.getPrice3());
                        user.setPrice3(priceLast.intValue()==0?1:priceLast.intValue());
                        //user.setZhekou(new Double(priceLast/price*100).intValue() );
                        //user.setYouhui(price.intValue()-priceLast.intValue());
                        user.setZhekou(new Double(new Double(user.getPrice3())/new Double(user.getPrice2())*100).intValue() );
                        user.setYouhui(user.getPrice2().intValue()-user.getPrice3().intValue());
                        if(user.getPricelowest()!=null){
                            if(user.getPrice3()<user.getPricelowest()){
                                user.setPricelowest(user.getPrice3());
                            }
                        }

                        this.userService.update(user);

                        cc++;
                        if(cc%100==0){
                            long now2 = new Date().getTime();
                            get1w = now2-now;
                            get1w = get1w/1000;
                            now = new Date().getTime();
                            log.info("qihdebug-100个");
                        }

                    }

                }else {
                    log.info("价格-1 "+ json.toString());
                    String skuid = json.getString("id").replace("J_","");
                    User user = new User();
                    user.setGid(Long.parseLong(skuid));
                    user = this.userService.findByProperties(user);
                    if(user!=null){
                        user.setPrice2(1);
                        user.setPrice3(1);
                        user.setZhekou(100 );
                        user.setYouhui(0);
                        user.setUpdatetime(new Date().getTime() );
                        user.setOnsale("0");
                        this.userService.update(user);
                    }else {
                        log.info(" error。。。skuid "+skuid);
                    }

                }
            }catch (Exception e){
                e.printStackTrace();
            }


        }

    }

    @RequestMapping(value = "/list", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView list(@ModelAttribute("goods") Goods goods,@ModelAttribute("pageInfo") PageInfo pageInfo) {
        ModelAndView mv = new ModelAndView();

        List<User> ulist =  this.userService.findByProperties(new User(),null,20,"zhekou","asc" );
        if(ulist!=null){
            for(int i=0;i<ulist.size();i++ ){
                ulist.get(i).setName(Utils.formatLongDate(new Date(ulist.get(i).getUpdatetime()) ) );
            }
        }
        List<User> lastupdate =  this.userService.findByProperties(new User(),null,1,"updatetime","desc" );
        List<User> forestupdate =  this.userService.findByProperties(new User(),null,1,"updatetime","asc" );
        List<User> lastid =  this.userService.findByProperties(new User(),null,1,"id","desc" );
        mv.addObject("ulist",ulist);
        if(lastupdate!=null && lastupdate.size()>0)
        mv.addObject("lastupdate",lastupdate.get(0));
        if(lastid!=null && lastid.size()>0)
            mv.addObject("lastid",lastid.get(0));
        if(forestupdate!=null && forestupdate.size()>0)
            mv.addObject("forestupdate",Utils.formatLongDate(new Date(forestupdate.get(0).getUpdatetime())) );
        mv.addObject("forest",forestupdate.get(0) );

        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        List<Goods> list = goodsService.findByProperties(goods,pageInfo,0," upindex desc, id ","desc");
        pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.addObject("updateflag",updateflag);
        mv.addObject("runflag",runflag);

        StringBuffer sb = new StringBuffer();
        if(list!=null){
            for(int i=0;i<list.size();i++){
                if(i>9) break;
                String newurl = "http://in-qq.com/#"+list.get(i).getId();
                String temp ="^^^^";
                String result = list.get(i).getRecpoint();
                /*while (geturlfirst(result)!=null){
                   String url  = geturlfirst(result);
                    result = result.replace(url,temp);
                }
                result = result.replace(temp,newurl);*/
                sb.append(result).append("\n").append("详情：<a href=\"" + newurl +  "\""+
                        " style=\"color:#f85000;\"" + ">" + newurl + "</a>").append("\n");
            }
            sb.append("更多精选：http://in-qq.com \n");
        }
        mv.addObject("linestr",sb.toString());
        mv.setViewName("goods/list");
        return mv;
    }

    private void mergeUIRecpointlogic(Goods goods){
        if (Utils.isNotNullOrEmpty(goods) && Utils.isNotNullOrEmpty(goods.getRecpoint())) {
            try {
                //goods.setRecpoint(Html2Text(goods.getRecpoint()));
                goods.setRecpoint(URLEncoder.encode(goods.getRecpoint(),"UTF-8"));
                log.error("recpoint: "+goods.getRecpoint());
                String url = "http://japi.jingtuitui.com/api/universal";
                String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&content="+goods.getRecpoint();
                String str =  HttpUtil.sendPost(url,data);
                log.error("转链后str:"+str);

                JSONObject json = new JSONObject(str);
                if(json.get("return").equals("0")){
                    goods.setSkupicture(json.getString("imgUrl"));
                    String result = json.getString("result");
                    goods.setRecpoint(result);//转链接后的原始内容
                    Matcher matcher = Patterns.WEB_URL.matcher(result);
                    goods.setEndtime(Utils.getDate3(0,0,5).getTime());//线报默认5天有效期
                    // 非线报 获取实际有效期 	转链类型1:普通商品 2:线报
                    if(json.getInt("type")==1){
                        try {
                            JSONObject goodsInfo = json.getJSONObject("goods_info");
                            if(goodsInfo!=null){
                                goods.setEndtime(goodsInfo.getLong("endDate"));
                                log.error("推广结束日期： "+goods.getEndtime() +" " +Utils.formatLongDate(new Date(goods.getEndtime())) );
                            }
                        }catch (Exception e){
                        }
                    }

                    Map<String,String> tmap = new HashMap<>();
                    if (matcher.find()){
                        url = matcher.group();
                        goods.setSkulink(url);// 单个商品的链接 设置链接，如果是线报，不设置此链接
                        String uuid = UUID.randomUUID().toString();
                        result = result.replace(url,uuid);
                        tmap.put(uuid,url);
                        while (geturlfirst(result)!=null){
                            //goods.setSkulink(null);// 线报多个url的时候清空单个sku的链接
                            url  = geturlfirst(result);
                            //System.out.println(url);
                            uuid = UUID.randomUUID().toString();
                            result = result.replace(url,uuid);
                            tmap.put(uuid,url);
                        }
                        System.out.println("uuid替换后："+result);
                        for (Map.Entry<String, String> entry : tmap.entrySet()) {
                            //resultText += "<a href=\"" + matcher.group() + "\">" + matcher.group() + "</a>";
                            //result = result.replace(entry.getKey(), "<a href=\"" + entry.getValue() +  "\""+ " style=\"color:#f85000;\"" + ">" + entry.getValue() + "</a>");
                            result = result.replace(entry.getKey(), "<a href=\"" + entry.getValue() +  "\""+ " style=\"color:#f85000;\"" + ">" + entry.getValue() + "</a>");

                            result = result.replace("抢券","");
                            result = result.replace("+","");
                            result = result.replace("下单"," ");
                            result = result.replace("抢购"," ");
                            //result = result.replace("内购","");
                            result = result.replace("链接","");
                        }
                        System.out.println("自动链接后："+result);
                        // 网页显示使用的字段，自带链接的
                        goods.setName(result);
                    }
                    /*if (matcher.find()){
                        String skulink = matcher.group();
                        //result = result.replace(skulink,"点击直达！");
                        goods.setSkulink(skulink);
                        goods.setRecpoint(result);
                    }*/
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            //goods.setName(yinhao(goods.getName()));
            //goods.setRecpoint(yinhao(goods.getRecpoint()));
        }
    }

    @RequestMapping(value = "/mergeUIRecpoint", method = RequestMethod.POST)
    public ModelAndView mergeUIRecpoint(@ModelAttribute("goods") Goods goods) {
        ModelAndView mv = new ModelAndView();
        this.mergeUIRecpointlogic(goods);
        mv.addObject(goods);
        mv.setViewName("goods/merge");
        return mv;
    }

    @RequestMapping(path = "/autotuiguangbyskuid",method = RequestMethod.GET)
    public void  autotuiguangbyskuid(HttpServletRequest request,HttpServletResponse response) throws Exception{
        String skuid = request.getParameter("skuid");
        Map remap =new HashMap();
        String url = "http://japi.jingtuitui.com/api/get_goods_info";
        String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&gid="+skuid;
        String str =  HttpUtil.sendPost(url,data);
        log.error("jtt2 "+str);
        remap = JSONUtils.fromJson(str,Map.class);

        url = "http://japi.jingtuitui.com/api/get_goods_link";
        data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&gid="+skuid;
        str =  HttpUtil.sendPost(url,data);
        log.error("jtt3 "+str);

        Map remap2 =JSONUtils.fromJson(str,Map.class);
        if(remap2!=null && remap2.get("return").equals("0")){
            remap.put("result2",remap2.get("result"));
            try {
                log.error("reobj: "+JSONUtils.toJSON(remap));
                User user = new User();
                user.setGid(new Long(skuid));
                user = userService.findByProperties(user);
                if(user!=null){
                    StringBuffer sb = new StringBuffer();
                    sb.append("原价："+user.getPrice()).append("元 ");
                    sb.append("\n 优惠后:"+user.getPrice3()+"元 ");
                    saveGoods(remap,skuid,user.getCouponprom()+ sb );
                }
                //return JSONUtils.toJSON(remap);
            }catch (Exception e){
                e.printStackTrace();
                response.getWriter().print(0);
            }
        }else {
            log.error("jtt 获取失败skuid.."+skuid);
        }

        response.getWriter().print(skuid);
    }

    @RequestMapping(path = "/skuExist",method = RequestMethod.GET)
    @ResponseBody
    public Object skuExist(HttpServletRequest request, HttpServletResponse response) {
        String skuid = request.getParameter("skuid");
        Goods g = new Goods();
        g.setSkuid(skuid);
        g.setDomain(1);
        g = this.goodsService.findByProperties(g);
        if(g!=null && g.getId()!=null){
            return g.getSkuid()+"";
        }else{
            return "0";
        }
    }



    @RequestMapping(value = "/web", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView web(@ModelAttribute("goods") Goods goods,@ModelAttribute("pageInfo") PageInfo pageInfo,HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();

        String huashu = (String)request.getSession().getServletContext().getAttribute("huashu");
        mv.addObject("huashu",huashu);

        String qs = request.getQueryString();

        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        if(goods==null){
            goods = new Goods();
        }
        if(StringUtils.isNotEmpty(goods.getName())){
            Pattern pattern = Pattern.compile("^[-\\+]?[\\d]*$");
            boolean isnum = pattern.matcher(goods.getName()==null?"":goods.getName()).matches();
            if(isnum){
                goods.setSkuid(goods.getName());
                goods.setName(null);
                goods.setDomain(1);
                return this.webSkuidSearch(pageInfo, goods, request);
            }
        }
        String orderby = goods.getOrderby()==null?"id":goods.getOrderby();
        String ascdesc = "desc";
        if(orderby.equals("price")) ascdesc = "asc";
        List<Goods> list = null;
        if(orderby.equals("id") && ascdesc.equals("desc") && StringUtils.isEmpty(qs) && StringUtils.isEmpty(goods.getName())){// 默认没有查询参数进来使用缓存数据
            list= (List<Goods>)mmap.get("list");
            pageInfo = (PageInfo) mmap.get("pageInfo");
            if(list==null || list.isEmpty()){
                list = goodsService.findByProperties(goods,pageInfo,0,goods.getOrderby(),ascdesc);
                pageInfo = new PageInfo();
                pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
                if(list!=null && list.size()>0){
                    mmap.put("list",list);
                    mmap.put("pageInfo",pageInfo);
                }
            }
        }else{
            list = goodsService.findByProperties(goods,pageInfo,0,goods.getOrderby(),ascdesc);
            pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        }

        StringBuffer sb  = new StringBuffer();
        for(int i=0;i<list.size();i++){
            //sb.append(list.get(i).getCid3Name() ).append(" ");
            //sb.append(list.get(i).getName()).append(" ");
            if(i<10)
            sb.append(list.get(i).getName().substring(0,12)).append(" ");
            //log.info(list.get(i).getName().substring(0,12));
        }
        mv.addObject("dtitle", sb.toString());
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("web/web");
        return mv;
    }

    private ModelAndView webSkuidSearch(PageInfo pageInfo,Goods goods,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        String huashu = (String)request.getSession().getServletContext().getAttribute("huashu");
        mv.addObject("huashu",huashu);

        if(pageInfo==null){
            pageInfo = new PageInfo();
        }
        String orderby = goods.getOrderby()==null?"id":goods.getOrderby();
        String ascdesc = "desc";
        if(orderby.equals("price")) ascdesc = "asc";
        //skuid 查询 先查出当前sku
        List<Goods> list = new ArrayList<>();
        goods = this.goodsService.findByProperties(goods);
        if(goods==null){
            goods = new Goods();
        }else {
            list.add(goods);
        }
        // 查询 于goods 相同的分类的数据
        String cid3 = goods.getCid3();
        String oldskuid = goods.getSkuid()==null?"":goods.getSkuid();
        goods = new Goods();
        goods.setCid3(cid3);
        List<Goods> glist = goodsService.findByProperties(goods,pageInfo,0,orderby,ascdesc);
        if(glist!=null){
            for(int i=0;i<glist.size();i++){
                if(!oldskuid.equals(glist.get(i).getSkuid())){
                    list.add(glist.get(i));
                }
            }
        }
        pageInfo.setTotalCount(this.goodsService.countByProperties(goods));
        mv.addObject("list", list);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("web/web");
        return mv;
    }

    @RequestMapping(path = "/hisPrice2",method = RequestMethod.GET)
    @ResponseBody
    public Object getMMMPrice2(HttpServletRequest request, HttpServletResponse response) {
        String uri = request.getParameter("url");
        String token = request.getParameter("token");
        //http://tool.manmanbuy.com/history.aspx?action=gethistory&url=http%253A%2F%2Fitem.jd.com%2F3734874.html&token=4sze53bc96e9093faf34eaed11d0bc544a7e
        String url = "http://tool.manmanbuy.com/history.aspx?action=gethistory&url="+uri+"&token="+token;
        String str =  HttpClientUtils.getDataFromUri(url,null);
        log.info("res: "+str);
        JSONObject json = new JSONObject(str);
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        StringBuffer sb = new StringBuffer();
        try{
            if(json.get("lowerPrice")!=null){
                if(json.get("spName").toString().contains("一步赢")){
                    log.error("获取价格失败 "+url);
                    return "暂未收藏";
                }
                sb.append(json.get("lowerPrice").toString().replace("\"",""));
            }

            return sb.toString();

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(path = "/hisPrice",method = RequestMethod.GET)
    @ResponseBody
    public Object getMMMPrice(HttpServletRequest request, HttpServletResponse response) {
        String uri = request.getParameter("url");
        String token = request.getParameter("token");
        String gid = request.getParameter("id");
        //http://tool.manmanbuy.com/history.aspx?action=gethistory&url=http%253A%2F%2Fitem.jd.com%2F3734874.html&token=4sze53bc96e9093faf34eaed11d0bc544a7e
        String url = "http://tool.manmanbuy.com/history.aspx?action=gethistory&url="+uri+"&token="+token;
        String str =  HttpClientUtils.getDataFromUri(url,null);
        log.info("res: "+str);
        JSONObject json = new JSONObject(str);
        log.info("处理完成。");
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        StringBuffer sb = new StringBuffer();
        try{
            if(json.get("lowerPrice")!=null){
                if(json.get("spName").toString().contains("一步赢")){
                    log.error("获取价格失败 "+url);
                    return "暂未收藏价格";
                }
                sb.append(json.get("lowerPrice").toString().replace("\"",""));
                Goods g = this.goodsService.findById(Goods.class,new Long(gid));
                if(g!=null){
                    log.info(sb.toString());
                    g.setPricel(new Float(sb.toString()));
                    this.goodsService.update(g);
                    log.info("历史价格更新成功 "+g.getId());
                }

            }

            return sb.toString();

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }



    @RequestMapping(path = "/jttGoodDetail",method = RequestMethod.GET)
    @ResponseBody
    public String jttGoodDetail(HttpServletRequest request, HttpServletResponse response){
        Map remap =new HashMap();
        //url: "http://japi.jingtuitui.com/api/get_goods_info",
        //            //data:"appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&gid="+skuid,
        String skuid = request.getParameter("skuid");
        String addupdate = request.getParameter("type");// 1 add 2 upate
        log.error("skuid  "+skuid+ " addupdate "+addupdate);
        if(addupdate.equals("1")){
            Goods g = new Goods();
            g.setSkuid(skuid);
            g.setDomain(1);
            g = this.goodsService.findByProperties(g);
            if(g!=null && g.getId()!=null){
                return g.getId()+"";
            }
        }

        String url = "http://japi.jingtuitui.com/api/get_goods_info";
        String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&gid="+skuid;
        String str =  HttpUtil.sendPost(url,data);
        log.error("jtt2 "+str);
        remap = JSONUtils.fromJson(str,Map.class);

        url = "http://japi.jingtuitui.com/api/get_goods_link";
        data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&gid="+skuid;
        str =  HttpUtil.sendPost(url,data);
        log.error("jtt3 "+str);

        Map remap2 =JSONUtils.fromJson(str,Map.class);
        if(remap2!=null && remap2.get("return").equals("0")){
            remap.put("result2",remap2.get("result"));
        }

        try {
            log.error("reobj: "+JSONUtils.toJSON(remap));
            return saveGoods(remap,skuid,"");
            //return JSONUtils.toJSON(remap);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }

    public static String geturlfirst(String str){
        Matcher matcher = Patterns.WEB_URL.matcher(str);
        if (matcher.find()){
            return matcher.group();
        }
        return null;
    }
    /**
     * {
     * 	"return": "0",
     * 	"result": {
     * 		"cid": 1320,
     * 		"cid2": 5019,
     * 		"cid2Name": "进口食品",
     * 		"cid3": 5023,
     * 		"cid3Name": "冲调品",
     * 		"cidName": "食品饮料",
     * 		"commisionRatioPc": 5,
     * 		"commisionRatioWl": 5,
     * 		"endDate": 32472115200000,
     * 		"goodsName": "韩国进口 家乐氏（Kellogg’s）谷脆格 进口谷物 即食冲饮 营养谷物早餐300g",
     * 		"imgUrl": "http://img14.360buyimg.com/n1/jfs/t20032/25/947831366/234812/4ab2b6da/5b0f6a07Nabecdcbc.jpg",
     * 		"inOrderCount": 5478,
     * 		"isFreeFreightRisk": 0,
     * 		"isFreeShipping": 2,
     * 		"isJdSale": 1,
     * 		"isSeckill": 0,
     * 		"materialUrl": "http://item.jd.com/874171.html",
     * 		"shopId": 1000013642,
     * 		"skuId": 874171,
     * 		"startDate": 1528473600000,
     * 		"unitPrice": 24.8,
     * 		"vid": 1000013642,
     * 		"wlUnitPrice": 24.8
     *        },
     * 	"result2": {
     * 		"link": "https://union-click.jd.com/jdc?d=3GvDtm"
     *    }
     * }
     * @param remap2
     */
    private String saveGoods( Map remap2,String skuid,String recpoint){
        try {
            JSONObject obj = new JSONObject(JSONUtils.toJSON(remap2)) ;
            Goods g = new Goods();
            g.setSkuid(skuid);
            g.setDomain(1);
            g = this.goodsService.findByProperties(g);
            if(g!=null && g.getId()!=null){
            }else{
                g = new Goods();
            }

            g.setDomain(1);
            g.setBrand("");
            g.setCate("");
            g.setEndtime(obj.getJSONObject("result").getLong("endDate"));
            g.setLinktype("jtt");
            g.setName(obj.getJSONObject("result").getString("goodsName"));
            g.setPrice(Float.parseFloat(obj.getJSONObject("result").get("wlUnitPrice").toString()));
            g.setPricel(Float.parseFloat(obj.getJSONObject("result").get("wlUnitPrice").toString()));
            g.setRatio(obj.getJSONObject("result").getInt("commisionRatioWl"));

            g.setSkuid(skuid);
            g.setSkulink(obj.getJSONObject("result2").getString("link"));
            g.setSkupicture(obj.getJSONObject("result").getString("imgUrl"));
            g.setUpdatetime(new Date().getTime());
            g.setUpindex(0);
            g.setCid(obj.getJSONObject("result").getInt("cid")+"");
            g.setCid2(obj.getJSONObject("result").getInt("cid2")+"");
            g.setCid3(obj.getJSONObject("result").getInt("cid3")+"");
            g.setCidName(obj.getJSONObject("result").getString("cidName")+"");
            g.setCid2Name(obj.getJSONObject("result").getString("cid2Name"));
            g.setCid3Name(obj.getJSONObject("result").getString("cid3Name"));
            g.setMaterialUrl(obj.getJSONObject("result").getString("materialUrl"));
            g.setInOrderCount(obj.getJSONObject("result").getInt("inOrderCount"));

            g.setRecpoint("自营！"+g.getName()+" \n "+recpoint+" \n "+g.getSkulink());
            g.setUpdatetime(new Date().getTime());
            g.setRemark(new SimpleDateFormat("MM-dd HH:mm").format(new Date()));

            mergeUIRecpointlogic(g);

            if(g.getId()==null){
                this.goodsService.save(g);
                g = goodsService.findByProperties(g);
            }else {
                this.goodsService.update(g);
            }

            return g.getId()+"";

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }




    @RequestMapping(value = "/mergeUI", method = RequestMethod.GET)
    public ModelAndView mergeUI(@ModelAttribute("goods") Goods goods) {
        ModelAndView mv = new ModelAndView();
        if (Utils.isNotNullOrEmpty(goods) && Utils.isNotNullOrEmpty(goods.getId())) {
            goods = this.goodsService.findByProperties(goods);
            mv.addObject(goods);
            mv.setViewName("goods/merge");
        }
        mv.setViewName("goods/merge");
        return mv;
    }

    @RequestMapping(value = "/merge", method = RequestMethod.POST)
    public String merge(@ModelAttribute("goods") Goods goods,HttpServletRequest request) throws Exception{

        String huashu = goods.getHuashu();
        request.getSession().getServletContext().setAttribute("huashu",huashu);
        goods.setHuashu(null);
        goods.setUpdatetime(new Date().getTime());
        goods.setRemark(new SimpleDateFormat("MM-dd HH:mm").format(new Date()));
        if(goods.getId()==null){
            goods.setName(goods.getName().substring(4));
            goodsService.save(goods);
        }else{
            goodsService.update(goods);
        }
        return "redirect:/goods/list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@ModelAttribute("goods") Goods goods) throws Exception{

        goodsService.delete(goods);
        return "redirect:/goods/list";
    }

    public static String yinhao(String str){
        if(str==null) return null;
        if (str.indexOf("'") >= 0)
            str = str.replaceAll("'", "~~~");
        if (str.indexOf("\"") >= 0)
            str = str.replaceAll("\"", "^^^");
        return str;
    }

    public static String yinhaoback(String str){
        if(str==null) return null;
        if (str.indexOf("~~~") >= 0)
            str = str.replaceAll("~~~", "'");
        if (str.indexOf("^^^") >= 0)
            str = str.replaceAll("^^^", "\"");
        return str;
    }
}
