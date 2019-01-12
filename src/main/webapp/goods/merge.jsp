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
    function getinfo(type) {
        var orilink = $('#orilink').val();
        var skuid = orilink.match(/\d+/gi);
        skuid = skuid.toString().split(",")[0];
        goodsdetail(skuid,type);
    }

    function goodsdetail(skuid,type) {
        $.ajax({type:"get",datatype:"html",url:"/goods/jttGoodDetail.htm?skuid="+skuid+"&type="+type,
            data:{'qrcode.ids':1,'qrcode.remark':1},cache:false,
            success:function(result){
                if(result!= ""){
                    window.location.href='/goods/mergeUI?id='+result;
                }
            }
        });
    }

    function historyprice(id) {
        var surl = $('#orilink').val();
        $.ajax({
            url: "/goods/hisPrice",
            type: 'get',
            dataType: 'text',
            data: {
                id:id,
                url: escape(surl),
                token:d.encrypt(surl,2,true)

            },
            success: function (json) {
                $('#price1').val(json);
            }
        });
    }

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
                                    <form id="form_id" role="form" action="${sysPath}/goods/merge" method="post" >
                                        <div class="form-group">
                                            <label>skulink </label>
                                            <input class="form-control" name="skulink" type="text" value="${goods.skulink}" width="50px" />
                                        </div>
                                        <div class="form-group">
                                            <label>upindex </label>
                                            <input id="upindex_id" class="form-control" name="upindex" type="text" value="${goods.upindex}" width="50px" />
                                            <a class="btn btn-default" onclick="$('#upindex_id').val(1);" href="#" >加1</a>&nbsp;
                                            <a class="btn btn-default" onclick="$('#upindex_id').val(2);" href="#" >加2</a>&nbsp;
                                            <a class="btn btn-default" onclick="$('#upindex_id').val(3);" href="#" >加3</a>&nbsp;
                                            <a class="btn btn-default" onclick="$('#upindex_id').val('');" href="#" >清空</a>&nbsp;
                                        </div>
                                        <div class="form-group">
                                            <label>recpoint </label>
                                            <textarea name="recpoint" rows="8" cols="30" contenteditable="true">${goods.recpoint}</textarea>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <a class="btn btn-default" onclick="getinfoConvert();" href="#" >convert</a>&nbsp;
                                                <button type="submit" class="btn btn-default">Submit</button>

                                        </div>
                                        <div class="form-group">
                                            <label>name </label>
                                            <textarea name="name" rows="4" cols="30" contenteditable="true">${goods.name}</textarea>
                                        </div>

                                        <div class="form-group">
                                            <label>orilink: ${goods.id}</label>
                                            <input class="form-control" name="id" type="hidden" value="${goods.id}" readonly />
                                            <input class="form-control" id="orilink" name="materialUrl" type="text" value="${goods.materialUrl}" />
                                            <br>
                                            <a class="btn btn-default" onclick="getinfo(1);" href="#" >get</a>
                                            <c:if test="${!empty goods.skupicture}">
                                                <button type="submit" class="btn btn-default">Submit Button</button>
                                            </c:if>
                                            <c:if test="${! empty goods.id}">
                                                <a class="btn btn-default" onclick="historyprice(${goods.id});" href="#" >hisprice</a>
                                            </c:if>
                                            <a class="btn btn-default" onclick="getinfo(2);" href="#" >update</a>
                                        </div>

                                        <div class="form-group">
                                            <label>price </label>
                                            <input class="form-control" name="price" type="text" value="${goods.price}" readonly />
                                        </div>




                                        <div class="form-group">
                                            <label>skuid</label>
                                            <input class="form-control" name="skuid" type="text" value="${goods.skuid}" />
                                            <c:if test="${! empty goods.id}">
                                                <input class="form-control" name="huashu" type="text" value="${huashu}" />
                                            </c:if>
                                        </div>
                                        <!--
                                        <div class="form-group">
                                            <label>file </label>
                                            <input class="form-control" id="file_id" name="filepath" type="file"  accept="image/*" capture="camera" />
                                            <a class="btn btn-default" onclick="upfile();" href="javascript:void(0);" >upfile</a>
                                            <div id="upfileimgdiv_id" style="display: none;"><img id="upfileimg_id" src="" width="50px" height="50px"> </div>
                                        </div>
                                        -->
                                        <div class="form-group">
                                            <label>pricel </label>
                                            <input class="form-control" id="price1" name="pricel" type="text" value="${goods.pricel}" />
                                            <c:if test="${! empty goods.id && goods.pricel == goods.price }">
                                                <a class="btn btn-default" onclick="historyprice(${goods.id});" href="#" >hisprice</a>
                                            </c:if>
                                        </div>



                                        <div class="form-group">
                                            <label>skupicture </label>
                                            <input class="form-control" name="skupicture" type="text" value="${goods.skupicture}" />
                                        </div>



                                        <div class="form-group">
                                            <label>domain </label>
                                            <input class="form-control" name="domain" type="text" value="${goods.domain}" />
                                        </div>
                                        <div class="form-group">
                                            <label>remark </label>
                                            <input class="form-control" name="remark" type="text" value="${goods.remark}" />
                                        </div>
                                        <div class="form-group">
                                            <label>brand </label>
                                            <input class="form-control" name="brand" type="text" value="${goods.brand}" />
                                        </div>
                                        <div class="form-group">
                                            <label>cate </label>
                                            <input class="form-control" name="cate" type="text" value="${goods.cate}" />
                                        </div>
                                        <div class="form-group">
                                            <label>updatetime </label>
                                            <input class="form-control" name="updatetime" type="text" value="${goods.updatetime}" readonly />
                                        </div>

                                        <div class="form-group">
                                            <label>linktype </label>
                                            <input class="form-control" name="linktype" type="text" value="${goods.linktype}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>endtime </label>
                                            <input class="form-control" name="endtime" type="text" value="${goods.endtime}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>ratio </label>
                                            <input class="form-control" name="ratio" type="text" value="${goods.ratio}"  />
                                        </div>

                                        <div class="form-group">
                                            <label>cid </label>
                                            <input class="form-control" name="cid" type="text" value="${goods.cid}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>cid2 </label>
                                            <input class="form-control" name="cid2" type="text" value="${goods.cid2}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>cid3 </label>
                                            <input class="form-control" name="cid3" type="text" value="${goods.cid3}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>cidName </label>
                                            <input class="form-control" name="cidName" type="text" value="${goods.cidName}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>cid2Name </label>
                                            <input class="form-control" name="cid2Name" type="text" value="${goods.cid2Name}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>cid3Name </label>
                                            <input class="form-control" name="cid3Name" type="text" value="${goods.cid3Name}"  />
                                        </div>
                                        <div class="form-group">
                                            <label>inOrderCount </label>
                                            <input class="form-control" name="inOrderCount" type="text" value="${goods.inOrderCount}"  />
                                        </div>

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
    $("#mmenu_goods2").addClass("active-menu");

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