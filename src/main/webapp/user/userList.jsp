<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>user List</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

    <link href="../assets/css/bootstrap.css" rel="stylesheet"/>
    <link href="../assets/css/custom-styles.css" rel="stylesheet"/>
    <link href="../assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>

</head>
<body>

<div id="wrapper">
    <%@ include file="/include/header.jsp" %>
    <!--/. NAV TOP  -->
    <%@ include file="/include/left.jsp" %>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">

            <div class="row">
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <!--
                        <div class="panel-heading">
                            Advanced Tables &nbsp;&nbsp;
                        </div>
                        -->
                        <div class="panel-body" >
                            <div style="position: absolute;z-index: 100;margin-right: 40px; top: 300px;float: right;left: 70%;">

                                <a href="/goods/mergeUI">添加添加</a><br><br>

                                <a  href="#" onclick="getprice(1)">getgid</a><br><br>
                                <a  href="#" onclick="getprice(0)">stopgid</a><br><br>
                                <a  href="#" onclick="getprice2(1)">updateprice</a><br><br>
                                <a  href="#" onclick="getprice2(0)">stopprice</a><br><br>

                            </div>
                            <form action="/user/list" method="post">
                                <div class="table-responsive" >
                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6" style="margin-bottom: 5px;">&nbsp;&nbsp;
                                            S: <input type="text" name="name" value="${user.name}" width="40px"><br>
                                            gid: <input type="text" name="gid" value="${user.gid}" width="40px"><br>
                                            oneflag: <input type="text" id="onefid" name="oneflag" value="${user.oneflag}"width="20px" >
                                            <span onclick="$('#onefid').val(1)">11</span>
                                            <span onclick="$('#onefid').val(0)">00</span>
                                            <br>
                                            time: <input type="text" id="utimeid" name="updatetime2" value="${user.updatetime2}" width="20px">
                                            <span onclick="$('#utimeid').val(1)">11</span>
                                            <span onclick="$('#utimeid').val(3)">33</span>
                                            <span onclick="$('#utimeid').val(6)">66</span>
                                            <br>
                                            orderby: <input type="text" id="orderbyid" name="orderby" value="${user.orderby}" width="20px">
                                            <span onclick="$('#orderbyid').val('zhekou')">zhekou</span>
                                            <span onclick="$('#orderbyid').val('youhui')">youhui</span>
                                            <span onclick="$('#orderbyid').val('yjyouhui')">yjyouhui</span>
                                            <input type="submit" value="查询"></input>
                                        </div>
                                    </div>
                                    <div id='description' style="display: block;">
                                        <div id="showdiv">;</div>
                                        <div>update: ${lastupdate.gid} -- last: ${lastid.gid} -- runflag: ${runflag} -- updateflag: ${updateflag} --
                                            <br> ${forestupdate} - ${forest.gid}  - ${get1w} -更新 ${cc}

                                        </div>
                                    </div>

                                </div>
                                <table class="table table-striped table-bordered table-hover" style="width: 99%">
                                    <thead>
                                    <tr>
                                        <td width="50%">ID</td>
                                        <td width="50%">gid</td>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="obj" items="${userList }" >
                                        <tr>
                                            <td ><a href="https://item.m.qihn.com/product/${obj.gid}.html">${obj.gid}</a> <br>${obj.name} <br><br>${obj.couponprom } <br>

                                                <span style="cursor: hand;" onclick="shengchengguiguang(${obj.gid },${obj.id})">生成</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <span style="cursor: hand;" onclick="delobj(${obj.id},${obj.gid})">删除</span>&nbsp;&nbsp;
                                                <span style="cursor: hand;" onclick="updateone(${obj.gid})">更新</span>
                                                <br><span  id="uid${obj.gid}">;</span>
                                                <!--
                                                <a href="/user/show/${obj.id }">详细</a>&nbsp;&nbsp;
                                                -->
                                            </td>
                                            <td>
                                                当前：${obj.price} <br>
                                                上次：${obj.price2}<br>
                                                本次：${obj.price3}<br>
                                                最低： ${obj.pricelowest} <br>
                                                折扣：${obj.zhekou} 折<br>
                                                优惠：${obj.youhui}（上次）<br>
                                                优惠：${obj.yjyouhui}（当前）<br>
                                                单件：${obj.oneflag}<br>
                                                在售：${obj.onsale}<br>
                                                 ${obj.nice_name}<br>
                                                <span style="cursor: hand;" onclick="resetzhekou(${obj.id })">折100</span>&nbsp;&nbsp;&nbsp;&nbsp;
                                                <a href="/user/edit?id=${obj.id }">编辑</a>&nbsp;&nbsp;
                                                <br>

                                            </td>
                                        </tr>


                                    </c:forEach>


                                    </tbody>
                                </table>

                                <div class="row" style="width: 99%">
                                    <div class="col-sm-6"></div>
                                    <div class="col-sm-6">
                                        <div class="dataTables_paginate paging_simple_numbers" id="dataTables-example_paginate">
                                            <%@include file="/include/page.jsp"%>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </form>

                    </div>
                </div>
                <!--End Advanced Tables -->
            </div>
        </div>
        <!-- /. ROW  -->

    </div>
    <footer><p>Copyright &copy; 2018.Company name All rights reserved.</p></footer>
</div>
<!-- /. PAGE INNER  -->
</div>
<!-- JS Scripts-->

<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
    });

    function  getprice(flag) {
        //window.location.href="/goods/getprice?run="+flag;
        $.ajax({type:"get",datatype:"html",url:"/goods/getprice?run="+flag,
            data:{'ids':1},cache:false,
            success:function(result){
            }
        });
    }

    function  getprice2(flag) {
        //window.location.href="/goods/updateprice?updateflag="+flag;
        $.ajax({type:"get",datatype:"html",url:"/goods/updateprice?updateflag="+flag,
            data:{'ids':1},cache:false,
            success:function(result){
            }
        });
    }

    function shengchengguiguang(gid,id) {
        $.ajax({type:"get",datatype:"html",url:"/goods/autotuiguangbyskuid?skuid="+gid,
            data:{'ids':1},cache:false,
            success:function(result){
                if(result==gid){
                    $("#uid"+gid).append(gid).append(",");
                    resetzhekou(id)

                }
            }
        });
    }

    function resetzhekou(id) {
        $.ajax({type:"get",datatype:"html",url:"/user/edityh?id="+id,
            data:{'ids':1},cache:false,
            success:function(result){
                $("#uid"+gid).append(result).append(",");
            }
        });
    }
    
    function updateone(gid) {
        $.ajax({type:"get",datatype:"html",url:"/goods/updatepriceSingle?gid="+gid,
            data:{'ids':1},cache:false,
            success:function(result){
                $("#uid"+gid).append(result).append(",");
            }
        });

    }
    
    function delobj(id,gid) {

            $.ajax({type:"get",datatype:"html",url:"/user/del?id="+id,
                data:{'ids':1},cache:false,
                success:function(result){
                    $("#uid"+gid).append(result).append(",");
                }
            });
    }

</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>