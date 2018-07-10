<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User List</title>
    <script src="https://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
    <SCRIPT type="application/javascript" src="../js/my.js"></SCRIPT>
</head>
<body>
<a href="edit">Add</a>
<table>
    <tr>
        <td>ID</td>
        <td>Name</td>
        <td>NiceName</td>
        <td>Age</td>
    </tr>
    <c:forEach var="user" items="${userList }" >
        <tr>
            <td>${user.id }</td>
            <td>${user.name }</td>
            <td>${user.nice_name }</td>
            <td>${user.age }</td>
            <td><a href="show/${user.id }">详细</a></td>
            <td><a href="edit?id=${user.id }">编辑</a></td>
            <td><a href="del/${user.id }">删除</a></td>
        </tr>
    </c:forEach>
</table>
<div style="padding: 20px;">url:<input type="text" id="urlid" value="https://item.jd.com/3734874.html" /><button onclick="historyouhui();">查询</button>  </div>


<div id="div1" style="margin: 30px;color: green;font-size: 16px;">5555555555</div>

<div id="div2" style="margin: 30px;color: green;font-size: 14px;">666666666666666666</div>

</body>

<script type="text/javascript">
    $(document).ready(function () {
        //historyouhui('http://item.jd.com/3133859.html',6);
    });

    function historyprice(surl) {
        $.ajax({
            url: "/hp",
            type: 'get',
            dataType: 'text',
            data: {
                url: escape(surl),
                token:d.encrypt(surl,2,true)
            },
            success: function (json) {
                $("#div1").html(json);
            }
        });
    }

    function historyouhui() {
        var surl = $('#urlid').val();

        historyprice(surl);

        itop = 6;
        $.ajax({
            url: "https://bijiatool-v2.manmanbuy.com/ChromeWidgetServices/WidgetServices.ashx?jsoncallback=",
            type: 'get',
            dataType: 'jsonp',
            data: {
                methodName: 'getZhekou',
                p_url: escape(surl),
                ipagesize: itop,
                ipage: 1
            },

            success: function (json) {

                if (json.ok == 1 && json.icount > 0) {

                    var htmlli = "";
                    for (var j = 0; j < json.zklist.length; j++) {
                        if (json.zklist[j].infoid == 60198) {
                            htmlli += "<li><a href=\"javascript:;\" onclick='nodetail();' class=\"go\"></a>";
                        }
                        else {
                            var detailUrl = "javascript:;";
                            switch (json.zklist[j].infotype) {
                                case "1": detailUrl = "//cu.manmanbuy.com/discuxiao_" + json.zklist[j].infoid + ".aspx"; break; //省钱控
                                case "2": detailUrl = "//zhekou.manmanbuy.com/Sharedetailed_" + json.zklist[j].infoid + ".aspx"; break; //国内折扣
                                case "3": detailUrl = "//cu.manmanbuy.com/discuxiao_" + json.zklist[j].infoid + ".aspx"; break; //海淘
                                case "4": detailUrl = "//baicai.manmanbuy.com/dis.aspx?id=" + json.zklist[j].infoid; break; //白菜价
                            }
                            htmlli += "<li><a href=\"" + detailUrl + "\" class=\"go\" target=\"_blank\" ></a>";
                        }
                        htmlli += " <i></i>";
                        htmlli += "<div class=\"t\">" + json.zklist[j].spname + "</div>";
                        htmlli += " <div class=\"s\">" + json.zklist[j].spprice + "</div>";
                        htmlli += "<div class=\"d\">" + json.zklist[j].dt.replace("/Date(", "").replace("-0000)/", "") + "</div>";
                        htmlli += " </li>";
                    }

                    if ($(".trend_page").html() != "") {
                        $("#div2").html(htmlli);
                    }else {
                        var html = " <div class=\"culist\">";
                        html += "<div class=\"hd\">该商品的历史优惠活动</div>";
                        html += " <div class=\"bd\">";
                        html += "  <ul>";
                        html += htmlli;
                        html += "</ul>";
                        if (json.icount > itop) {
                            html += "<p class='more'><a style='font-size: 16px; padding-left: 40px;color: #ff6700; ' href='javascript:void(0)' onclick=\"historyouhui('" + surl + "'," + itop + ")\">更多优惠</a></p>"
                        }
                        html += "</div></div>";
                        $("#div2").html(html);
                    }

                }





            }
        });

    }


</script>

</html>