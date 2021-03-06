<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>tip List</title>
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
                        <div class="panel-body">

                            <form action="${sysPath}/tip/list" method="post">
                                <div class="table-responsive">
                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6" style="margin-bottom: 5px;">&nbsp;&nbsp;
                                            <input type="hidden" name="pointid" value="${tip.pointid}" />
                                            <input type="hidden" name="pointname" value="${tip.pointname}" />
                                            S: <input type="text" name="name" value="${tip.name}">
                                            <input type="submit" value="查询"></input>&nbsp;
                                            <a href="${sysPath}/tip/mergeUI?pointid=${tip.pointid}&pointname=${tip.pointname}"><input type="button" value="添加"></input></a>
                                        </div>
                                    </div>
                                    <div id='description' style="display: block;">
                                        <div>update:
                                        </div>


                                    </div>
                                    <table class="table table-striped table-bordered table-hover" style="width: 99%">
                                        <thead>
                                        <tr>
                                            <th >所属签到点</th>
                                            <th >提示点名称</th>
                                            <th >文字介绍</th>
                                            <th >图片</th>
                                            <th >顺序</th>
                                            <th >是否需要解锁</th>
                                            <th >解锁扣除积分</th>
                                            <th >操作</th>

                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="obj" items="${list }">
                                            <tr>
                                                <td> ${obj.pointname } </td>
                                                <td> ${obj.name } </td>
                                                <td style="max-width: 200px;"> ${obj.description } </td>
                                                <td>
                                                    <c:if test="${!empty obj.img }">
                                                        <img src="${sysPath}/download?filename=${obj.img}" width="100px" height="100px">
                                                    </c:if>
                                                </td>

                                                <td> ${obj.shunxu } </td>
                                                <td> ${obj.lockflag } </td>
                                                <td> ${obj.jifen } </td>

                                                <td>
                                                    <a href="${sysPath}//tip/mergeUI?id=${obj.id }">编辑</a>
                                                    <br><br>
                                                    <a href="${sysPath}//tip/delete?id=${obj.id }">删除</a>
                                                </td>
                                            </tr>
                                        </c:forEach>


                                        </tbody>
                                    </table>

                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6"></div>
                                        <div class="col-sm-6">
                                            <div class="dataTables_paginate paging_simple_numbers"
                                                 id="dataTables-example_paginate">
                                                <%@include file="/include/page.jsp" %>
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
        <footer><p>Copyright &copy; 2020.Company name All rights reserved.</p></footer>
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
        $("#mmenu_tip").addClass("active-menu");

    });


</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>