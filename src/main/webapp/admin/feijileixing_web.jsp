<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>飞机类型管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/feijileixing_web.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/feiji.js"></script>
    <script>
        $(document).ready(function() {
            <% if (session.getAttribute("message") != null) { %>
            alert("<%= session.getAttribute("message") %>");
            <% session.removeAttribute("message"); %>
            <% } %>
        });
    </script>
</head>
<body>
<div class="container">
    <h3 class="title">飞机类型管理</h3>
    <div class="operations">
        <c:if test="${USER_SESSION.role =='ADMIN'}">
            <div class="form-group form-inline">
                <a href="${pageContext.request.contextPath}/admin/add_feijileixing.jsp" class="btn btn-default" title="新建">新增</a>
            </div>
        </c:if>
        <div class="search-form">
            <form action="${pageContext.request.contextPath}/feiji/searchFeiJiLeiXing" method="post">
                类型名称：<input name="leixingmingcheng" value="${search.leixingmingcheng}" class="input-field">&nbsp;
                <input class="btn btn-default" type="submit" value="查询">
                <a href="${pageContext.request.contextPath}/admin/main.jsp" class="btn btn-default">返回主页</a>
            </form>
        </div>
    </div>
    <div class="table-container">
        <table id="dataList" class="table">
            <thead>
            <tr>
                <th>类型ID</th>
                <th>类型名称</th>
                <th>描述</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageResult.rows}" var="FeiJiLeiXing">
                <tr>
                    <td>${FeiJiLeiXing.leixingid}</td>
                    <td>${FeiJiLeiXing.leixingmingcheng}</td>
                    <td>${FeiJiLeiXing.miaoshu}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/feiji/editFeiJiLeiXingPage?leixingid=${FeiJiLeiXing.leixingid}" class="btn btn-edit">编辑</a>
                        <button type="button" onclick="deleteType(${FeiJiLeiXing.leixingid})" class="btn btn-delete">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="pagination">
            <c:choose>
                <c:when test="${pageNum > 1}">
                    <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing?pageNum=${pageNum - 1}" class="btn btn-previous">上一页</a>
                </c:when>
                <c:otherwise>
                    <span class="btn btn-disabled">上一页</span>
                </c:otherwise>
            </c:choose>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:choose>
                    <c:when test="${i == pageNum}">
                        <span class="btn btn-current">${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing?pageNum=${i}" class="btn btn-page">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:choose>
                <c:when test="${pageNum < totalPages}">
                    <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing?pageNum=${pageNum + 1}" class="btn btn-next">下一页</a>
                </c:when>
                <c:otherwise>
                    <span class="btn btn-disabled">下一页</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<!-- JavaScript 代码 -->
</body>
</html>
