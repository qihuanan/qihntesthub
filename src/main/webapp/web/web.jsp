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


<form id="form_id" action="/" method="get">
<div class="nav white">
    <div class="logo"><a href="/"><img src="../images/tomcat.png" /></a></div>
    <div class="logoBig">
        <li><img src="" /></li>
    </div>
    <div class="search-bar pr">
        <div class="search1">
            <input id="searchInput" style="width: 60%;" name="name" type="text" value="${goods.name}" onfocus="$(this).select();" >
            <input id="ai-topsearch2" class="submit am-btn" style="background-color: yellowgreen;width: 20%;"  value="搜淘宝"  type="button" onclick="$('#curPage').val(1);searchtb();">
            <input id="ai-topsearch" class="submit am-btn" style="background-color: red; width: 20%;" value="搜京东"  type="button" onclick="$('#curPage').val(1);submitform();">
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
                    <ul class="select" style="margin-top: 5px;border: none;box-shadow:none;">
                        <div class="sort" style="margin-top: -3px;" >
                            <p class="title font-normal">

                                <a <c:if test="${goods.orderby eq 'id'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('id');document.forms[0].submit();">最新</a>
                                <a <c:if test="${goods.orderby eq 'inOrderCount'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('inOrderCount');document.forms[0].submit();">销量</a>
                                <a <c:if test="${goods.orderby eq 'price'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('price');document.forms[0].submit();">价格</a>
                                <a <c:if test="${goods.orderby eq 'upindex'}">class="div-selected"</c:if> href="#" onclick="$('#orderby_id').val('upindex');document.forms[0].submit();"><span >特别</span></a>
                                <input id="orderby_id" type="hidden" name="orderby" value="${goods.orderby}">
                                <input id="recpoint_id" type="hidden" name="recpoint" value="${goods.recpoint}">
                                <a href="#" onclick="searchtb();">瞧瞧淘宝</a>

                            </p>
                        </div>
                    </ul>

                    <ul id="data_goods" class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">
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
    function searchtb() {
        $('#form_id').attr('action','/tbs');
        $('#orderby_id').val('');
        $('#recpoint_id').val('');
        document.forms[0].submit();
    }

function gotoPage(pageNum){
    if(isNaN(pageNum)){alert('请输入数字！');document.getElementById('txtPageNum').focus();return false;}
    if( pageNum < 1 || pageNum > ${pageInfo.pageCount} ){document.getElementById('txtPageNum').value=${pageInfo.pageCount};pageNum=${pageInfo.pageCount}; }
    if($("#textPageSize").val()==$("#oldPageSize").val()){
        $("#curPage").val(pageNum);
    }else{
        $("#curPage").val("1");
    }
    document.forms[0].submit();
}

function submitform() {
    var orilink = $('#searchInput').val();
    var skuid = orilink.match(/\d+/gi);
    if(skuid==null){
        document.forms[0].submit();
    }else{
        skuid = skuid.toString().split(",")[0];
        $.ajax({type:"get",datatype:"html",url:"/goods/skuExist.htm?skuid="+skuid,
            data:{},cache:false,async:false,
            success:function(result){
                if(result!= 0){
                    $('#searchInput').val(result);
                    document.forms[0].submit();
                }else{
                    getinfo(1);
                }
            }
        });
    }
}

function getinfo(type) {
    var orilink = $('#searchInput').val();
    var skuid = orilink.match(/\d+/gi);
    skuid = skuid.toString().split(",")[0];
    goodsdetail(skuid,type);
}

function goodsdetail(skuid,type) {
    $.ajax({type:"get",datatype:"html",url:"/goods/jttGoodDetail.htm?skuid="+skuid+"&type="+type,
        data:{},cache:false,async:false,
        success:function(result){
            if(result!= ""){
                historyprice(result,skuid);
            }
        }
    });
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