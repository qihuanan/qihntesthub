package com.qihn.controller;

import com.qihn.utils.JSONUtils;
import com.qihn.utils.Utils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import javax.rmi.CORBA.Util;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.UndeclaredThrowableException;
import java.util.Enumeration;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by qihuanan on 2017/5/23.
 */
public abstract class BaseController {
    private static Log log = LogFactory.getLog(BaseController.class);

    protected DynamicAsyncContext asyncContext;

    public DynamicAsyncContext getAsyncContext() {
        return asyncContext;
    }

    public void setAsyncContext(DynamicAsyncContext asyncContext) {
        this.asyncContext = asyncContext;
    }

    protected HttpServletRequest request;

    protected HttpServletResponse response;

    protected HttpSession session;

    public String getParam(String p){
        String  res = request.getParameter(p);
        if(p.equals("userid" ) && Utils.isNullorEmpty(res)){
            return "1";
        }
        return  res;
    }

    public void showparam(Object obj){
        log.info("qihntest-para : "+": "+ JSONUtils.toJSON(obj));
    }
    public void showparam(){
        Enumeration enu=request.getParameterNames();
        while(enu.hasMoreElements()){
            String paraName=(String)enu.nextElement();
            //System.out.println(paraName ": "+paraName);
            log.info("qihntest-para : "+paraName+": "+ request.getParameter(paraName));
        }
    }

     @ModelAttribute
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

         this.request = request;

         this.response = response;

         this.session = request.getSession();

    }

    public void printjson(Object s){
        try{
            response.setContentType("application/json; charset=utf-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(s);
            log.info("res : "+ s);
            response.getWriter().flush();
        }catch (Exception e){

        }
    }
    public void print(Object s){
        try{
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print(s);
            log.info("res : "+ s);
            response.getWriter().flush();
        }catch (Exception e){

        }
    }

    public static void main(String args[]){
        String line = "品参加跨店铺满减活动  ，每满300元，可减30元现金";

        // 按指定模式在字符串查找
        // line = "This order was placed for QT3000! OK?";
        String pattern = "(\\D*)(\\d+)(\\D*)(\\d+)(\\D*)";

        // 创建 Pattern 对象
        Pattern r = Pattern.compile(pattern);

        // 现在创建 matcher 对象
        Matcher m = r.matcher(line);
        if (m.find( )) {
            System.out.println("Found value: " + m.group(0) );
            System.out.println("Found value: " + m.group(1) );
            System.out.println("Found value: " + m.group(2) );
            System.out.println("Found value: " + m.group(3) );
            System.out.println("Found value: " + m.group(4) );
        } else {
            System.out.println("NO MATCH");
        }

    }
}
