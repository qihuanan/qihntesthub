<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>line List</title>
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

                            <form action="${sysPath}/line/list" method="post">
                                <div class="table-responsive">
                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6" style="margin-bottom: 5px;">&nbsp;&nbsp;
                                            S: <input type="text" name="name" value="${line.name}">
                                            <input type="submit" value="查询"></input>&nbsp;
                                            <a href="${sysPath}/line/mergeUI"><input type="button" value="添加"></input></a>
                                            <a href="${sysPath}/line/paysetUI"><input type="button" value="时间支付设置"></input></a>
                                        </div>
                                    </div>
                                    <div id='description' style="display: block;">
                                        <div>update:
                                        </div>


                                    </div>
                                    <table class="table table-striped table-bordered table-hover" style="width: 99%">
                                        <thead>
                                        <tr>
                                            <th >名称<br>文字介绍</th>
                                            <th >封面图片<br>详情图片</th>
                                            <th >经度<br>纬度</th>
                                            <th >长度<br>签到点个数<br>免费点个数</th>
                                            <th >积分<br>验证距离</th>
                                            <th >地图缩放<br>顺序<br>旗帜缩放</th>
                                            <th >时间<br>显示</th>
                                            <th >密码<br>强制顺序</th>
                                            <th >操作</th>

                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="obj" items="${list }">
                                            <tr>
                                                <td style="max-width: 100px;">
                                                        ${obj.name }
                                                    <br>
                                                        ${obj.description }
                                                </td>
                                                <td>
                                                    <c:if test="${!empty obj.picture1 }">
                                                        <img src="${sysPath}/download?filename=${obj.picture1}" width="100px" height="100px">
                                                    </c:if>
                                                    <br>
                                                    <c:if test="${!empty obj.picture2 }">
                                                        <img src="${sysPath}/download?filename=${obj.picture2}" width="100px" height="100px">
                                                    </c:if>
                                                </td>

                                                <td> ${obj.jingdu }<br>${obj.weidu } </td>
                                                <td> ${obj.changdu }<br> ${obj.dianshu }<br> ${obj.freenum } </td>
                                                <td> ${obj.jifen }<br>${obj.qiandaojuli } </td>
                                                <td> ${obj.ditudaxiao }<br>${obj.shunxu }<br>${obj.qizhidaxiao } </td>
                                                <td> ${obj.shijian }<br>${obj.onshow }  </td>
                                                <td> ${obj.mima }<br>${obj.orderflag } </td>
                                                <td width="100px;">
                                                    <a href="${sysPath}//line/mergeUI?id=${obj.id }">编辑</a>
                                                    <br><br>
                                                    <a href="${sysPath}//point/list?lineid=${obj.id }&linename=${obj.name}">签到点</a>
                                                    <br><br>


                                                    <a href="${sysPath}/baoxiang/list?lineid=${obj.id }&linename=${obj.name}">宝箱</a>
                                                    <br><br>
                                                    <!--
                                                    <a href="${sysPath}//line/delete?id=${obj.id }">删除</a>
                                                    -->
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
        $("#mmenu_line").addClass("active-menu");

    });


</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>