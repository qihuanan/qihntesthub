<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
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
    <SCRIPT type="application/javascript" src="../js/my.js"></SCRIPT>
<script>


</script>
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
                <!--
                <div class="col-md-12">
                    <h1 class="page-header">
                        Forms Page <small>Best form elements.</small>
                    </h1>
                </div>-->
            </div>
            <!-- /. ROW  -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!--
                        <div class="panel-heading">
                            Basic Form Elements
                        </div>
                        -->
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form id="form_id" role="form" action="${sysPath}/editDone" method="post" >

                                        id:<input  name="id" type="text" value="${user.id}" /><br>
                                        Name:<input id="name" name="name" type="text" value="${user.name}" /><br>

                                        Name:<input name="name" type="text" value="${user.name}" /><br>
                                        price:<input name="price" type="text" value="${user.price}" /><br>
                                        Name:<input name="price2" type="text" value="${user.price2}" /><br>
                                        Name:<input name="price3" type="text" value="${user.price3}" /><br>
                                        Name:<input name="oneflag" type="text" value="${user.oneflag}" /><br>
                                        Name:<input name="zhekou" type="text" value="${user.zhekou}" /><br>
                                        Name:<input name="youhui" type="text" value="${user.youhui}" /><br>
                                        Name:<input name="updatetime" type="text" value="${user.updatetime}" /><br>
                                        couponprom:<input name="couponprom" type="text" value="${user.couponprom}" /><br>
                                        onsale:<input name="onsale" type="text" value="${user.onsale}" /><br>
                                        Name:<input name="updatetime" type="text" value="${user.updatetime}" /><br>


                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->

                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
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
    $("#mmenu_goods3").addClass("active-menu");

});

function getinfoConvert() {
    document.forms[0].action = "${sysPath}/goods/mergeUIRecpoint";
    document.forms[0].submit();
}

function upfile() {
    var file = document.getElementById("file_id").files[0];
    var form = new FormData(document.getElementById("form_id"));
    $.ajax({
        url: '/upload',
        type: "POST",
        async: false,
        cache: false,
        processData: false,// 告诉jQuery不要去处理发送的数据
        contentType: false,// 告诉jQuery不要去设置Content-Type请求头
        data: form,
        success: function(data){
            var obj = eval('(' + data + ')');
            $('#upfileimg_id').attr("src","/download?filename="+obj.filepath);
            $('#upfileimgdiv_id').show();
            $('#file_id').val(obj.filepath);
        },
        error: function(err) {
            alert(err);
        }
    });
}

</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>