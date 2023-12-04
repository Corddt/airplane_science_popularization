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
    <!-- 引入CSS和JS文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pagination.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/pagination.js"></script>
    <script src="${pageContext.request.contextPath}/js/feiji.js"></script> <!-- 添加您的飞机类型管理脚本 -->
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
                    <button type="button" class="btn btn-default" title="新建" data-toggle="modal"
                            data-target="#addOrEditModal"> 新增
                    </button>
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
                        <button type="button" class="btn bg-olive btn-xs" data-toggle="modal"
                                data-target="#addOrEditModal" onclick="findTypeById(${FeiJiLeiXing.leixingid},'edit')"> 编辑
                        </button>
                        <button type="button" class="btn btn-danger btn-xs" onclick="deleteType(${FeiJiLeiXing.leixingid})"> 删除
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <!-- 数据表格 /-->
        <!-- 分页插件 -->
        <div id="pagination" class="pagination"></div>
    </div>
    <!-- 引入模态窗口的JSP文件 -->
    <jsp:include page="/admin/feiji_modal.jsp"></jsp:include>
</body>
</html>