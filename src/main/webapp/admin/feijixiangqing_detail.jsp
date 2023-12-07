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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/feijixiangqing_detail.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h2>飞机详情</h2>
    <a href="${pageContext.request.contextPath}/admin/main.jsp" class="btn btn-default">返回主页</a>
    <a href="${pageContext.request.contextPath}/feiji/feijixiangqingList" class="btn btn-default">返回飞机详情列表</a>
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
</body>
</html>

