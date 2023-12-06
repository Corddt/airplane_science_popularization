<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/6
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加飞机详情</title>
    <!-- 引入CSS和JS文件 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<div class="container">
    <h2>添加飞机详情</h2>
    <form action="${pageContext.request.contextPath}/feiji/addFeiJiXiangQing" method="post" id="addFeiJiXiangQingForm">
        <table class="table table-bordered table-striped">
            <!-- 省略详情ID字段，因为添加操作通常不需要显示ID -->
            <tr>
                <td>类型ID</td>
                <td><input class="form-control" name="leixingid"></td>
            </tr>
            <tr>
                <td>名称</td>
                <td><input class="form-control" name="mingcheng"></td>
            </tr>
            <tr>
                <td>简介</td>
                <td><textarea class="form-control" name="jianjie"></textarea></td>
            </tr>
            <tr>
                <td>图片</td>
                <td><input class="form-control" name="tupian"></td>
            </tr>
            <tr>
                <td>制造商</td>
                <td><input class="form-control" name="zhizaoshang"></td>
            </tr>
            <tr>
                <td>使用年限</td>
                <td><input class="form-control" name="shiyongnianxian"></td>
            </tr>
        </table>
        <button type="submit" class="btn btn-success">保存</button>
        <a href="${pageContext.request.contextPath}/feiji/selectFeiJiXiangQing" class="btn btn-default">返回</a>
    </form>
</div>
</body>
</html>

