<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>User List</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/zclip/1.1.2/jquery.zclip.min.js"></script>


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
                                <a id='copy' href="#">复制</a><br><br>
                                <a href="/goods/mergeUI">添加添加</a><br><br>
                                <a href="/goods/upindex">upindex</a><br><br>
                                <a href="/goods/resetindex">resetindex</a><br><br>
                            </div>
                            <form action="/goods/list" method="post">
                                <div class="table-responsive" >
                                    <div class="row" style="width: 99%">
                                        <div class="col-sm-6" style="margin-bottom: 5px;">&nbsp;&nbsp;
                                            S: <input type="text" name="name" value="${goods.name}" >
                                            <input type="submit" value="查询"></input>${syscount}
                                        </div>
                                    </div>
                                    <div id='description' style="display: block;">
                                        <pre>${linestr}</pre>
                                    </div>
                                    <table class="table table-striped table-bordered table-hover" style="width: 99%">
                                        <thead>
                                        <tr>
                                            <th style="white-space:pre-line">recpoint</th>
                                            <th style="white-space:pre-line">操作</th>

                                        </tr>
                                        </thead>
                                        <tbody>

                                        <c:forEach var="obj" items="${list }" >
                                            <tr>

                                                <td style="white-space:pre-line;height: 100%;min-height: 50px; max-height: 2000px;line-height: 1.5;overflow: auto;">
                                                        ${obj.recpoint }
                                                </td>
                                                <td>
                                                    <br><br>
                                                    <a href="/goods/mergeUI?id=${obj.id }">编辑</a>
                                                    <br>
                                                    <br>
                                                    <br>
                                                    <a href="/goods/delete?id=${obj.id }">删除</a><br>
                                                        ${obj.id }
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
        $('a#copy').zclip({
            path:'http://www.steamdev.com/zclip/js/ZeroClipboard.swf',
            copy:$('div#description').html()
        });

    });
</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>