<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/9
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../adminCss/css/bootstrap.min.css" rel="stylesheet">
    <link href="../adminCss/css/datepicker3.css" rel="stylesheet">
    <link href="../adminCss/css/styles.css" rel="stylesheet">
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><span>Lumino</span>Admin</a>
            <ul class="user-menu">
                <li class="dropdown pull-right" id="dropdown">
                    <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown"><span class="glyphicon glyphicon-user"></span> <s:property value="#session.adminName" /> <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="adminPage/adminPage/#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                        <li><a href="adminPage/adminPage/#"><span class="glyphicon glyphicon-cog"></span> Settings</a></li>
                        <li><a href="${pageContext.request.contextPath}/admin_adminLogout.action"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<script src="${pageContext.request.contextPath}/Admin/adminCss/js/jquery-1.11.1.min.js"></script>
<script>

    $("#dropdown").click(function () {
        if ($(this).hasClass("open")){
            $(this).removeClass("open")
        }else {
            $(this).addClass("open")
        }

    })
</script>
</body>
</html>
