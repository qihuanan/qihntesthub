<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>User List</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <link href="../assets/css/custom-styles.css" rel="stylesheet" />
    <link href="../assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<body>


<div class="panel panel-default">
    <div class="panel-heading">
        Kitchen Sink
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table class="table table-striped table-bordered table-hover">
                <thead>
                <tr>
                    <th>#</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Username</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>1</td>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>Jacob</td>
                    <td>Thornton</td>
                    <td>@fat</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>Larry</td>
                    <td>the Bird</td>
                    <td>@twitter</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>



<a href="/goods/mergeUI">Add</a>
<table style="border: 1px solid green">
    <tr>
        <td>ID</td>
        <td>skuid</td>
        <td>skupicture</td>
        <td>Name</td>
        <td>skulink</td>
        <td>price</td>
        <td>pricel</td>
        <td>upindex</td>
        <td>recpoint</td>
        <td>domain</td>
        <td>remark</td>
        <td>brand</td>
        <td>cate</td>

    </tr>
    <c:forEach var="obj" items="${list }" >
        <tr>
            <td>${obj.id }</td>
            <td>${obj.skuid }</td>
            <td>${obj.skupicture }</td>
            <td>${obj.name }</td>
            <td>${obj.skulink }</td>
            <td>${obj.price }</td>
            <td>${obj.pricel }</td>
            <td>${obj.upindex }</td>
            <td>${obj.recpoint }</td>
            <td>${obj.domain }</td>
            <td>${obj.remark }</td>
            <td>${obj.brand }</td>
            <td>${obj.cate }</td>
            <td>${obj.updatetime }</td>
            <td><a href="/goods/mergeUI?id=${obj.id }">编辑</a></td>
            <td><a href="/goods/delete?id=${obj.id }">删除</a></td>
        </tr>
    </c:forEach>
</table>


</body>



</html>