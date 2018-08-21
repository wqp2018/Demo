<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/22
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/jquery.js"></script>
    <script>
        $(function () {

            $("#rePassword").blur(function () {
                var password = $("#password").val();
                var rePassword = $("#rePassword").val();
                if (password!=rePassword){
                    $(".errorMessage").html("两次输入的密码不一致")
                }else {
                    $(".errorMessage").html("");

                }

            })

            $(".changeBtn").click(function () {
                var password = $("#password").val();
                var rePassword = $("#rePassword").val();
                if (password!=rePassword){

                    $(".errorMessage").html("两次输入的密码不一致")
                }else {
                    $("#changePw").submit();
                }
            })
        })
    </script>
    <style>
        .changeBtn{
            height: 20px;
            width: 60px;
            margin-top: 20px;
            border: 1px solid black;
            cursor: pointer;
        }
        .centerD{
            width: 700px;
            height: 300px;
            position: relative;
            margin: 20px auto;
            border: 1px solid black;
        }
        form{
            margin-top: 50px;
        }
        .errorMessage{
            position: absolute;
        }
    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp"></jsp:include>
<div class="centerD">

    <form id="changePw" action="${pageContext.request.contextPath}/user_changePw.action">
        <center>输入新密码 : <input id="password" name="password" type="password" /></center><br />
        <input type="hidden" name="username" value="<s:property value="myInfo.username" />" />
        <center>确&nbsp;认&nbsp;密&nbsp;码 : <input id="rePassword" type="password"/><i class="errorMessage" style="color: red"></i></center><br />
        <center><div class="changeBtn">确认</div></center>
    </form>

</div>
</body>
</html>
