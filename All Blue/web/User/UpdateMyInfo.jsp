<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/20
  Time: 12:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .cDiv{
            width: 800px;
            position: relative;
            margin: 100px auto;
            text-align: center;
        }
        input{
            margin-top: 20px;
        }

    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp"></jsp:include>
<div class="cDiv">
    <form action="user_updateMyInfo.action">
        真实姓名 : <input name="realname" type="text" value="<s:property value="myInfo.realname" />" /><br />
        &nbsp;&nbsp;地 &nbsp; 址 &nbsp; : <input name="address" type="text" value="<s:property value="myInfo.address" />" /><br />
        联系方式 : <input name="phone" type="text" value="<s:property value="myInfo.phone" />" /><br />
        <input type="submit" value="确认修改" /><br />
    </form>
</div>
</body>
</html>
