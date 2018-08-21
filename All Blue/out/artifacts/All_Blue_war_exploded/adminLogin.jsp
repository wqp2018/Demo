<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<head>

    <meta charset="utf-8">
    <title>Fullscreen Login</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- CSS -->
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/supersized.css">
    <link rel="stylesheet" href="assets/css/style.css">

</head>

<body>

<div class="page-container">
    <h1>登录</h1>
    <form action="${pageContext.request.contextPath}/admin_login.action" method="post">
        <input type="text" name="adminname" class="username" placeholder="Username">
        <input type="password" name="password" class="password" placeholder="Password">
        <button type="submit">登录</button>
        <div class="error"><span>+</span></div>
    </form>
</div>

<input id="adminName" type="hidden" value="<s:property value="#session.adminName" />" />

<!-- Javascript -->
<script src="assets/js/jquery-1.8.2.min.js"></script>
<script src="assets/js/supersized.3.2.7.min.js"></script>
<script src="assets/js/supersized-init.js"></script>
<script src="assets/js/scripts.js"></script>

<script>
    $(function () {
        var adminName = $("#adminName").val();
        if (adminName!=""){
            window.location.href = "${pageContext.request.contextPath}/admin_showCommodFunction.action"
        }

    })
</script>


</body>

</html>