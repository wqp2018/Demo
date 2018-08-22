<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/8/22
 * Time: 17:56
 */
header("Content-type: text/html; charset=utf-8");
session_start();

$comments = $_POST['comments'];
$userid = $_POST['userid'];


$conn = mysqli_connect('localhost','root','1234','lyb');

$sql = "insert into discuss(userid,comments) VALUES ('".$userid."','".$comments."')";

var_dump($sql);

if($conn->query($sql)){
    echo "留言成功";
}else{
    echo $conn->error;
    die("发生错误");
}

echo $_SESSION['userinfo']['username'];

echo $comments."<br />";

?>
<!doctype html>
<html lang="en">
<head>

    <title>Document</title>
    <meta http-equiv="refresh" content = "2;url=index.php">
</head>
<body>

留言成功，两秒后跳转回留言页面。
</body>
</html>
