<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="优惠查询-优惠推荐-买什么查一查">
    <meta name="description" content="薅羊毛-BUG价-最新优惠-买前查一查">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <jsp:useBean id="time" class="java.util.Date"/>
    <title>${huashu}-${dtitle}-<fmt:formatDate value="${time }" type="date" pattern="MM-dd HH:mm"/> </title>
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/seastyle.css" rel="stylesheet" type="text/css" />
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <script type="text/javascript" src="../js/my.js"></script>
</head>
<body>


<form action="/tbs" method="get">
<div class="nav white">
    <div class="logo"><a href="/"><img src="../images/tomcat.png" /></a></div>
    <div class="logoBig">
        <li><img src="" /></li>
    </div>
    <div class="search-bar pr">
        <div class="search1">
            <input id="searchInput" name="name" type="text" value="${goods.name}" onfocus="$(this).select();" >
            <input id="ai-topsearch" class="submit am-btn"  value="搜索"  type="button" onclick="$('#curPage').val(1);submitform();">
        </div>
        <div style="line-height: 30px;margin-bottom: 10px;font-size: 15px;background: #e6e6e6; ">&nbsp;
            <a href="#" onclick="$('#searchInput').val('抽纸');document.forms[0].submit();">抽纸</a>&nbsp;&nbsp;
            <a href="#" onclick="$('#searchInput').val('美的空调');document.forms[0].submit();">美的空调</a>&nbsp;&nbsp;

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
                    <ul class="select" style="margin-top: 5px;border: none;box-shadow:none;">
                        <div class="sort" style="margin-top: -3px;" >
                            <p class="title font-normal">
                                <a <c:if test="${goods.orderby eq 'tk_rate_desc'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('tk_rate_desc');$('#recpoint_id').val('');document.forms[0].submit();">综合</a>
                                <a <c:if test="${goods.orderby eq 'total_sales_desc'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('total_sales_desc');document.forms[0].submit();">销量</a>
                                <a <c:if test="${goods.orderby eq 'price_asc'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('price_asc');document.forms[0].submit();">价格</a>
                                <a <c:if test="${goods.recpoint eq '1'}">class="div-selected"</c:if> href="#" onclick="$('#recpoint_id').val('1');document.forms[0].submit();">只看天猫</a>

                                <input id="orderby_id" type="hidden" name="orderby" value="${goods.orderby}">
                                <input id="recpoint_id" type="hidden" name="recpoint" value="${goods.recpoint}">
                            </p>
                        </div>
                    </ul>

                    <ul id="data_goods" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                        <c:forEach var="obj" items="${list }" >
                            <li>
                                <div class="i-pic limit">
                                    <a href="${obj.url}" target="_blank"><img src="${obj.pictUrl }" /></a>
                                    <a href="${obj.url}" target="_blank"><p class="title fl">${obj.title }</p></a>
                                    <p class="price fl" style="font-weight: normal;"  >
                                        <span style="color: black;">一口价:</span><b>¥</b><strong style="font-size:large ;text-decoration: line-through;">${obj.reservePrice }</strong>&nbsp;
                                        <span style="color: black;">折扣价:</span><b>¥</b><strong style="font-size: x-large;">${obj.zkFinalPrice}</strong><br>
                                        <a target="_blank" style="" href="${obj.couponShareUrl}">
                                        <span style="font-size: 16px;color: green;margin-top: 20px;" >券：${obj.couponInfo}</span>
                                        </a>
                                    </p>
                                    <p class="number fl">
                                        月销量<span>${(obj.volume+100)*1 }</span>
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


function submitform() {
    document.forms[0].submit();
}


function historyprice(id,skuid) {
    var surl = $('#searchInput').val();
    $.ajax({
        url: "/goods/hisPrice",
        type: 'get', async:false,
        dataType: 'text',
        data: {
            id:id,
            url: escape(surl),
            token:d.encrypt(surl,2,true)

        },
        success: function (result) {
            $('#searchInput').val(skuid);
            document.forms[0].submit();
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