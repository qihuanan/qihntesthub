package com.qihn.controller;

import com.qihn.utils.HttpUtil;
import com.qihn.utils.Utils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Enumeration;


@Controller
@RequestMapping("/wx")
public class WxController extends BaseController {
    private static Log log = LogFactory.getLog(WxController.class);
    public static final String TOKEN = "qihn";

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    @ResponseBody
    public void login(HttpServletRequest request, HttpServletResponse response) throws Exception{
        this.setReqAndRes(request,response);
        showparam();
        StringBuffer sb = new StringBuffer("https://api.weixin.qq.com/sns/jscode2session?appid=");
        sb.append(Utils.getProperty("appid"));
        sb.append("&secret=").append(Utils.getProperty("secret"));
        sb.append("&js_code=").append(getParam("code"));
        sb.append("&grant_type=authorization_code");
        log.info("url: "+sb.toString());
        String res = HttpUtil.sendGet(sb.toString());
        log.info("http-wxlogin-res: "+res);
        JSONObject json = new JSONObject(res);
       this.print(json.getString("openid"));
    }




}
