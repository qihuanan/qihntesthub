<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="sysPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>登录</title>
    <!--用百度的静态资源库的cdn安装bootstrap环境-->
    <!-- Bootstrap 核心 CSS 文件 -->
    <link href="https://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!--font-awesome 核心我CSS 文件-->
    <link href="https://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <!-- 在bootstrap.min.js 之前引入 -->
    <script src="https://apps.bdimg.com/libs/jquery/2.0.0/jquery.min.js"></script>
    <!-- Bootstrap 核心 JavaScript 文件 -->
    <script src="https://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
    <!--jquery.validate-->
    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery-validate/1.19.2/jquery.validate.js" ></script>
    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery-validate/1.19.2/localization/messages_ar.js" ></script>
    <style type="text/css">
        body{background: url(img/4.jpg) no-repeat;background-size:cover;font-size: 16px;}
        .form{background: rgba(255,255,255,0.2);width:400px;margin:100px auto;}
        #login_form{display: block;}
        #register_form{display: none;}
        .fa{display: inline-block;top: 27px;left: 6px;position: relative;color: #ccc;}
        input[type="text"],input[type="password"]{padding-left:26px;}
        .checkbox{padding-left:21px;}
    </style>
</head>
<body>

<div class="container">
    <div class="form row">
        <form class="form-horizontal col-sm-offset-3 col-md-offset-3" id="login_form" action="${sysPath}/adminlogin" method="post">
            <h3 class="form-title" style="padding-left: 60px;">欢迎登录</h3>
            <div class="col-sm-9 col-md-9">
                <div class="form-group">
                    <i class="fa fa-user fa-lg"></i>
                    <input class="form-control required" type="text" placeholder="Username" name="name" value="admin" autofocus="autofocus" maxlength="20"/>
                </div>
                <div class="form-group">
                    <i class="fa fa-lock fa-lg"></i>
                    <input class="form-control required" type="password" id="pass" placeholder="Password" name="mobile" maxlength="20"/>
                </div>
                <div class="form-group">
                    <hr />
                </div>
                <div class="form-group" style="padding-left: 75px;" >
                    <input type="button" onclick="sub();" class="btn btn-success " value="Login "/>
                </div>
            </div>
        </form>
    </div>

</div>
<script type="text/javascript" >
    $().ready(function() {


    });
    function sub(){
        var pass = $('#pass').val();
        if(pass.trim() != ''){
            document.forms[0].submit();
        }
    }

    $(function() {
        $("#register_btn").click(function() {
            $("#register_form").css("display", "block");
            $("#login_form").css("display", "none");
        });
        $("#back_btn").click(function() {
            $("#register_form").css("display", "none");
            $("#login_form").css("display", "block");
        });
    });


</script>
</body>
</html>