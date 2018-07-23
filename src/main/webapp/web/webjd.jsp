<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %><%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="猫狗汇 京东淘宝天猫一网通 历史价查询 尽在猫狗汇">
    <meta name="description" content="猫狗汇 京东淘宝天猫一网通 历史价查询 尽在猫狗汇">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <jsp:useBean id="time" class="java.util.Date"/>
    <title>${huashu} 猫狗汇 京东淘宝天猫一网通 历史价查询 尽在猫狗汇 </title>
    <link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/demo.css" rel="stylesheet" type="text/css" />
    <link href="../AmazeUI-2.4.2/basic/css/seastyle.css" rel="stylesheet" type="text/css" />
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script type="text/javascript" src="../js/script.js"></script>
    <script type="text/javascript" src="../js/my.js"></script>
</head>
<body>
<div class="topclass">
    猫狗汇 京东淘宝天猫一网通 历史价查询
</div>

<form id="form_id" action="/jds" method="get">
<div class="nav white">
    <div class="logo"><a href="/"><img src="../images/tomcat.png" /></a></div>
    <div class="logoBig">
        <li><img src="" /></li>
    </div>
    <div class="search-bar pr">
        <div class="search1">
            <input id="searchInput" placeholder="输入你想要的商品试试" style="width: 60%;" name="name" type="text" value="${goods.name}" onfocus="$(this).select();" >
            <input id="ai-topsearch2" class="submit am-btn" style="background-color: yellowgreen;width: 20%;"  value="搜淘宝"  type="button" onclick="$('#curPage').val(1);searchtb();">
            <input id="ai-topsearch" class="submit am-btn" style="background-color: red; width: 20%;font-weight: bold;" value="搜京东"  type="button" onclick="$('#curPage').val(1);submitform();">
        </div>
        <div style="line-height: 30px;margin-bottom: 10px;font-size: 15px;background: #e6e6e6; ">&nbsp;
            <a href="#" onclick="$('#searchInput').val('空调');document.forms[0].submit();">空调</a>&nbsp;&nbsp;
            <a href="#" onclick="$('#searchInput').val('冰箱');document.forms[0].submit();">冰箱</a>&nbsp;&nbsp;

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
                    <ul class="select" style="margin-top: 35px;border: none;box-shadow:none;">
                        <div class="sort" style="margin-top: -3px;" >
                            <p class="title font-normal">

                                <a <c:if test="${goods.orderby eq '0'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('0');$('#recpoint_id').val('0'); document.forms[0].submit();">推荐</a>
                                <a <c:if test="${goods.orderby eq '3'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('3');document.forms[0].submit();">销量</a>
                                <a <c:if test="${goods.orderby eq '2'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('2');document.forms[0].submit();">价格</a>
                                <input id="orderby_id" type="hidden" name="orderby" value="${goods.orderby}">
                                <input id="recpoint_id" type="hidden" name="recpoint" value="${goods.recpoint}">
                                <a <c:if test="${goods.recpoint eq '1'}">class="div-selected"</c:if> href="#" onclick="$('#recpoint_id').val('1');document.forms[0].submit();">京东物流</a>
                                <a href="#" onclick="searchtb();">瞧瞧淘宝</a>
                                <a href="/" >joy推荐</a>

                            </p>
                        </div>
                    </ul>

                    <ul id="data_goods" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
                        <c:forEach var="obj" items="${list }" >
                            <li>
                                <div class="i-pic limit">
                                    <a href="javascript:jtlink(${obj.skuid});" target="_blank" title="${obj.adwords}"><img src="${obj.skupicture }"  /></a>
                                    <a id="aid_${obj.skuid}" href="javascript:jtlink(${obj.skuid});" title="${obj.skulink}"><p class="title fl">${obj.name }</p></a>
                                    <p class="price fl" style="font-weight: normal;margin-bottom: 10px;cursor: pointer"  >
                                        当前价格:<strong style="font-size:large ;">${obj.pricestr }</strong>&nbsp;<br>
                                        历史最低:<strong id="price2_${obj.skuid}" style="font-size:large ;"><b>¥</b>&nbsp;
                                            <a href="javascript:historyprice(${obj.skuid});" style="color:yellowgreen;font-size: large;">&nbsp;&nbsp;查&nbsp;询&nbsp;&nbsp;</a>
                                            </strong><br>

                                            <span style="font-size: 14px;margin-top: 20px;" >${obj.commitinfo}</span>

                                    </p><br>
                                    <p class="number fl" style="margin-top: 20px;" onclick="jtlink(${obj.skuid});">
                                        <span>${obj.shopinfo}</span>
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
                    <!--
                    <li ><a href="#">${pageInfo.curPage}/${pageInfo.pageCount}</a></li>
                    <li ><a href="javascript:gotoPage(1)">&laquo;</a></li>
                    <li>
                        <c:if test="${pageInfo.curPage gt 1}">
                            <a href="javascript:gotoPage(${pageInfo.curPage - 1})">[上一页]</a>
                        </c:if>
                    </li>
                    <li>
                        <c:if test="${pageInfo.curPage lt pageInfo.pageCount}">
                            <a href="javascript:gotoPage(${pageInfo.curPage + 1})">[下一页]</a>
                        </c:if>
                    </li>
                    <li><a href="javascript:gotoPage(${pageInfo.pageCount})">&raquo;</a></li>
                    -->
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

function searchtb() {
    $('#form_id').attr('action','/tbs');
    $('#orderby_id').val('');
    $('#recpoint_id').val('');
    document.forms[0].submit();
}
function submitform() {
    document.forms[0].submit();
}

function jtlink(skuid) {
    $.ajax({
        url: "/jtlink?skuid="+skuid,
        type: 'get', async:false,
        dataType: 'text',
        data: {
            skuid2:skuid
        },
        success: function (result) {
            if(result!=''){
                window.location.href=result;
            }else{
                window.location.href=$('#aid_'+skuid).attr('title');
            }
        }
    });

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