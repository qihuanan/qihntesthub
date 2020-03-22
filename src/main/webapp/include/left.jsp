<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
                <a id="mmenu_line" href="${sysPath}/line/list"><i class="fa fa-desktop"></i> 线路列表</a>
            </li>
            <li>
                <a id="mmenu_user" href="${sysPath}/user/list"><i class="fa fa-desktop"></i> 用户列表</a>
            </li>
            <li>
                <a id="mmenu_pointUserinfo" href="${sysPath}/pointUserinfo/list"><i class="fa fa-desktop"></i> 签到列表</a>
            </li>

            <!--
            <li>
                <a id="mmenu_goods1" href="${sysPath}/goods/list"><i class="fa fa-dashboard"></i> goods列表</a>
            </li>
            <li>
                <a id="mmenu_goods2" href="${sysPath}/goods/mergeUI"><i class="fa fa-desktop"></i> goods添加</a>
            </li>
            <li>
                <a id="mmenu_goods4" href="${sysPath}//1"><i class="fa fa-desktop"></i> web1列表</a>
            </li>
            -->

        </ul>

    </div>

</nav>
