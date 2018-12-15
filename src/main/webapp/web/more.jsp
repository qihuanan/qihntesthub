<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="obj" items="${list }" >
    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
        <div class="am-u-sm-4 am-list-thumb">
            <a href="${obj.skulink}" class="">
                <img width="100px" height="100px" src="${obj.skupicture }"/>
            </a>
        </div>
        <div class=" am-u-sm-8 am-list-main">
            <h3 class="am-list-item-hd"><a href="${obj.skulink}" class="">${obj.name }&nbsp;&nbsp;<strong style="color: #d58512">${obj.price }</strong></a></h3>
            <div class="am-list-item-text">${obj.recpoint}</div>
        </div>
    </li>

</c:forEach>
