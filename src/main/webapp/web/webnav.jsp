<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<a <c:if test="${goods.orderby eq 'tk_rate_desc'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('tk_rate_desc');$('#recpoint_id').val('');document.forms[0].submit();">综合</a>
<a <c:if test="${goods.orderby eq 'total_sales_desc'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('total_sales_desc');document.forms[0].submit();">销量</a>
<a <c:if test="${goods.orderby eq 'price_asc'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('price_asc');document.forms[0].submit();">价格</a>
<a <c:if test="${goods.recpoint eq '1'}">class="div-selected"</c:if> href="#" onclick="$('#recpoint_id').val('1');document.forms[0].submit();">只看天猫</a>
&nbsp;||&nbsp;
<a <c:if test="${goods.recpoint eq 'jd'}">class="div-selected"</c:if>  href="#" onclick="$('#recpoint').val('jd'); searchjd();">瞧瞧京东</a>
<a <c:if test="${goods.recpoint eq 'joy'}">class="div-selected"</c:if>  href="/?recpoint=joy" >joy推荐</a>
<a <c:if test="${goods.recpoint eq 'jhms'}">class="div-selected"</c:if> href="/jdms?recpoint=jhms" >尖货秒杀</a>
<a <c:if test="${goods.recpoint eq '0'}">class="div-selected"</c:if> href="/tbs/tqg?recpoint=0">淘抢购</a>
<a <c:if test="${goods.recpoint eq '1'}">class="div-selected"</c:if> href="/tbs/tqg?recpoint=1">淘抢购即将开始</a>

<input id="orderby_id" type="hidden" name="orderby" value="${goods.orderby}">
<input id="recpoint_id" type="hidden" name="recpoint" value="${goods.recpoint}">
