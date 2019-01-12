<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User List</title>
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
                        <div class="panel-heading">
                            Advanced Tables &nbsp;&nbsp; ${syscount}
                        </div>
                        <div class="panel-body" >
                            <form action="/goods/list" method="post">
                                <div class="table-responsive" >
                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6" style="margin-bottom: 5px;">&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a href="/goods/mergeUI">Add</a>&nbsp;&nbsp;&nbsp;&nbsp;
                                            Search: <input type="text" name="name" value="${goods.name}" >
                                            <input type="submit" value="查询"></input>
                                        </div>
                                    </div>
                                    <div onclick="this.selected;">
                                        <pre>${linestr}</pre>
                                    </div>
                                    <table class="table table-striped table-bordered table-hover" style="width: 99%">
                                        <thead>
                                        <tr>
                                            <th>goods.skuid</th>
                                            <th>goods.skupicture</th>
                                            <th>goods.skulink</th>
                                            <th>goods.name</th>
                                            <th>goods.price</th>
                                            <th>goods.pricel</th>
                                            <th>goods.id</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="obj" items="${list }" >
                                            <tr>
                                                <td>${obj.skuid }<br><a href="/goods/mergeUI?id=${obj.id }">编辑</a> </td>
                                                <td><img src="${obj.skupicture }" width="50px" height="50px;" /> </td>
                                                <td><a target="_blank" href="${obj.skulink }">链接</a><br>

                                                    <input value="${obj.skulink }" onfocus="$(this).select();document.execCommand('Copy');" >
                                                </td>

                                                <td>${obj.name }</td>
                                                <td>${obj.price }</td>
                                                <td>${obj.pricel }</td>

                                                <td><a href="/goods/mergeUI?id=${obj.id }">编辑</a>
                                                <!-- -->
                                                <br><br><a href="/goods/delete?id=${obj.id }">删除</a>


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
        //$('#dataTables-example').dataTable();
        $("#mmenu_goods1").addClass("active-menu");

    });
</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>