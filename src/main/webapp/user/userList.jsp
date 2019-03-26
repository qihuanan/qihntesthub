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
                                            S: <input type="text" name="name" value="${user.name}" width="80px"><br>
                                            gid: <input type="text" name="gid" value="${user.gid}" width="80px"><br>
                                            oneflag: <input type="text" name="oneflag" value="${user.oneflag}"width="80px" ><br>
                                            time: <input type="text" name="updatetime" value="${user.updatetime}" width="80px">
                                            <input type="submit" value="查询"></input>
                                        </div>
                                    </div>
                                    <div id='description' style="display: block;">
                                        <div>update: ${lastupdate.gid} -- last: ${lastid.gid} -- runflag: ${runflag} -- updateflag: ${updateflag} --
                                            <br> ${forestupdate} - ${forest.gid}  - ${get1w} -更新 ${cc}

                                        </div>
                                    </div>

                                </div>
                                <table class="table table-striped table-bordered table-hover" style="width: 99%">
                                    <thead>
                                    <tr>
                                        <td>ID</td>
                                        <td>gid</td>

                                    </tr>
                                    </thead>
                                    <tbody>

                                    <c:forEach var="obj" items="${userList }" >
                                        <tr>
                                            <td ><a href="https://item.m.jd.com/product/${obj.gid}.html">${obj.gid}</a> <br>${obj.couponprom }<br>${obj.name} <br>
                                                <a href="/user/edityh?id=${obj.id }">编辑优惠100</a> <br>
                                                <a href="/goods/updatepriceSingle?gid=${obj.gid }">更新</a><br>
                                                <a href="/goods/autotuiguangbyskuid?skuid=${obj.gid }">生成</a><br>
                                                <a href="/user/show/${obj.id }">详细</a><br>
                                                <a href="/user/edit?id=${obj.id }">编辑</a><br>
                                                <a href="/user/del/${obj.id }">删除</a>
                                            </td>
                                            <td> 当前/底：${obj.price} / ${obj.pricelowest} <br> 上/本次：${obj.price2} / ${obj.price3}<br> 折/优惠：${obj.zhekou} / ${obj.youhui}
                                                <br> onsale/oneflag：${obj.onsale} ${obj.oneflag}
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
        window.location.href="/goods/getprice?run="+flag;
    }

    function  getprice2(flag) {
        window.location.href="/goods/updateprice?updateflag="+flag;
    }

</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>