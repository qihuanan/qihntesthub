<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div class="topclass">
    <a href="/">慧惠助手-用智慧汇集优惠<br>超值好券薅羊毛白菜价历史价格查询</a>
</div>
<div class="nav white">
    <div class="logo" style="margin-top: -3px;"><a href="/"><img src="../images/tomcat.png" /></a></div>
    <div class="search-bar pr">
        <div class="search1">
            <input id="searchInput" placeholder="输入你想要的商品试试" style="width: 60%;" name="name" type="text" value="${goods.name}" onfocus="$(this).select();" >
            <input id="ai-topsearch2" class="submit am-btn" style="background-color: yellowgreen;width: 20%;"  value="搜淘宝"  type="button" onclick="$('#curPage').val(1);searchtb();">
            <input id="ai-topsearch" class="submit am-btn" style="background-color: red; width: 20%;font-weight: bold;" value="搜xx"  type="button" onclick="$('#curPage').val(1);searchdj();">
        </div>
    </div>
</div>