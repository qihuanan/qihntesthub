<%@ page language="java" pageEncoding="utf-8"%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${pageInfo.pageCount >1}">
    页码：${pageInfo.curPage}/${pageInfo.pageCount}页 每页显示：
    <input type="text" name="pageSize" id="textPageSize"
           value="<c:if test='${empty pageInfo.pageSize}'>10</c:if><c:if test='${!empty pageInfo.pageSize}'>${pageInfo.pageSize}</c:if>"
           style="height: 15px;width: 30px;"
           onkeyup="if(isNaN(this.value)){this.value='';}" />
    <input type="hidden" id="oldPageSize"
           value="<c:if test='${empty pageInfo.pageSize}'>10</c:if><c:if test='${!empty pageInfo.pageSize}'>${pageInfo.pageSize}</c:if>" />
    条 总记录数：${pageInfo.totalCount}条 分页：
    <a href="javascript:gotoPage(1)">[首页]</a>
    <c:if test="${pageInfo.curPage gt 1}">
        <a href="javascript:gotoPage(${pageInfo.curPage - 1})">[上一页]</a>
    </c:if>
    <c:if test="${pageInfo.curPage lt pageInfo.pageCount}">
        <a href="javascript:gotoPage(${pageInfo.curPage + 1})">[下一页]</a>
    </c:if>
    <a href="javascript:gotoPage(${pageInfo.pageCount})">[尾页]</a>
    转到：
    <input type="text" id="txtPageNum" style="height: 15px;width: 30px;" onkeyup="if(isNaN(this.value)){this.value='';}" />
    <a href="javascript: gotoPage(document.getElementById('txtPageNum').value)" style="font-size: 14px;">GO</a>
    <input type="hidden" id="curPage" name="curPage" value="${pageInfo.curPage}" />
    <script type="text/javascript">
        function gotoPage(pageNum){
            if(isNaN(pageNum)){alert('请输入数字！');document.getElementById('txtPageNum').focus();return false;}
            if( pageNum < 1 || pageNum > ${pageInfo.pageCount} ){document.getElementById('txtPageNum').value=${pageInfo.pageCount};pageNum=${pageInfo.pageCount}; }
            if($("#textPageSize").val()==$("#oldPageSize").val()){
                $("#curPage").val(pageNum);
            }else{
                $("#curPage").val("1");
            }
            document.forms[0].submit();
        }
    </script>
</c:if>
