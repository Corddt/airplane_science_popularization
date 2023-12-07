<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="utf-8">
    <title>飞机科普</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/feijimain_web.css"> <!-- 新增CSS链接 -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script type="text/javascript">
        function SetIFrameHeight() {
            var iframeid = document.getElementById("iframe");
            if (document.getElementById) {
                /*设置 内容展示区的高度等于页面可视区的高度*/
                iframeid.height = document.documentElement.clientHeight;
            }
        }
    </script>
</head>
<body class="hold-transition skin-green sidebar-mini">
<div class="wrapper">
    <!-- 页面头部 -->
    <header class="main-header">
        <!-- Logo -->
        <a href="${pageContext.request.contextPath}/admin/main.jsp" class="logo">
            <span class="logo-lg"><b>飞机科普网站</b></span>
        </a>
        <!-- 头部导航 -->
        <nav class="navbar navbar-static-top">
            <!-- 新的水平导航栏 -->
            <ul class="horizontal-nav">
                <li><a href="main.jsp"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li><a href="${pageContext.request.contextPath}/feiji/selectFeiJiLeiXing"><i class="fa fa-circle-o"></i> 飞机类型管理</a></li>
                <li><a href="${pageContext.request.contextPath}/feiji/selectFeiJiXiangQing"><i class="fa fa-circle-o"></i> 飞机详情管理</a></li>
                <li><a href="${pageContext.request.contextPath}/feiji/feijixiangqingList"><i class="fa fa-circle-o"></i> 飞机详情展示</a></li>
                <!-- 用户信息和注销 -->
                <li><a><img src="${pageContext.request.contextPath}/img/moren.jpg" class="user-image" alt="User Image"><span class="hidden-xs">${USER_SESSION.name}</span></a></li>
                <li><a href="${pageContext.request.contextPath}/logout"><span class="hidden-xs">注销</span></a></li>
            </ul>
        </nav>
    </header>
    <!-- 页面头部 /-->
    <!-- 内容展示区域 -->
    <div class="content-wrapper">
        <iframe width="100%" id="iframe" name="iframe" onload="SetIFrameHeight()" frameborder="0" src="${pageContext.request.contextPath}/feiji/feijimainpage"></iframe>
    </div>
</div>
</body>
</html>
