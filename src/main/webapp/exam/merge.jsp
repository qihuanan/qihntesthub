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
                                    <form id="form_id" role="form" action="${sysPath}/exam/merge" method="post">
                                        <input type="hidden" name="id" value="${exam.id}" />
                                        <input type="hidden" name="pointid" value="${exam.pointid}" />
                                        <div class="form-group">
                                            <label>所属签到点名称 </label>
                                            <input class="form-control" name="pointname" type="text"  value="${exam.pointname}" readonly />
                                        </div>
                                        <div class="form-group">
                                            <label>题目名称 </label>
                                            <input class="form-control" name="name" type="text"  value="${exam.name}"/>
                                        </div>
                                        <div class="form-group">
                                            <label>题目描述 </label>
                                            <textarea class="form-control" name="description">${exam.description}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>上传题目图片 </label>
                                            <input id="objpicture" name="picture1" type="hidden" value="${exam.picture1}"/>
                                            <input class="form-control" id="file_id" name="filepath" type="file" accept="image/*"/>
                                            <a class="btn btn-default" onclick="upfile();" href="javascript:void(0);">upfile</a>
                                            <div id="upfileimgdiv_id" style="display: none;">
                                                <img id="upfileimg_id" src="" width="50px" height="50px">
                                            </div>
                                            <c:if test="${!empty exam.picture1 }">
                                                <img src="${sysPath}/download?filename=${exam.picture1}" width="100px" height="100px">
                                            </c:if>
                                        </div>
                                        <div class="form-group">
                                            <label>类型-(1: 文字答题  2: 上传图片) </label>
                                            <textarea class="form-control" name="cate">${exam.cate}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>答案-(多文字使用英文分号分割 ; ) </label>
                                            <textarea class="form-control" name="answer">${exam.answer}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>奖励-文字描述 </label>
                                            <textarea class="form-control" name="prize">${exam.prize}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>奖励-拼图碎片 </label>
                                            <input id="objpicture2" name="prizeimg" type="hidden" value="${exam.prizeimg}"/>
                                            <input class="form-control" id="file_id2" name="filepath" type="file" accept="image/*"/>
                                            <a class="btn btn-default" onclick="upfile2();" href="javascript:void(0);">upfile2</a>
                                            <div id="upfileimgdiv_id2" style="display: none;">
                                                <img id="upfileimg_id2" src="" width="50px" height="50px">
                                            </div>
                                            <c:if test="${!empty exam.prizeimg }">
                                                <img src="${sysPath}/download?filename=${exam.prizeimg}" width="100px" height="100px">
                                            </c:if>
                                        </div>

                                        <div class="form-group">
                                            <label>答题机会次数（数字1-10，选择题选1 预留，其他10） </label>
                                            <textarea class="form-control" name="chance">${exam.chance}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>答题正确提示语(正确，恭喜您获得以下藏宝图碎片) </label>
                                            <textarea class="form-control" name="success">${exam.success}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>答题错误提示语(错误，很遗憾，再想想其他答案吧！)  </label>
                                            <textarea class="form-control" name="fail">${exam.fail}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>答错时是否显示答案（1：显示 0：不显示） </label>
                                            <textarea class="form-control" name="showanswer">${exam.showanswer}</textarea>
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
        $("#mmenu_exam").addClass("active-menu");

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