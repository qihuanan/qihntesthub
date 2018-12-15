<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="obj" items="${list }" >
    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left">
        <div class="am-u-sm-4 am-list-thumb" style="max-height: 150px;width: 40%;">
            <a href="${obj.skulink}" class="">
                <img width="150px" height="150px" src="${obj.skupicture }"/>
            </a>
        </div>
        <div class=" am-u-sm-8 am-list-main" style="width: 59%;">
            <h3 class="am-list-item-hd">
                <a href="${obj.skulink}" style="font-size: 14px;">
                        ${obj.name }
                    <strong style="color: #ff6c00;">&nbsp;${obj.price }元&nbsp;</strong>
                </a>
            </h3>
            <div >
                <a href="${obj.skulink}" style="font-size: 14px;">
                    <div style="color: #ff6c00;font-size: 16px;padding-top: 10px;">
                            ${obj.recpoint}
                    </div>
                </a>
            </div>
        </div>
    </li>
</c:forEach>
