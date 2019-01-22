<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:forEach var="obj" items="${list }" >
    <li class="am-g am-list-item-desced am-list-item-thumbed am-list-item-thumb-left" style="height:auto;max-height: 2000px;" >
        <c:if test="${!empty obj.skulink}">
            <div title="${obj.id}" class="am-u-sm-4 am-list-thumb" style="height:auto;max-height: 400px;line-height: 100%">
                <a href="${obj.skulink}" class="" style="height:auto;max-height: 400px;line-height: 100%">
                    <img src="${obj.skupicture }" style="height:auto;max-height: 400px;line-height: 100%"/>
                </a>
            </div>
        </c:if>
        <div  id="${obj.id}" class="am-list-item-text" style="height: 100%;min-height:200px; max-height: 2000px;line-height: 100%;display: block;padding-left: 5px;margin-top: 0px;">
            <c:if test="${!empty obj.skulink}">
                <a href="${obj.skulink}">
                                                        <pre title="${obj.id}"  style="padding:5px;font-size: 14px;height: 100%;max-height: 2000px;line-height: 2">${fn:replace(obj.name, '^^^', '\"')}
                                                        </pre>
                    <br>&nbsp;&nbsp;<span style="float: right;margin-right: 20px;font-size: 12px;">${obj.remark}</span>
                </a>
            </c:if>
            <c:if test="${empty obj.skulink}">
                                                    <pre title="${obj.id}"  style="padding:5px;font-size: 14px;height: 100%;max-height: 2000px;line-height: 2">${fn:replace(obj.name, '^^^', '\"')}
                                                    </pre>
                <br>&nbsp;&nbsp;<span style="float: right;margin-right: 20px;font-size: 12px;">${obj.remark}</span>
            </c:if>

        </div>
    </li>
</c:forEach>