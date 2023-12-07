<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8">
    <title>飞机详情列表</title>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-image: url('../img/feijibizhi2.jpg');
            background-size: cover;
            color: #333;
        }

        .container {
            background-color: rgba(255, 255, 255, 0.9); /* 增加不透明度 */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            margin: 20px auto;
            max-width: 900px; /* 减小最大宽度 */
        }

        h3.box-title {
            text-align: center;
            margin-bottom: 20px;
        }

        .toolbar {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .btn {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 10px;
            margin: 10px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s;
            font-size: 14px;
            display: inline-block;
            text-align: center;
            line-height: 1.5;
            vertical-align: middle;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-primary, .btn-edit {
            background-color: #28a745;
        }

        .btn-primary:hover, .btn-edit:hover {
            background-color: #218838;
        }

        .btn-danger, .btn-delete {
            background-color: #dc3545;
        }

        .btn-danger:hover, .btn-delete:hover {
            background-color: #c82333;
        }

        .search-form {
            display: flex;
            align-items: center;
        }

        .input-field {
            padding: 5px 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            margin-right: 10px;
        }

        .table-box {
            margin: 20px;
        }

        #dataList {
            width: 100%;
            border-collapse: collapse;
        }

        #dataList .jianjie {
            width: 35%;
        }

        #dataList .caozuo {
            width: 15%;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
        }

        .pagination {
            text-align: center;
            padding: 10px 0;
        }

        .pagination a, .pagination span {
            margin: 0 5px;
            padding: 5px 10px;
            border-radius: 5px;
            background-color: #ddd;
            color: #333;
            text-decoration: none;
        }

        .pagination a:hover {
            background-color: #ccc;
        }
    </style>
</head>
<body>
<div class="container">
    <h3 class="box-title">飞机详情展示</h3>
    <a href="${pageContext.request.contextPath}/admin/main.jsp" class="btn btn-default">返回主页</a>
    <div class="table-box">
        <table id="dataList">
            <thead>
            <tr>
                <th>名称</th>
                <th id="jianjie">简介</th>
                <th class="caozuo">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${feijixiangqingList}" var="detail">
                <tr>
                    <td>${detail.mingcheng}</td>
                    <td>${detail.jianjie}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/feiji/feijixiangqingDetail?id=${detail.xiangqingid}" class="btn btn-primary">查看详情</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pagination">
        <!-- 分页控件 -->
    </div>
</div>
</body>
</html>
