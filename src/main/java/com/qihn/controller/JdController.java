package com.qihn.controller;


import com.fasterxml.jackson.databind.util.JSONPObject;
import com.qihn.pojo.User;
import com.qihn.service.UserService;
import com.qihn.utils.*;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.client.HttpClient;
import org.json.JSONObject;
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
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class JdController {
    private static Log log = LogFactory.getLog(JdController.class);

    public static void main(String args[]){
        new JdController().jdlist("女装",null);


    }

    public void jdlist(String q,String rank){
        Map remap =new HashMap();

        String url = "http://japi.jingtuitui.com/api/get_goods_list";
        //appid=你的appid&appkey=你的appkey&page=1&num=30&type=10&rank=sift
        //rank self : 京东自营 wtype : 京东配送产品；
        String data = "appid=1805022340533108&appkey=4da21768b0d248aee58e3173af15e411&page=1&num=50&rank="+rank+"&so="+q;
        String str =  HttpUtil.sendPost(url,data);
        //log.error("jttlist: "+str);
        remap = JSONUtils.fromJson(str,Map.class);
        if(remap!=null && remap.get("return").equals("0")){
            remap.put("result",remap.get("result"));
        }
        log.info(remap.get("result"));

    }


    @RequestMapping(path = "/hp",method = RequestMethod.GET)
    @ResponseBody
    public Object getUserlist(HttpServletRequest request, HttpServletResponse response) {
        log.info("接收到请求");
        String uri = request.getParameter("url");
        String token = request.getParameter("token");

        //http://tool.manmanbuy.com/history.aspx?action=gethistory&url=http%253A%2F%2Fitem.jd.com%2F3734874.html&token=4sze53bc96e9093faf34eaed11d0bc544a7e
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
