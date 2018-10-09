<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div style="text-align: center;">


    <div style="display: inline;float:left;width: 25%;">
        <a href="/tbs/coupon?recpoint=coupon" <c:if test="${goods.recpoint eq 'coupon'}">class="div-selected"</c:if> style="cursor: pointer;height: auto;background-color: white; ">
            <img src="../images/icon7.png" style="width: 70px;height: 70px;"><br>
            超值好券
        </a>
    </div>
    <div style="display: inline;float:left;width: 25%;" >
        <a href="/" style="cursor: pointer;height: auto;background-color: white; " <c:if test="${empty goods.recpoint }">class="div-selected"</c:if>  >
            <img src="../images/icon1.png" style="width: 70px;height: 70px;"><br>
            好物推荐
        </a>
    </div>
    <div style="display: inline;float:left;width: 25%;">
        <a href="/tbs/tqg?recpoint=tqg" <c:if test="${goods.recpoint eq 'tqg'}">class="div-selected"</c:if> style="cursor: pointer;height: auto;background-color: white; ">
            <img src="../images/icon2.png" style="width: 70px;height: 70px;"><br>
            白菜薅羊毛
        </a>
    </div>
    <div style="display: inline;float:left;width: 25%;">
        <a href="/jdms?recpoint=jhms" <c:if test="${goods.recpoint eq 'jhms'}">class="div-selected"</c:if> style="cursor: pointer;height: auto;background-color: white; ">
            <img src="../images/icon5.png" style="width: 70px;height: 70px;"><br>
            京东秒杀
        </a>
    </div>


    <!--
    <div style="display: inline;float:left;width: 25%;">
        <a href="#" style="cursor: pointer;height: auto;background-color: white; ">
            <img src="../images/icon3.png" style="width: 70px;height: 70px;"><br>
            萝卜白菜
        </a>
    </div>
    <div style="display: inline;float:left;width: 25%;">
        <a href="#" style="cursor: pointer;height: auto;background-color: white; ">
            <img src="../images/icon4.png" style="width: 70px;height: 70px;"><br>
            查历史价
        </a>
    </div>

    <div style="display: inline;float:left;width: 25%;">
        <a href="#" style="cursor: pointer;height: auto;background-color: white; ">
            <img src="../images/icon6.png" style="width: 70px;height: 70px;"><br>
            推荐推荐
        </a>
    </div>

    <div style="display: inline;float:left;width: 25%;">
        <a href="#" style="cursor: pointer;height: auto;background-color: white; ">
            <img src="../images/icon8.png" style="width: 70px;height: 70px;"><br>
            比价搜索
        </a>
    </div>
    -->

    <div style="clear: both;"></div>
</div>

<input id="orderby_id" type="hidden" name="orderby" value="${goods.orderby}">
<input id="recpoint_id" type="hidden" name="recpoint" value="${goods.recpoint}">
