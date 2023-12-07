<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/6
  Time: 21:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>编辑飞机详情</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<c:url var="editActionUrl" value="/feiji/editFeiJiXiangQing"/>
<div class="container">
    <h2>编辑飞机详情</h2>
    <form action="${editActionUrl}" method="post">
<%--        <input type="hidden" name="xiangqingid" value="${param.xiangqingid}">--%>
    <input type="hidden" name="xiangqingid" value="${FeiJiXiangQing.xiangqingid}">

    <div class="form-group">
            <label for="leixingid">类型ID:</label>
            <input type="text" class="form-control" id="leixingid" name="leixingid" value="${FeiJiXiangQing.leixingid}">
        </div>
        <div class="form-group">
            <label for="mingcheng">名称:</label>
            <input type="text" class="form-control" id="mingcheng" name="mingcheng" value="${FeiJiXiangQing.mingcheng}">
        </div>
        <div class="form-group">
            <label for="jianjie">简介:</label>
            <textarea class="form-control" id="jianjie" name="jianjie">${FeiJiXiangQing.jianjie}</textarea>
        </div>
        <div class="form-group">
            <label for="tupian">图片:</label>
            <input type="text" class="form-control" id="tupian" name="tupian" value="${FeiJiXiangQing.tupian}">
        </div>
        <div class="form-group">
            <label for="zhizaoshang">制造商:</label>
            <input type="text" class="form-control" id="zhizaoshang" name="zhizaoshang" value="${FeiJiXiangQing.zhizaoshang}">
        </div>
        <div class="form-group">
            <label for="shiyongnianxian">使用年限:</label>
            <input type="text" class="form-control" id="shiyongnianxian" name="shiyongnianxian" value="${FeiJiXiangQing.shiyongnianxian}">
        </div>
        <button type="submit" class="btn btn-success">保存更改</button>
        <a href="${pageContext.request.contextPath}/feiji/selectFeiJiXiangQing" class="btn btn-default">取消</a>
    </form>
</div>
</body>
</html>

