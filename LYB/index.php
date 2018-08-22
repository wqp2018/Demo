<?php
header("Content-type: text/html; charset=utf-8");
define("ROOT_PATH",__DIR__);

session_start();
if (isset($_SESSION['userinfo'])){
    echo $_SESSION['userinfo']['id'];
    header("Location:page/index.php");
}


?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="common/bootstrap.css">
    <title>Document</title>
</head>
<body>
<div>
<form action="page/index.php" method="post">
    <input type="text" name="username" />
    <input type="password" name="password" />
    <input type="submit" value="登录" />
</form>
</div>
</body>
</html>
