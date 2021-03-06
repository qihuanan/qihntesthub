<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="sysPath" value="${pageContext.request.contextPath}" />
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>weItem List</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>

    <link href="${sysPath}/assets/css/bootstrap.css" rel="stylesheet"/>
    <link href="${sysPath}/assets/css/custom-styles.css" rel="stylesheet"/>
    <link href="${sysPath}/assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet"/>

</head>
<body>

<div id="wrapper">
    <%@ include file="/include/header.jsp" %>
    <!--/. NAV TOP  -->
    <%@ include file="/include/leftwe.jsp" %>
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

                            <form action="${sysPath}/weItem/list" method="post">
                                <div class="table-responsive">
                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6" style="margin-bottom: 5px;">&nbsp;&nbsp;
                                            S: <input type="text" name="name" value="${weItem.name}">
                                            <input type="submit" value="查询"></input>&nbsp;
                                            <a href="${sysPath}/weItem/mergeUI"><input type="button" value="添加"></input></a>
                                        </div>
                                    </div>
                                    <div id='description' style="display: block;">
                                        <div>update:
                                        </div>


                                    </div>
                                    <table class="table table-striped table-bordered table-hover" style="width: 99%">
                                        <thead>
                                        <tr>
                                            <th >name<br>remark </th>
                                            <th >picture1</th>
                                            <th >status<br>shunxu </th>
                                            <th >price<br>priceUnit  </th>
                                            <th >createtime<br>updatetime </th>
                                            <th >weShopid<br>weShop </th>
                                            <th >weCate<br>weCateid<br>weCateName<br> </th>
                                            <th >userid<br> user</th>
                                            <th >操作</th>

                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="obj" items="${list }">
                                            <tr>
                                                <td> ${obj.name }<br> ${obj.remark } </td>
                                                <td>
                                                <c:if test="${!empty obj.picture1 }">
                                                    <img src="${sysPath}/download?filename=${obj.picture1}" width="100px" height="100px">
                                                </c:if>
                                                </td>
                                                <td > ${obj.status }<br>${obj.shunxu } </td>
                                                <td > ${obj.price }<br>${obj.priceUnit } </td>
                                                <td > ${obj.createtime }<br>${obj.updatetime } </td>
                                                <td > ${obj.weShopid }<br> ${obj.weShop.name } </td>
                                                <td > ${obj.weCateid }<br> ${obj.weCate.name } </td>
                                                <td >${obj.userid}<br> ${obj.user.name } </td>
                                                <td>
                                                    <a href="${sysPath}//weItem/mergeUI?id=${obj.id }">编辑</a>
                                                    <br><br>

                                                    <a href="${sysPath}//weItem/delete?id=${obj.id }">删除</a>

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
        $("#mmenu_weItem").addClass("active-menu");

    });


</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>