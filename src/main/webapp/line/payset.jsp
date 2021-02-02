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
                                    <form id="form_id" role="form" action="${sysPath}/line/payset" method="post">
                                        <input type="hidden" name="id" value="4" />
                                        <div class="form-group">
                                            <label>支付设置 </label>
                                            <input class="form-control" name="name" type="text"  value="${line.name}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>设置内容： 7天1分钱 30天2分钱 365天3分钱
                                                eg:
                                                7天体验卡，5元,7-500-7天体验卡，5元;
                                                30天畅玩卡，10元,30-1000-30天畅玩卡，10元;
                                                90天尊享卡，20元,365-2000-90天尊享卡，20元;
                                                注意格式
                                                7天体验卡，5元,7-500  其中 7天体验卡，5元（注意卡后面是中文逗号）  是显示的radio 的内容， 后面是英文逗号
                                                7-500  中的 7  代表时间 有效期7天  500 代表支付的金额，分 是单位，500 就是5块
                                                目前只支持3个选项，可在这三个选项中任意更改里面 中文文字，数字，建议 里面的 逗号、分号不要改了
                                                后面重复的部分是微信支付时候显示的内容。
                                                3个选项，用分号分割， 一个选项里面的内容有 英文逗号分割，中间的 时间，钱和微信支付时候的文字用横岗分割

                                            </label>
                                            <textarea class="form-control" name="description">${line.description}</textarea>
                                        </div>


                                        <div class="form-group">
                                            <label>顺序 </label>
                                            <textarea class="form-control" name="shunxu">${line.shunxu}</textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>是否显示（1 显示  0 不显示） </label>
                                            <textarea class="form-control" name="onshow">${line.onshow}</textarea>
                                        </div>

                                        </div>
                                        <button type="submit" class="btn btn-default">提交</button>
                                        <button type="reset" class="btn btn-default">重置</button>
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

    function upfile() {
        $('#file_id2').css("disabled","disabled");
        var file = document.getElementById("file_id").files[0];
        var form = new FormData(document.getElementById("form_id"));
        $.ajax({
            url: '${sysPath}/upload',
            type: "POST",
            async: false,
            cache: false,
            processData: false,// 告诉jQuery不要去处理发送的数据
            contentType: false,// 告诉jQuery不要去设置Content-Type请求头
            data: form,
            success: function (data) {
                var obj = eval('(' + data + ')');
                $('#upfileimg_id').attr("src", "${sysPath}/download?filename=" + obj.filepath);
                $('#upfileimgdiv_id').show();
                $('#objpicture').val(obj.filepath);
                $('#file_id').css("disabled","");
                $('#file_id2').css("disabled","");
            },
            error: function (err) {
                alert(err);
            }
        });
    }

    function upfile2() {
        $('#file_id').css("disabled","disabled");
        var file = document.getElementById("file_id2").files[0];
        var form = new FormData(document.getElementById("form_id"));
        $.ajax({
            url: '${sysPath}/upload',
            type: "POST",
            async: false,
            cache: false,
            processData: false,// 告诉jQuery不要去处理发送的数据
            contentType: false,// 告诉jQuery不要去设置Content-Type请求头
            data: form,
            success: function (data) {
                var obj = eval('(' + data + ')');
                $('#upfileimg_id2').attr("src", "${sysPath}/download?filename=" + obj.filepath);
                $('#upfileimgdiv_id2').show();
                $('#objpicture2').val(obj.filepath);
                $('#file_id').css("disabled","");
                $('#file_id2').css("disabled","");
            },
            error: function (err) {
                alert(err);
            }
        });
    }
</script>
<script src="../assets/js/custom-scripts.js"></script>
</body>


</html>