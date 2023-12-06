<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>飞机类型管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/feiji.js"></script>

    <script>
        $(document).ready(function() {
            // 消息弹窗
            <% if (session.getAttribute("message") != null) { %>
            alert("<%= session.getAttribute("message") %>");
            <% session.removeAttribute("message"); %>
            <% } %>
    </script>
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="box-header with-border">
    <h3 class="box-title">飞机类型管理</h3>
</div>
<div class="box-body">
    <c:if test="${USER_SESSION.role =='ADMIN'}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <a href="${pageContext.request.contextPath}/admin/add_feijileixing.jsp" class="btn btn-default" title="新建">新增</a>
                </div>
            </div>
        </div>
    </c:if>
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/feiji/searchFeiJiLeiXing" method="post">
                类型名称：<input name="leixingmingcheng" value="${search.leixingmingcheng}">&nbsp;&nbsp;&nbsp;
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>
    <div class="table-box">
        <table id="dataList" class="table table-bordered table-striped table-hover dataTable text-center">
            <thead>
            <tr>
                <th class="sorting">类型ID</th>
                <th class="sorting">类型名称</th>
                <th class="sorting">描述</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageResult.rows}" var="FeiJiLeiXing">
                <tr>
                    <td>${FeiJiLeiXing.leixingid}</td>
                    <td>${FeiJiLeiXing.leixingmingcheng}</td>
                    <td>${FeiJiLeiXing.miaoshu}</td>
                    <td class="text-center">
                        <a href="${pageContext.request.contextPath}/feiji/editFeiJiLeiXingPage?leixingid=${FeiJiLeiXing.leixingid}" class="btn bg-olive btn-xs">编辑</a>
                        <button type="button" class="btn btn-danger btn-xs" onclick="deleteType(${FeiJiLeiXing.leixingid})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div id="pagination" class="pagination">
            <c:choose>
                <c:when test="${pageNum > 1}">
                    <!-- 上一页链接 -->
                    <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing?pageNum=${pageNum - 1}" class="btn btn-sm btn-default">上一页</a>
                </c:when>
                <c:otherwise>
                    <!-- 上一页禁用 -->
                    <span class="btn btn-sm btn-default disabled">上一页</span>
                </c:otherwise>
            </c:choose>

            <!-- 动态生成页面链接 -->
            <c:forEach begin="1" end="${totalPages}" var="i">
                <c:choose>
                    <c:when test="${i == pageNum}">
                        <span class="btn btn-sm btn-primary">${i}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing?pageNum=${i}" class="btn btn-sm btn-default">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${pageNum < totalPages}">
                    <!-- 下一页链接 -->
                    <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing?pageNum=${pageNum + 1}" class="btn btn-sm btn-default">下一页</a>
                </c:when>
                <c:otherwise>
                    <!-- 下一页禁用 -->
                    <span class="btn btn-sm btn-default disabled">下一页</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    </div>
</div>
</body>
</html>
