<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/6
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>编辑飞机类型</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
<body>
<c:url var="editActionUrl" value="/feiji/editFeiJiLeiXing"/>
<div class="container">
    <h2>编辑飞机类型</h2>
    <form action="${editActionUrl}" method="post">
        <input type="hidden" name="leixingid" value="${param.leixingid}">
        <div class="form-group">
            <label for="leixingmingcheng">类型名称:</label>
            <input type="text" class="form-control" id="leixingmingcheng" name="leixingmingcheng" value="${FeiJiLeiXing.leixingmingcheng}">
        </div>
        <div class="form-group">
            <label for="miaoshu">描述:</label>
            <textarea class="form-control" id="miaoshu" name="miaoshu">${FeiJiLeiXing.miaoshu}</textarea>
        </div>
        <button type="submit" class="btn btn-success">保存更改</button>
        <a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing" class="btn btn-default">取消</a>
    </form>
</div>
</body>
</html>
