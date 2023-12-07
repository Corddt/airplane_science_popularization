<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>飞机科普</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function SetIFrameHeight() {
            var iframe = document.getElementById("iframe");
            if (iframe) {
                iframe.style.height = window.innerHeight + 'px';
            }
        }
    </script>
</head>
<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper">
    <header class="main-header">
        <a href="${pageContext.request.contextPath}/admin/main.jsp" class="logo">
            <span class="logo-lg"><b>飞机科普网站</b></span>
        </a>
        <nav class="navbar">
            <ul class="horizontal-nav">
                <li><a href="main.jsp">首页</a></li>
                <li><a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing">飞机类型管理</a></li>
                <li><a href="${pageContext.request.contextPath}/feiji/selectFeiJiXiangQing">飞机详情管理</a></li>
                <li><a href="${pageContext.request.contextPath}/feiji/feijixiangqingList">飞机详情展示</a></li>
                <li class="user-item">
                    <img src="${pageContext.request.contextPath}/img/moren.jpg" class="user-image" alt="User Image">
                    <span>${USER_SESSION.name}</span>
                </li>
                <li><a href="${pageContext.request.contextPath}/logout">注销</a></li>
            </ul>
        </nav>
    </header>
    <div class="content-wrapper">
        <iframe id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="${pageContext.request.contextPath}/feiji/feijimainpage"></iframe>
    </div>
</div>
</body>
</html>
