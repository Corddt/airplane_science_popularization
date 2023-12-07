<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/6
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>添加飞机类型</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/add_feijileixing.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h2>添加飞机类型</h2>
    <form action="${pageContext.request.contextPath}/feiji/addFeiJiLeiXing" method="post">
        <div class="form-group">
            <label for="leixingmingcheng">类型名称:</label>
            <input type="text" class="form-control" id="leixingmingcheng" name="leixingmingcheng">
        </div>
        <div class="form-group">
            <label for="miaoshu">描述:</label>
            <textarea class="form-control" id="miaoshu" name="miaoshu"></textarea>
        </div>
        <button type="submit" class="btn btn-success">提交</button>
        <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing" class="btn btn-default">取消</a>
    </form>
</div>
</body>
</html>
