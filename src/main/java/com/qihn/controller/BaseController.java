package com.qihn.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletWebRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by qihuanan on 2017/5/23.
 */
public abstract class BaseController {


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

     @ModelAttribute
    public void setReqAndRes(HttpServletRequest request, HttpServletResponse response){

         this.request = request;

         this.response = response;

         this.session = request.getSession();

    }


    public void print(Object s){
        try{
            response.getWriter().print(s);
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
