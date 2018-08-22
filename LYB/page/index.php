<?php
    header("Content-type: text/html; charset=utf-8");


    session_start();
    // 保存一天
    $lifeTime = 3600;
    setcookie(session_name(), session_id(), time() + $lifeTime, "/");


    if (isset($_POST['username'])&&isset($_POST['password'])){
        $username = htmlspecialchars($_POST['username']);
        $password = htmlspecialchars($_POST['password']);

        $conn = mysqli_connect('localhost','root','1234','lyb');
        if (!$conn){
            die("数据库连接出错");
        }else{
            $sql = "select * from userinfo WHERE username = '".$username."' and pw = '".$password."'";

            $result = mysqli_query($conn,$sql);

            $row = "";
            if ($result){
                $row = mysqli_fetch_assoc($result);
                $_SESSION["userinfo"] = $row;
            }else {
                die("登录失败");
            }
        }
    }

    //未登录则返回登录页面
    if (!isset($_SESSION['userinfo'])){
        //跳转回登录页面
        header("Location:../index.php");
    }

?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        .ly{
            min-height: 80px;
            width: 1200px;
            border: 1px solid black;
        }
    </style>
    <script src="jquery.js"></script>

</head>
<body>
欢迎你,<?php echo $_SESSION['userinfo']['username']?>,<a href="logout.php">退出</a>

<form action="dicuss.php" method="post">
    <input type="hidden" name="userid" value="<?php echo $_SESSION['userinfo']['id']?>">
    <textarea style="height: 200px;width:500px;font-size: 20px;margin: 30px" name="comments"></textarea>
    <input type="submit" id="subInput" value="留言" />
</form>


<div class="d">
    <?php

        $page = 0;

        if (isset($_GET['page'])){
            $page = ($_GET['page']-1) * 3;
        }

        $pageSize = 3;

        $sqlSearch = "select u.username,d.* from discuss d LEFT JOIN userinfo u on u.id = d.userid limit $page,$pageSize";

        $conn = mysqli_connect('localhost','root','1234','lyb');
        //查询留言
        $result = $conn->query($sqlSearch);

        $count = mysqli_fetch_row($conn->query("select count(*) from discuss"));

        echo "总共$count[0]条数据,当前第".($page/3+1)."页";

        while ($row = mysqli_fetch_assoc($result)) {

            ?>
            <div class="ly">
                <span>
                    <?php echo $row['username']?>
                </span>

                <center>
                    <span>
                        <?php echo $row['comments']?>
                    </span>
                </center>

                <span style="float: right">
                    <?php echo $row['discusstime']?>
                </span>
            </div>
            <br />
    <?php
        }
    ?>

    <?php
      $size = ceil($count[0] / 3);

      for ($i=1;$i<=$size;$i++) {
          ?>
          <a href="index.php?page=<?php echo $i;?>"><?php echo $i?></a>

          <?php
      }
    ?>

</div>
</body>
</html>
