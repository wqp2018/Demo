<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/29
  Time: 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/jquery.js"></script>
    <script>

        $(function () {
            //1为不可提交，0为可提交
            var user = 1;
            var pass = 1;
            var rePass = 1;

            //检测是否已经存在用户
            $("#username").blur(function () {
                var username = $("#username").val();
                if (username==''){
                    $(".username").html("*用户名不能为空").css({color:"red"})
                    user = 1;
                }else {
                    $(".username").html("")
                    var url = "${pageContext.request.contextPath}/userAjax_existOrNo.action?username="+username+"&time=new Date()";
                   $.ajax({
                       url: url,
                       success: function (data) {
                           if(data == "Y"){
                               $(".username").html("*该用户名已存在").css({color:"red"});
                               user = 1;
                           }else {
                               $(".username").html("用户名可用").css({color:"blue"});
                               user = 0;
                           }
                       }
                   })
                }
            })

            //判断两个密码是否相同
            $("#password").blur(function () {
                var password = $("#password").val();

                if (password == ""){
                    $(".password").html("*密码不能为空").css({
                        position:"absolute",
                        color:"red"
                    })
                    pass = 1;
                }else {
                    $(".password").html("")
                    pass = 0;
                }
            })



            $("#rePassword").blur(function () {
                var password = $("#password").val();
                var repassword = $("#rePassword").val();

                if (password != repassword){
                    $(".rePassword").html("*两次输入的密码不相同").css({
                        position:"absolute",
                        color:"red"
                    });
                    rePass = 1;
                }else {
                    $(".rePassword").html("");
                    rePass = 0;
                }
            })

            //判断是否通过，是则提交表单，否则报错
            $("#subButton").click(function () {
                if (user==0&&pass==0&&rePass==0){
                    $("#centerTx").html("")
                    $("#registerForm").submit()
                }else {
                    $("#centerTx").html("*表单输入有误，请重新检查输入").css({
                        color:"red"
                    })
                    if (user == 1){
                        $(".username").html("* 用户名不能为空或该用户名已存在").css({color:"red"});
                    }
                    if (pass == 1){
                        $(".password").html("*密码不能为空").css({color:"red"});
                    }
                }
            })

        })

    </script>
    <style>
        .wrapDiv{
            min-height: 700px;
            width: 800px;
            border: 1px solid black;
            position: relative;
            margin: 100px auto;
        }
        .centerDiv{
            height: 500px;
            width: 700px;
            border: 1px solid black;
            text-align: center;
            margin: 50px auto;
        }
        input{
            margin-bottom: 30px;
        }
        h2{
            margin-top: 50px;
            margin-bottom: 30px;
        }
        .username{
            position: absolute;
        }
    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp"></jsp:include>
<div class="wrapDiv">
    <div class="centerDiv">
        <h2>用户注册</h2>
        <form method="post" id="registerForm" action="user_registerUser.action">
            用&nbsp;户&nbsp;名 ：<input id="username" type="text" name="username" />&nbsp;&nbsp;<span class="username"></span><br>
            真实姓名 : <input type="text" name="realname">&nbsp;&nbsp;<br>
            &nbsp;密&nbsp;&nbsp;码&nbsp; ：&nbsp;<input id="password" type="password" name="password" />&nbsp;&nbsp;<span class="password"></span><br>
            确认密码 : <input id="rePassword" type="password" name="rePassword" />&nbsp;&nbsp;<span class="rePassword"></span><br>
            &nbsp;地&nbsp;&nbsp;址&nbsp; ：&nbsp;<input id="address" type="text" name="address" />&nbsp;&nbsp;<br>
            电话号码 : <input type="text" name="phone" />&nbsp;&nbsp;<br>
            <input id="subButton" type="button" value="注册" />
            <input type="reset" value="清空">
            <center id="centerTx"></center>
        </form>
    </div>
</div>
</body>
</html>
