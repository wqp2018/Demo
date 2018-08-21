<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/26
  Time: 20:49
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .topHead{
        height: 85px;
        width: 100%;
        background-color: #3E8FBA;
    }
    .centerTopHead{
        height: 200px;
        width: 1150px;

        position: relative;
        margin: 0 auto;
    }
    .allblue{
        font-size: 38px;
        padding-top: 18px;
        color: white;
        float: left;
    }
    .userMessage{
        display: inline-block;
        width: 200px;
        float: right;
        padding-top: 30px;
    }
    a{
        padding-left: 20px;
        color: white;
        text-decoration: none;
    }
    a:hover{
        color: yellow;
    }
</style>
<body>
<div class="topHead">
    <div class="centerTopHead">
        <div class="allblue">All BlUE</div>
        <div class="userMessage">
            <s:if test="#session.username!=null">
                <span class="a_left"><a href="${pageContext.request.contextPath}/Comment/commonPage.jsp">首页</a></span>
                <span class="a_right">
                    <a href="${pageContext.request.contextPath}/user_MyInfo.action?username=<s:property value="#session.username" />"><s:property value="#session.username" /></a>
                    <a href="${pageContext.request.contextPath}/user_outLogin.action">注销</a>
                </span>
            </s:if>
            <s:else>
                <span class="a_left"><a href="${pageContext.request.contextPath}/Comment/commonPage.jsp">首页</a></span>
                <div class="a_right">
                    <a href="${pageContext.request.contextPath}/userLogin.jsp">登陆</a>
                    <a href="${pageContext.request.contextPath}/register.jsp">注册</a>
                </div>
            </s:else>
        </div>
    </div>

</div>
</body>
</html>
