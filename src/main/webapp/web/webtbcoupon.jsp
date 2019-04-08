<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="慧惠助手-${title}-慧惠助手-用智慧汇集优惠,${huashu}好物好券、大额优惠券薅羊毛白菜价历史价格查询全网比价">
    <meta name="description" content="${title}-慧惠助手-用智慧汇集优惠,${huashu}好物好券、大额优惠券薅羊毛白菜价历史价格查询全网比价">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <jsp:useBean id="time" class="java.util.Date"/>
    <title>${title}-慧惠助手-用智慧汇集优惠-${huashu}-好物好券渠道券自动扒、xx淘宝天猫一网通 历史价查询 </title>
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/seastyle.css" rel="stylesheet" type="text/css" />
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <script type="text/javascript" src="../js/my.js"></script>
</head>
<body>

<form id="form_id" action="/tbs/coupon" method="get">


    <div class="topclass">
        <a href="/">慧惠助手-用智慧汇集优惠<br>超值好券薅羊毛白菜价历史价格查询</a>
    </div>
    <div class="nav white">
        <div class="logo" style="margin-top: -3px;"><a href="/"><img src="../images/tomcat.png" /></a></div>
        <div class="search-bar pr">
            <div class="search1">
                <input id="squan_id" placeholder="输入关键字、搜索好券" style="width: 60%;" name="q" type="text" value="${goods.q}" onfocus="$(this).select();" >
                <input id="ai-topsearch2" class="submit am-btn" style="background-color: yellowgreen;width: 40%;"  value="搜淘宝天猫好券"  type="button" onclick="$('#curPage').val(1);souhaoquan();">
            </div>

        </div>
    </div>


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


                    <ul id="data_goods" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                        <c:forEach var="obj" items="${list }" >
                            <li>
                                <div class="i-pic limit" >
                                    <a id="aid_${obj.numIid}" href="${empty obj.couponClickUrl ? obj.itemUrl : obj.couponClickUrl }" title="${obj.itemUrl}" target="_blank"><img src="${obj.pictUrl }" /></a>
                                    <a href="${empty obj.couponClickUrl ? obj.itemUrl : obj.couponClickUrl }" target="_blank"><p class="title fl">${obj.title }</p></a>
                                    <p class="title fl" style="height: 18px;">
                                        活动价:</span><b>¥</b><strong style="font-size:large ;"> ${obj.zkFinalPrice}</strong>
                                    </p>
                                    <p class="title fl" style="color: red;font-size: 16px;text-decoration: none; padding: 5px 0px;font-weight: bold;">
                                        <a href="${obj.couponClickUrl}" target="_blank" ><span style="color: red;"> 领券：${obj.couponInfo }</span><span style="color: green;"></span></a>
                                    </p>

                                    <p class="title fl" style="height: 18px;">
                                        开始：${obj.couponStartTime}
                                    </p>
                                    <p class="title fl" style="height: 18px;">
                                        结束：${obj.couponEndTime}
                                    </p>



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

function searchdj() {
    $('#form_id').attr('action','/djs');
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
function souhaoquan() {
    window.location.href='/tbs/coupon?recpoint=coupon&q='+$('#squan_id').val();
}

function searchtb() {
    $('#form_id').attr('action','/tbs');
    $('#orderby_id').val('');
    $('#recpoint_id').val('');
    document.forms[0].submit();
}
</script>



</html>