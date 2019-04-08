package com.qihn.controller;


import com.fasterxml.jackson.databind.util.JSONPObject;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.qihn.pojo.Goods;
import com.qihn.pojo.Jdobject;
import com.qihn.pojo.User;
import com.qihn.service.UserService;
import com.qihn.utils.*;
import com.taobao.api.response.TbkScMaterialOptionalResponse;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.HttpClient;
import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.net.URI;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.List;
import java.util.concurrent.TimeUnit;


@Controller
public class JdController {
    private static Log log = LogFactory.getLog(JdController.class);

    public static void main(String args[]){
        //new JdController().jdlist("格力空调",null);
        try {

            /**HtmlUnit请求web页面*//*
            WebClient wc = new WebClient();
            wc.getOptions().setJavaScriptEnabled(true); //启用JS解释器，默认为true
            wc.getOptions().setCssEnabled(false); //禁用css支持
            wc.getOptions().setThrowExceptionOnScriptError(false); //js运行错误时，是否抛出异常
            wc.getOptions().setTimeout(20000); //设置连接超时时间 ，这里是10S。如果为0，则无限期等待
            HtmlPage page = wc.getPage("https://miaosha.qihn.com/");
            String pageXml = page.asXml(); //以xml的形式获取响应文本

            *//**jsoup解析文档*//*
            Document doc = Jsoup.parse(pageXml, "https://miaosha.qihn.com/");

            Element pv = doc.getElementById("super_seckill");
            System.out.println(pv.text());

            System.out.println("Thank God!");*/


           /* Document doc = Jsoup.connect("https://search.qihn.com/Search?keyword=空调&enc=utf-8").get();
            String title = doc.title();
            //log.info("title"+title);
            Element content = doc.getElementById("J_goodsList");
            Elements elements = content.getElementsByTag("li");
            for (Element element : elements) {
                String linkHref = element.attr("data-sku");
                String linkText = element.html();
                //log.info(linkHref+" - "+ linkText);
                log.info(" begin ================== ");
                Elements imgdiv = element.getElementsByClass("p-img");
                log.info("imgdiv -> "+imgdiv.html());
                log.info("skuid -> "+element.attr("data-sku") );
                log.info("a title -> "+imgdiv.first().getElementsByTag("a").attr("title") );
                log.info("a href -> "+imgdiv.first().getElementsByTag("a").attr("href") );
                log.info("img src -> "+imgdiv.first().getElementsByTag("img").attr("source-data-lazy-img") );
                break;
            }*/

        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static CacheLoader<String, List> createJDMSCacheLoader() {
        return new com.google.common.cache.CacheLoader<String, List>() {
            @Override
            public List load(String key) throws Exception {
                log.info("加载创建key:" + key);
                String url = "https://ai.qihn.com/index_new?app=Seckill&action=pcMiaoShaAreaList&callback=&_=";
                String data = null;
                String jsonp =  HttpUtil.sendGet(url,data);
                //log.error("jtt-get_goods_link: "+jsonp);//esss
                List list = new ArrayList();
                if(Utils.isNotNullOrEmpty(jsonp)){
                    int startIndex = jsonp.indexOf("(");
                    int endIndex = jsonp.lastIndexOf(")");
                    String str = jsonp.substring(startIndex+1, endIndex);
                    JSONObject json = new JSONObject(str);
                    JSONArray ja =  json.getJSONArray("miaoShaList");
                    for(int i=0;i<ja.length();i++){
                        Jdobject jd = new Jdobject();
                        jd.setSkuid(ja.getJSONObject(i).getString("wareId"));
                        jd.setName(ja.getJSONObject(i).getString("wname"));
                        jd.setSkupicture(ja.getJSONObject(i).getString("imageurl"));
                        jd.setPricestr(ja.getJSONObject(i).getString("jdPrice"));
                        jd.setPricemiaosha(ja.getJSONObject(i).getString("miaoShaPrice"));
                        jd.setSkulink("http://item.qihn.com/"+ja.getJSONObject(i).getString("wareId")+".html");
                        list.add(jd);
                        log.info(JSONUtils.toJSON(jd));
                    }
                    ja = json.getJSONArray("plusGoodsList");
                    for(int i=0;i<ja.length();i++){
                        Jdobject jd = new Jdobject();
                        jd.setSkuid(ja.getJSONObject(i).getString("wareId"));
                        jd.setName(ja.getJSONObject(i).getString("wname"));
                        jd.setSkupicture(ja.getJSONObject(i).getString("imageurl"));
                        jd.setPricestr(ja.getJSONObject(i).getString("jdPrice"));
                        jd.setPricemiaosha(ja.getJSONObject(i).getString("miaoShaPrice"));
                        jd.setSkulink("http://item.qihn.com/"+ja.getJSONObject(i).getString("wareId")+".html");
                        list.add(jd);
                        log.info(JSONUtils.toJSON(jd));
                    }
                }

                return list;
            }
        };
    }

    static LoadingCache<String, List> cache = null;
    public List getJDMScache(){
        if(cache==null){
            cache = CacheBuilder.newBuilder()
                    .maximumSize(1000)
                    .expireAfterAccess(1000*60L, TimeUnit.MILLISECONDS)
                    .build(createJDMSCacheLoader());
        }

        try {
            List list = (List)cache.get("jdms");
            if(Utils.isNullorEmpty(list)){
                cache = CacheBuilder.newBuilder()
                        .maximumSize(1000)
                        .expireAfterAccess(1000*60L, TimeUnit.MILLISECONDS)
                        .build(createJDMSCacheLoader());
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();;
        }
        return null;
    }

    @RequestMapping(value = "/jdms", method = {RequestMethod.POST, RequestMethod.GET})
    public ModelAndView jdms(@ModelAttribute("goods") Goods goods, HttpServletRequest request) throws Exception {
        ModelAndView mv = new ModelAndView();

        mv.addObject("list", getJDMScache());
        mv.setViewName("web/webjd");
        return mv;
    }

    @RequestMapping(value = "/jds", method = {RequestMethod.POST, RequestMethod.GET})
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
        boolean isjdps = Utils.isNotNullOrEmpty(goods.getRecpoint()) && goods.getRecpoint().equals("1");

        List list = sjdlist(goods.getName(),goods.getOrderby(),isjdps==true?"1":"0");

        mv.addObject("list", list);
        mv.setViewName("web/webjd");
        return mv;
    }

    //https://search.qihn.com/Search?keyword=%E7%A9%BA%E8%B0%831%E5%8C%B9&enc=utf-8&wtype=1&psort=3
    // wtype =1  京东配送  psort 1 价格降序 2 价格升序  3 销量降序
    public List sjdlist(String q,String sort,String jdps){
        try {
            Document doc = Jsoup.connect("https://search.qihn.com/Search?keyword="+q+"&enc=utf-8&stock=1&wtype="+jdps+"&psort="+sort).get();
            String title = doc.title();
            Element content = doc.getElementById("J_goodsList");
            Elements elements = content.getElementsByTag("li");
            List list = new ArrayList();
            for (Element element : elements) {
                try {
                    Elements imgdiv = element.getElementsByClass("p-img");
                    Jdobject obj = new Jdobject();
                    obj.setSkuid(element.attr("data-sku"));
                    obj.setCommitinfo(element.getElementsByClass("p-commit").text());
                    obj.setShopinfo(element.getElementsByClass("p-shop").text());
                    obj.setName(element.getElementsByClass("p-name").text());
                    obj.setSkulink(imgdiv.first().getElementsByTag("a").attr("href"));
                    obj.setSkupicture(imgdiv.first().getElementsByTag("img").attr("source-data-lazy-img"));
                    if(imgdiv.first().getElementsByTag("a").hasAttr("title")){
                        obj.setAdwords(imgdiv.first().getElementsByTag("a").attr("title"));
                    }else{
                        obj.setAdwords(obj.getName());
                    }
                    obj.setPricestr(element.getElementsByClass("p-price").text());
                    list.add(obj);
                }catch (Exception e){
                    continue;
                }
            }
            return list;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @RequestMapping(value = "/jtlink", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String jttlink(HttpServletRequest request){
        try {
            String skuid = request.getParameter("skuid");
            String url = "http://japi.jingtuitui.com/api/get_goods_link";
            String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&unionid=1000524984&positionid=&coupon_url=&gid="+skuid;
            String str =  HttpUtil.sendPost(url,data);
            log.error("jtt-get_goods_link: "+str);
            Map remap2 =JSONUtils.fromJson(str,Map.class);
            if(remap2!=null && remap2.get("return").equals("0")){
                JSONObject obj = new JSONObject(JSONUtils.toJSON(remap2.get("result")));
                log.info("jtt-link:"+obj.getString("link") );
                return obj.getString("link");
            }
        }catch (Exception e){
            e.printStackTrace();
        }

        return null;
    }

    public List jttlist(String q,String rank){
        try {
            Map remap =new HashMap();
            String url = "http://japi.jingtuitui.com/api/get_goods_list";
            //appid=你的appid&appkey=你的appkey&page=1&num=30&type=10&rank=sift
            //rank self : 京东自营 wtype : 京东配送产品；
            String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&page=1&num=50&rank="+rank+"&so="+q;
            String str =  HttpUtil.sendPost(url,data);
            log.error("jttlist: "+str);
            JSONObject obj = new JSONObject(str) ;
            JSONArray ja = obj.getJSONObject("result").getJSONArray("data");
            List list = ja.toList();
            log.error(list);
            return list;
        }catch (Exception e ){
            e.printStackTrace();
        }
        return null;
    }


    @RequestMapping(path = "/hp",method = RequestMethod.GET)
    @ResponseBody
    public Object getUserlist(HttpServletRequest request, HttpServletResponse response) {
        log.info("接收到请求");
        String uri = request.getParameter("url");
        String token = request.getParameter("token");

        //http://tool.manmanbuy.com/history.aspx?action=gethistory&url=http%253A%2F%2Fitem.qihn.com%2F3734874.html&token=4sze53bc96e9093faf34eaed11d0bc544a7e
        String url = "http://tool.manmanbuy.com/history.aspx?action=gethistory&url="+uri+"&token="+token;
        log.info("url:"+url);
        String str =  HttpClientUtils.getDataFromUri(url,null);

       log.info("res: "+str);
        JSONObject json = new JSONObject(str);
       log.info("处理完成。");


        response.setHeader("Content-type", "text/html;charset=UTF-8");
        StringBuffer sb = new StringBuffer();
        try{

            if(json.get("lowerPrice")!=null){
                if(json.get("spName").toString().contains("一步赢")){
                    log.error("获取价格失败");
                    return "暂未收藏价格";

                }

                sb = sb.append("当前价 "+json.get("currentPrice").toString().replace(":",""));
                sb = sb.append("最低价 "+json.get("lowerPrice").toString().replace(":",""));

            }



        return sb.toString();

        }catch (Exception e){

        }
        return null;
    }



}
