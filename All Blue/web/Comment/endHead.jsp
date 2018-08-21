<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/19
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
    <title>Title</title>
    <link href="${pageContext.request.contextPath}/Comment/css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
    <link href="${pageContext.request.contextPath}/Comment/css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${pageContext.request.contextPath}/Comment/css/hover.css" rel="stylesheet" media="all">
    <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Hind:400,300,500,600,700' rel='stylesheet' type='text/css'>
</head>
<body>
<div class="h-strip">
    <div class="container">
        <div class="h-strip-main">
            <div class="h-strip-logo">
                <div class="h-strip-left">
                    <h1><a href="${pageContext.request.contextPath}/Comment/commonPage.jsp">ALL BLUE</a></h1>
                </div>
                <div class="h-strip-right">
                    <form  id="search" action="goods_searchCommod.action" method="post">
                        <input type="text" name="commodname" autofocus placeholder="请输入商品名称" />
                        <input type="submit" value="" />
                    </form>
                </div>
                <div class="clearfix"> </div>
            </div>
            <!-- top-nav -->
            <span class="menu"> </span>
            <div class="cleary"> </div>
            <div class="top-strip">
                <nav class="cl-effect-4">
                    <ul class="top-nav">
                        <li><a href="${pageContext.request.contextPath}/Comment/commonPage.jsp">首页</a></li>
                        <s:if test="#session.username!=null">
                            <li><a href="${pageContext.request.contextPath}/user_MyInfo.action?username=<s:property value="#session.username" />"><s:property value="#session.username" /></a></li>
                                <li><a href="${pageContext.request.contextPath}/user_outLogin.action">注销</a></li>
                        </s:if>
                        <s:else>
                                <li><a href="${pageContext.request.contextPath}/userLogin.jsp">登陆</a></li>
                                <li><a href="${pageContext.request.contextPath}/register.jsp">注册</a></li>
                        </s:else>
                    </ul>
                </nav>
            </div>
            <script>
                $( "span.menu" ).click(function() {
                    $( ".top-strip" ).slideToggle( "slow", function() {
                        // Animation complete.
                    });
                });
            </script>
            <!-- top-nav -->
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
</body>
</html>
