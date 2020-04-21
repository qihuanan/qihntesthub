<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>exam List</title>
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

                            <form action="${sysPath}/exam/list" method="post">
                                <div class="table-responsive">
                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6" style="margin-bottom: 5px;">&nbsp;&nbsp;
                                            <input type="hidden" name="pointid" value="${exam.pointid}" />
                                            <input type="hidden" name="pointname" value="${exam.pointname}" />
                                            S: <input type="text" name="name" value="${exam.name}">
                                            <input type="submit" value="查询"></input>&nbsp;
                                            <a href="${sysPath}/exam/mergeUI?pointid=${exam.pointid}&pointname=${exam.pointname}"><input type="button" value="添加"></input></a>
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
                                            <th >题目名称</th>
                                            <th >题目说明</th>
                                            <th >题目图片</th>
                                            <th >答案</th>
                                            <th >奖励-文字描述</th>
                                            <th >奖励-拼图碎片</th>

                                            <th >答题机会</th>
                                            <th >答题正确提示语</th>
                                            <th >答题错误提示语</th>
                                            <th >是否显示答案</th>
                                            <th >类型</th>
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
                                                    <c:if test="${!empty obj.picture1 }">
                                                        <img src="${sysPath}/download?filename=${obj.picture1}" width="100px" height="100px">
                                                    </c:if>
                                                </td>

                                                <td> ${obj.answer } </td>
                                                <td> ${obj.prize } </td>
                                                <td> <c:if test="${!empty obj.prizeimg }">
                                                    <img src="${sysPath}/download?filename=${obj.prizeimg}" width="100px" height="100px">
                                                    </c:if>
                                                </td>

                                                <td> ${obj.chance } </td>
                                                <td> ${obj.success } </td>
                                                <td> ${obj.fail } </td>
                                                <td> ${obj.showanswer } </td>
                                                <td> ${obj.cate } </td>
                                                <td>
                                                    <a href="${sysPath}//exam/mergeUI?id=${obj.id }">编辑</a>
                                                    <br><br>
                                                    <a href="${sysPath}//exam/delete?id=${obj.id }">删除</a>
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
        $("#mmenu_exam").addClass("active-menu");

    });


</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>