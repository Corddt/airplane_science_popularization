<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/4
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
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
            <% if (session.getAttribute("message") != null) { %>
            alert("<%= session.getAttribute("message") %>");
            <% session.removeAttribute("message"); %>
            <% } %>
        });
    </script>
    <script>
        $(document).ready(function() {
            var totalRecords = ${pageResult.total}; // 总记录数
            var pageSize = ${pageSize}; // 每页显示的记录数
            var totalPages = Math.ceil(totalRecords / pageSize); // 总页数，向上取整
            var currentPage = ${pageNum}; // 当前页码
            var baseUrl = "${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing?pageNum="; // 基础URL

            // 构建“上一页”按钮
            var prevPage = currentPage - 1;
            if (prevPage < 1) {
                $('#pagination').append('<span class="btn btn-sm btn-default disabled">上一页</span>');
            } else {
                $('#pagination').append('<a href="' + baseUrl + prevPage + '" class="btn btn-sm btn-default">上一页</a>');
            }

            // 构建分页按钮
            for (var i = 1; i <= totalPages; i++) {
                var btn = $('<a>').text(i).attr('href', baseUrl + i).addClass('btn btn-sm');
                if (i === currentPage) {
                    btn.addClass('btn-primary'); // 当前页高亮
                } else {
                    btn.addClass('btn-default');
                }
                $('#pagination').append(btn);
            }

            // 构建“下一页”按钮
            var nextPage = currentPage + 1;
            if (nextPage > totalPages) {
                $('#pagination').append('<span class="btn btn-sm btn-default disabled">下一页</span>');
            } else {
                $('#pagination').append('<a href="' + baseUrl + nextPage + '" class="btn btn-sm btn-default">下一页</a>');
            }
        });
    </script>





</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="box-header with-border">
    <h3 class="box-title">飞机类型管理</h3>
</div>
<div class="box-body">
    <!-- 新增按钮 -->
    <c:if test="${USER_SESSION.role =='ADMIN'}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <a href="${pageContext.request.contextPath}/admin/add_feijileixing.jsp" class="btn btn-default" title="新建">新增</a>
                </div>
            </div>
        </div>
    </c:if>
    <!-- 工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/feiji/searchFeiJiLeiXing" method="post">
                类型名称：<input name="leixingmingcheng" value="${search.leixingmingcheng}">&nbsp;&nbsp;&nbsp;
                <input class="btn btn-default" type="submit" value="查询">
            </form>
        </div>
    </div>

    <!-- 数据列表 -->
    <div class="table-box">
        <!-- 数据表格 -->
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
        <!-- 数据表格 /-->
        <!-- 分页插件 -->
        <div id="pagination" class="pagination"></div>
    </div>
</div>
</body>
</html>
