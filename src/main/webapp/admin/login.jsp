<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>欢迎来到飞机科普网站</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
</head>
<body>
<div class="login-container">
    <div class="login-box">
        <h4 class="title">欢迎来到飞机科普网站</h4>
        <form id="login-form" action="${pageContext.request.contextPath}/login" method="post">
            <!-- 登录提示信息 -->
            <div class="message" aria-live="polite">${msg}</div>
            <div class="form-group">
                <label for="email" class="label-name">用户名</label>
                <input type="text" id="email" name="email" placeholder="企业邮箱" class="form-control">
            </div>
            <div class="form-group">
                <label for="password" class="label-name">密码</label>
                <input type="password" id="password" name="password" placeholder="请输入密码" class="form-control">
            </div>
            <div class="form-action">
                <button type="submit" class="btn btn-danger">登 录</button>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript">
    // 登录超时，跳出 iframe
    if (window.top !== window.self) {
        window.top.location = '${pageContext.request.contextPath}/admin/login.jsp';
    }
</script>
</body>
</html>
