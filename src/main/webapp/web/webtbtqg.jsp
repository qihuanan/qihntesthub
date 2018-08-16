<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="猫狗汇 京东淘宝天猫一网通 历史价查询 尽在猫狗汇-${huashu}">
    <meta name="description" content="猫狗汇 京东淘宝天猫一网通 历史价查询 尽在猫狗汇-${huashu}">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <jsp:useBean id="time" class="java.util.Date"/>
    <title>猫狗汇 京东淘宝天猫一网通 历史价查询尽在猫狗汇-${huashu} </title>
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/seastyle.css" rel="stylesheet" type="text/css" />
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <script type="text/javascript" src="../js/my.js"></script>
</head>
<body>


<form id="form_id" action="/tbs" method="get">
    <jsp:include page="webheader.jsp"></jsp:include>

<div class="clear"></div>
<div class="search" >
    <div class="search-list">
        <div class="am-g am-g-fixed">
            <div class="am-u-sm-12 am-u-md-12">
                <div class="search-content">
                    <div class="clear"></div>
                    <ul class="select" style="border: none;box-shadow:none;">
                        <jsp:include page="webnav.jsp"></jsp:include>
                    </ul>

                    <div style="height: 30px;margin-top: 10px;">
                        &nbsp;&nbsp;<a <c:if test="${goods.recpoint eq 'tqg'}">class="div-selected"</c:if> href="/tbs/tqg?recpoint=tqg2">淘抢购进行中</a>
                        &nbsp;&nbsp;<a <c:if test="${goods.recpoint eq 'tqg2'}">class="div-selected"</c:if> href="/tbs/tqg?recpoint=tqg2">淘抢购即将开始</a>
                    </div>

                    <ul id="data_goods" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                        <c:forEach var="obj" items="${list }" >
                            <li>
                                <div class="i-pic limit" title="${obj.reservePrice }">
                                    <a id="aid_${obj.numIid}" href="${obj.clickUrl}" title="${obj.clickUrl}" target="_blank"><img src="${obj.picUrl }" /></a>
                                    <a href="${obj.clickUrl}" target="_blank"><p class="title fl">${obj.title }</p></a>
                                    <p class="price fl" style="font-weight: normal;margin-bottom: 10px;"  >
                                        <span style="color: black;">日常价:</span><b>¥</b><strong style=";color: black;"> ${obj.reservePrice}</strong>&nbsp;&nbsp;<br>
                                        <span style="color: black;">活动价:</span><b>¥</b><strong style="font-size:large ;"> ${obj.zkFinalPrice}</strong>&nbsp;&nbsp;<br>
                                        <span style="color: black;">活动已抢购: ${obj.soldNum } </span><br>
                                        <span style="color: black;">活动总库存:  ${obj.totalAmount } </span><br>
                                        <!--
                                        <span style="color: black;">最低价:</span><b>¥</b>
                                            <strong style="font-size: x-large;" id="price2_${obj.numIid}"><a href="javascript:historyprice(${obj.numIid});" style="color:yellowgreen;font-size: large">&nbsp;&nbsp;查&nbsp;询&nbsp;&nbsp;</a></strong>
                                        <br>
                                        -->
                                        <span style="color: black;">开始：${obj.startTime} <br>
                                        <span style="color: black;">结束：${obj.endTime} <br>
                                    </p><br>

                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="clear"></div>


                <!--分页 -->
                <ul class="am-pagination am-pagination-right" style="text-align: center;">
                    <div id="load_more" onclick="showmore();" style="cursor: pointer;padding-bottom: 10px;font-size: 16px;">查看更多</div>
                    <span id="load_more_loading"></span>

                </ul>

            </div>
        </div>

    </div>

</div>
    <input type="hidden" id="curPage" name="curPage" value="${pageInfo.curPage}" />
    <input type="hidden" id="txtPageNum"  />
    <input type="hidden" id="oldPageSize"
           value="<c:if test='${empty pageInfo.pageSize}'>10</c:if><c:if test='${!empty pageInfo.pageSize}'>${pageInfo.pageSize}</c:if>" />
    <input type="hidden" name="pageSize" id="textPageSize"
           value="<c:if test='${empty pageInfo.pageSize}'>10</c:if><c:if test='${!empty pageInfo.pageSize}'>${pageInfo.pageSize}</c:if>"
           style="height: 15px;width: 30px;"
           onkeyup="if(isNaN(this.value)){this.value='';}" />
</form>
</body>
<script type="text/javascript">

$(document).ready(function () {
    $('#searchInput').focus();
});

function searchjd() {
    $('#form_id').attr('action','/jds');
    $('#orderby_id').val('id');
    $('#curPage').val('1');
    $('#recpoint_id').val('');
    document.forms[0].submit();
}

function submitform() {
    document.forms[0].submit();
}

function historyprice(skuid) {
    var surl = $('#aid_'+skuid).attr('title');
    surl = "http:"+surl;
    $.ajax({
        url: "/goods/hisPrice2",
        type: 'get', async:true,
        dataType: 'text',
        data: {
            url: escape(surl),
            token:d.encrypt(surl,2,true)
        },
        success: function (result) {
            $('#price2_'+skuid).text(result);
        }
    });
}

function showmore() {
    var curPage = $('#curPage').val();
    $('#curPage').val(parseInt(curPage)+1);
    curPage = $('#curPage').val();
    var formtext = $("form").serialize();
    $.ajax({
        url: "/more",
        type: 'get', async:true,
        dataType: 'text',
        data: formtext,
        beforeSend:function () {
            //$("#load_more_loading").html("<div><img src='../images/loading.gif' /><div>");
        },
        success: function (result) {
            //$("#load_more_loading").html("");
            if($.trim(result) != ""){
                $('#data_goods').append(result);
            }else{
                $('#load_more').text('┭┮﹏┭┮ 没有更多啦...');
            }
        }
    });

}

</script>



</html>