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

    public static void main(String args[]){
        String url = "http://tool.manmanbuy.com/history.aspx?DA=1&action=gethistory&url=https%253A%2F%2Fdetail.tmall.com%2Fitem.htm%253Fid%253D543567737596&bjid=&spbh=&cxid=&zkid=&w=951&token=7xzecc440d7de36a9881be33f1281a06a8a1h9crzx13";
        String str =  HttpClientUtils.getDataFromUri(url,null);
        System.out.println(str);


    }

}
