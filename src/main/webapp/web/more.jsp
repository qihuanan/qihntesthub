<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="obj" items="${list }" >
    <li>
        <div class="i-pic limit">
            <a href="${obj.skulink}" target="_blank"><img src="${obj.skupicture }" title="${obj.pricel}" alt="${obj.pricel}" /></a>
            <a href="${obj.skulink}" ><p class="title fl">${obj.name }</p></a>
            <p class="price fl" style="font-weight: normal;"  >
                价格:<b>¥</b><strong>${obj.price }</strong>&nbsp;
                最低:<strong>
                    ${obj.pricel}
            </strong><br>
                <span style="font-size: 14px;color: green;" >${obj.recpoint} </span>
            </p>
            <p class="number fl">
                销量<span>${obj.inOrderCount}</span>
            </p>
        </div>
    </li>
</c:forEach>
