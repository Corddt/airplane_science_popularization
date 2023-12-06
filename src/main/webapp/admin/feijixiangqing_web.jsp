<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/5
  Time: 12:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>飞机详情管理</title>
    <!-- 引入CSS和JS文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/feiji.js"></script> <!-- 添加您的飞机详情管理脚本 -->
</head>
<body class="hold-transition skin-red sidebar-mini">
<div class="box-header with-border">
    <h3 class="box-title">飞机详情管理</h3>
</div>
<div class="box-body">
    <!-- 新增按钮 -->
    <c:if test="${USER_SESSION.role =='ADMIN'}">
        <div class="pull-left">
            <div class="form-group form-inline">
                <div class="btn-group">
                    <a href="${pageContext.request.contextPath}/admin/add_feijixiangqing.jsp" class="btn btn-default" title="新建">新增</a>
                </div>
            </div>
        </div>
    </c:if>
    <!-- 工具栏 数据搜索 -->
    <div class="box-tools pull-right">
        <div class="has-feedback">
            <form action="${pageContext.request.contextPath}/feijixiangqing/searchFeiJiXiangQing" method="post">
                名称：<input name="mingcheng" value="${search.mingcheng}">&nbsp;&nbsp;&nbsp;
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
                <th class="sorting">详情ID</th>
                <th class="sorting">类型ID</th>
                <th class="sorting">名称</th>
                <th class="sorting">简介</th>
                <th class="sorting">图片</th>
                <th class="sorting">制造商</th>
                <th class="sorting">使用年限</th>
                <th class="text-center">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageResult.rows}" var="FeiJiXiangQing">
                <tr>
                    <td>${FeiJiXiangQing.xiangqingid}</td>
                    <td>${FeiJiXiangQing.leixingid}</td>
                    <td>${FeiJiXiangQing.mingcheng}</td>
                    <td>${FeiJiXiangQing.jianjie}</td>
                    <td>${FeiJiXiangQing.tupian}</td>
                    <td>${FeiJiXiangQing.zhizaoshang}</td>
                    <td>${FeiJiXiangQing.shiyongnianxian}</td>
                    <td class="text-center">
                        <a href="${pageContext.request.contextPath}/feiji/editFeiJiXiangQingPage?id=${FeiJiXiangQing.xiangqingid}" class="btn bg-olive btn-xs">编辑</a>
                        <button type="button" class="btn btn-danger btn-xs" onclick="deleteDetail(${FeiJiXiangQing.xiangqingid})">删除</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 分页插件 -->
        <div id="pagination" class="pagination"></div>
    </div>
</div>
</body>
</html>
