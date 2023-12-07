<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>飞机详情管理</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/feijixiangqing_web.css">
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
    <h3 class="box-title">飞机详情管理</h3>
    <div class="toolbar">
        <c:if test="${USER_SESSION.role =='ADMIN'}">
            <a href="${pageContext.request.contextPath}/admin/add_feijixiangqing.jsp" class="btn btn-primary btn-custom-padding">新增</a>
        </c:if>
        <form action="${pageContext.request.contextPath}/feiji/searchFeiJiXiangQing" method="post" class="search-form">
            名称：<input name="mingcheng" value="${search.mingcheng}" class="input-field">
            <input type="submit" value="查询" class="btn btn-secondary">
            <a href="${pageContext.request.contextPath}/admin/main.jsp" class="btn btn-secondary">返回主页</a>
        </form>
    </div>
    <div class="table-box">
        <table id="dataList" class="table">
            <thead>
            <tr>
                <th>详情ID</th>
                <th>类型ID</th>
                <th>名称</th>
                <th class="jianjie">简介</th>
                <th>制造商</th>
                <th>使用年限</th>
                <th class="caozuo">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageResult.rows}" var="FeiJiXiangQing">
                <tr>
                    <td>${FeiJiXiangQing.xiangqingid}</td>
                    <td>${FeiJiXiangQing.leixingid}</td>
                    <td>${FeiJiXiangQing.mingcheng}</td>
                    <td>${FeiJiXiangQing.jianjie}</td>
                    <td>${FeiJiXiangQing.zhizaoshang}</td>
                    <td>${FeiJiXiangQing.shiyongnianxian}</td>
                    <td class="text-center">
                        <a href="${pageContext.request.contextPath}/feiji/editFeiJiXiangQingPage?id=${FeiJiXiangQing.xiangqingid}" class="btn bg-olive btn-xs">编辑</a>
                        <button type="button" onclick="deleteDetail(${FeiJiXiangQing.xiangqingid})" class="btn btn-danger btn-xs">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 分页插件 -->
        <div id="pagination" class="pagination">
            <c:choose>
                <c:when test="${pageNum > 1}">
                    <!-- 上一页链接 -->
                    <a href="${pageContext.request.contextPath}/feiji/selectFeiJiXiangQing?pageNum=${pageNum - 1}" class="btn btn-sm btn-default">上一页</a>
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
                        <a href="${pageContext.request.contextPath}/feiji/selectFeiJiXiangQing?pageNum=${i}" class="btn btn-sm btn-default">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>

            <c:choose>
                <c:when test="${pageNum < totalPages}">
                    <!-- 下一页链接 -->
                    <a href="${pageContext.request.contextPath}/feiji/selectFeiJiXiangQing?pageNum=${pageNum + 1}" class="btn btn-sm btn-default">下一页</a>
                </c:when>
                <c:otherwise>
                    <!-- 下一页禁用 -->
                    <span class="btn btn-sm btn-default disabled">下一页</span>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
</body>
</html>