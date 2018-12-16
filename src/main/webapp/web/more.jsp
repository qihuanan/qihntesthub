<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="obj" items="${list }" >
    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-top">
        <div class="am-list-thumb am-u-sm-12">
            <a href="${obj.skulink}" class="">
                <img width="80%" height="80%" src="${obj.skupicture }" />
            </a>
        </div>
        <div class=" am-list-main">
            <a href="${obj.skulink}" style="font-size: 14px;">
                                                        <pre style="color: #ff6c00;font-size: 16px;padding-top: 10px;">${obj.recpoint}
                                                        </pre>
                <br>&nbsp;&nbsp;<span style="float: right;margin-right: 20px;font-size: 14px;">${obj.remark}</span>
            </a>
        </div>
    </li>
</c:forEach>