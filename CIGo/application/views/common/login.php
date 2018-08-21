<?php

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" type="text/css" href="<?php echo base_url().'public/css/bootstrap.css'?>" />
    <title>Document</title>
    <style>
        .loginDiv{
            width: 600px;
            height: 700px;
            border: 1px solid black;
            position: relative;
            margin: 20px auto;
        }
    </style>
    <script type="text/javascript" src="<?php echo base_url().'public/js/jquery.js'?>"></script>
    <script>
        $(function () {

        })
        function changeCode() {
            $("#codeImg").attr('src',"<?php echo site_url('welcome/reloadPic')?>");
        }
        function login() {
            var u=0,p=0,v=0;
            if ($("#username").val() == ''){
                alert("请输入用户名");
            }else {
                u = 1;
                if ($("#password").val() == ''){
                    alert("请输入密码");
                }else {
                    p = 1;
                    if ($("#validation").val() == ''){
                        alert("请输入验证码");
                    }else {
                        v = 1;
                    }
                }
            }
            if (u==1&&p==1&&v==1){
                $("loginForm").submit();
            }
        }
    </script>
</head>
<body>
<div class="loginDiv">
    <center><h2>登录</h2></center>
    <form id="loginForm" action="<?php echo site_url('welcome/loginDo')?>" method="post">
        <center>
        Username : <input id="username" value="<?php echo set_value('username')?>" type="text" name="username" />
        <br /><br />
        Password : <input id="password" type="password" name="password" />
        <br /><br />
            验证码 : <input id="validation" type="text" name="validation" /><span style="position: absolute;color: red"><?php if(isset($msg)){echo $msg;}?></span><br />
            <br />
            <img id="codeImg" onclick="changeCode()" src="<?php echo site_url('welcome/reloadPic')?>" />
        <br /><br />

        <button class="btn btn-primary" type="reset">重置</button>
        <button class="btn btn-primary" onclick="login()">登录</button>
        </center>
    </form>
    <br /><br />
    <center>
        <a href="<?php echo site_url()?>"><button class="btn btn-primary">返回首页</button></a>
    </center>
</div>
</body>
</html>
