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
    <title>管理员登录页面</title>
    <style>
        .loginDiv{
            height: 500px;
            width: 600px;
            border: 1px solid black;
            margin-top: 100px;
        }
    </style>
</head>
<body>
<center>
    <div class="loginDiv">
        <br /><br /><br /><br />
        <h2>管理员登录</h2>
        <form action="<?php echo site_url('welcome/adminLogin')?>" method="post">
            Username : <input type="text" name="adminName" />
            <br /><br />
            Password : <input type="password" name="password" />
            <br /><br />
            <button class="btn btn-primary" type="reset">重置</button>
            <button class="btn btn-primary" type="submit">登录</button>
        </form>
    </div>
</center>
</body>
</html>
