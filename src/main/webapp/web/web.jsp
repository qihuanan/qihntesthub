<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="keywords" content="${huashu}慧惠助手">
    <meta name="description" content="${huashu}慧惠助手">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="icon" href="/favicon.ico" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <jsp:useBean id="time" class="java.util.Date"/>
    <title>${huashu}慧惠助手 </title>
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

    <!--
    <jsp:include page="webheader.jsp"></jsp:include>
    -->

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
                        <ul class="select" style="border: none;box-shadow:none;">

                            <div class="nav white">
                                <div class="search-bar pr">
                                    <div class="search1">
                                        <input id="searchngid" placeholder="输入关键字查内购" style="width: 70%;" name="name" type="text" value="${goods.name}" onfocus="$(this).select();" >
                                        <input id="ai-topsearch" class="submit am-btn" style="background-color: red; width: 30%;font-weight: bold;" value="搜内购优惠"  type="button" onclick="$('#curPage').val(1);searchng();">
                                    </div>
                                </div>
                            </div>


                        </ul>

                        <ul  class="am-avg-sm-2 am-avg-md-3 am-avg-lg-4 boxes">

                            <div data-am-widget="list_news" class="am-list-news am-list-news-default" >

                                <div class="am-list-news-bd">
                                    <ul class="am-list" id="data_goods">

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

                                    </ul>
                                </div>

                            </div>


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
        $("a").click(function(){
           var aid =  $(this).parent().attr('title');
            accesslog(aid);
        });
    });
    function searchtb() {
        $('#form_id').attr('action','/tbs');
        $('#orderby_id').val('');
        $('#recpoint_id').val('');
        document.forms[0].submit();
    }

    function  accesslog(id) {
        $.ajax({type:"get",datatype:"html",url:"/log",
            data:{gid:id},cache:false,async:true,
            success:function(result){
            }
        });
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

    function searchng() {
        $('#form_id').attr('action','/');
        $('#orderby_id').val('id');
        $('#curPage').val('1');
        $('#recpoint_id').val('');
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
    function searchtb() {
        $('#form_id').attr('action','/tbs');
        $('#orderby_id').val('');
        $('#recpoint_id').val('');
        document.forms[0].submit();
    }
</script>


</html>