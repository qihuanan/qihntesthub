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
                                    <form id="form_id" role="form" action="${sysPath}/line/merge" method="post">
                                        <input type="hidden" name="id" value="${line.id}" />
                                        <div class="form-group">
                                            <label>线路名称 </label>
                                            <input class="form-control" name="name" type="text"  value="${line.name}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>线路描述 </label>
                                            <textarea class="form-control" name="description">${line.description}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>经度 </label>
                                            <textarea class="form-control" name="jingdu">${line.jingdu}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>纬度 </label>
                                            <textarea class="form-control" name="weidu">${line.weidu}</textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>长度（千米） </label>
                                            <textarea class="form-control" name="changdu">${line.changdu}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>签到点个数 </label>
                                            <textarea class="form-control" name="dianshu">${line.dianshu}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>积分 </label>
                                            <textarea class="form-control" name="jifen">${line.jifen}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>验证距离（米） </label>
                                            <textarea class="form-control" name="qiandaojuli">${line.qiandaojuli}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>地图缩放（1-30的数） </label>
                                            <textarea class="form-control" name="ditudaxiao">${line.ditudaxiao}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>顺序 </label>
                                            <textarea class="form-control" name="shunxu">${line.shunxu}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>点击旗帜后缩放（1-30的数） </label>
                                            <textarea class="form-control" name="qizhidaxiao">${line.qizhidaxiao}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>设定时间（秒） </label>
                                            <textarea class="form-control" name="shijian">${line.shijian}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>是否显示（1 显示  0 不显示） </label>
                                            <textarea class="form-control" name="onshow">${line.onshow}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>进入线路的密码 </label>
                                            <textarea class="form-control" name="mima">${line.mima}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>签到点顺序打卡限制（1：强制顺序 0： 不强制） </label>
                                            <textarea class="form-control" name="orderflag">${line.orderflag}</textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>上传封面图片 </label>
                                            <input id="objpicture" name="picture1" type="hidden" value="${line.picture1}"/>
                                            <input class="form-control" id="file_id" name="filepath" type="file" accept="image/*"/>
                                            <a class="btn btn-default" onclick="upfile();" href="javascript:void(0);">upfile</a>
                                            <div id="upfileimgdiv_id" style="display: none;">
                                                <img id="upfileimg_id" src="" width="50px" height="50px">
                                            </div>
                                            <c:if test="${!empty line.picture1 }">
                                                <img src="${sysPath}/download?filename=${line.picture1}" width="100px" height="100px">
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>上传详情图片 </label>
                                            <input id="objpicture2" name="picture2" type="hidden" value="${line.picture2}"/>
                                            <input class="form-control" id="file_id2" name="filepath" type="file" accept="image/*"/>
                                            <a class="btn btn-default" onclick="upfile2();" href="javascript:void(0);">upfile2</a>
                                            <div id="upfileimgdiv_id2" style="display: none;">
                                                <img id="upfileimg_id2" src="" width="50px" height="50px">
                                            </div>
                                            <c:if test="${!empty line.picture2 }">
                                                <img src="${sysPath}/download?filename=${line.picture2}" width="100px" height="100px">
                                            </c:if>
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