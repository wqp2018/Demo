<?php
    if (isset($msg)){
        echo $msg;
    }
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
    <script type="text/javascript" src="<?php echo base_url().'public/js/jquery.js'?>"></script>
    <script>
        var user = false;
        $(function () {
            $("#username").focus(function () {
                $("#showFormError").css('display','none');
            })
            $("#username").blur(function () {
                var username = $(this).val();
                if(username==''){
                    $("#existUser").html("请输入账号");
                }else {
                    $.ajax({
                        url:"<?php echo site_url('welcome/isExistUser') ?>",
                        type:'post',
                        data:{username:username},
                        success:function (data) {
                            console.log(data)
                            if (data){
                                $("#existUser").html("该账号未被注册");
                                user = true;
                            }else {
                                $("#existUser").html("该账号已存在");
                                user = false;
                            }
                        }
                    })
                }

            })
        })
        function sendEmail() {
            var email = $("#email").val();
            $.ajax({
                url:"<?php echo site_url('welcome/sendEmail')?>",
                type:'post',
                data:{email:email},
                success:function (data) {
                    console.log(data);
                }
            })
            var k = 20;
            $("#emailCode").removeClass('btn-primary');
            $("#emailCode").attr('disable','disable');
            var time = setInterval(function () {
                $("#emailCode").html(k+'秒后再发送');
                k--;
                if (k==-1){
                    clearInterval(time);
                    $("#emailCode").addClass('btn-primary');
                    $("#emailCode").html("发送验证");
                }
            },1000);


        }
    </script>
    <style>
        .registerDiv{
            width: 600px;
            height: 700px;
            border: 1px solid black;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<center>
<div class="registerDiv">
    <h2>注册</h2>
    <form action="<?php echo site_url('welcome/register')?>" method="post">
        用户名：<input type="text" id="username" value="<?php echo set_value('username')?>" name="username" /><?php echo form_error('username','<span id="showFormError" style="position: absolute">','</span>')?>
        <span style="position: absolute;color: red" id="existUser"></span><br /><br />
    密码 ：<input type="password" id="password" name="password" /><?php echo form_error('password','<span style="position: absolute">','</span>')?><br /><br />
    注册邮箱：<input type="email" value="<?php echo set_value('email')?>" id="email" name="email"/><button id="emailCode" type="button" onclick="sendEmail()" class="btn btn-primary" style="position: absolute">发送验证</button><br />
        <?php echo form_error('email','<span style="position: absolute">','</span>')?>
        <br />
    邮箱验证：<input type="text" name="emailCode" /><?php echo form_error('emailCode','<span style="position: absolute">','</span>')?><br /><br />
    <button class="btn btn-primary" type="reset">重置</button>
    <button class="btn btn-primary" type="submit">注册</button>
    </form>
    <br /><br />
    <a href="<?php echo site_url()?>"><button class="btn btn-primary">返回首页</button></a>
</div>
</center>
</body>
</html>
