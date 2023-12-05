<%--
  Created by IntelliJ IDEA.
  User: 86153
  Date: 2023/12/5
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>飞机详情</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
</head>
<body>
<div class="container">
    <h2>飞机详情</h2>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">${feijixiangqing.mingcheng}</h4>
            <img src="${feijixiangqing.tupian}" class="img-fluid" alt="飞机图片">
            <p class="card-text"><strong>简介：</strong>${feijixiangqing.jianjie}</p>
            <p class="card-text"><strong>制造商：</strong>${feijixiangqing.zhizaoshang}</p>
            <p class="card-text"><strong>使用年限：</strong>${feijixiangqing.shiyongnianxian}</p>
        </div>
    </div>
    <a href="${pageContext.request.contextPath}/feiji/feijixiangqingList" class="btn btn-primary">返回列表</a>
</div>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</body>
</html>
