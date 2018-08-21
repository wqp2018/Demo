<?php
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<?php echo base_url().'public/css/bootstrap.css'?>" />
    <style>
        .headDiv{
            height: 50px;
            width: 80%;
            background: deepskyblue;
            position: relative;
            margin: auto;
            left: 0;
            right: 0;
            padding-top:10px ;
        }
        ul{
            list-style: none;
            position: absolute;
            right: 50px;
        }
        ul li{
            display: inline-block;
            margin-right: 10px;
        }
        .toDefault{
            display: inline-block;
            margin-left: 30px;
            float: left;
        }
        a{
            font-size: 20px;
            color: white;
        }
        .wrapDiv{
            width: 80%;
            height: 500px;
            position: relative;
            margin: auto;
            top: 20px;
            left: 0;
            right: 0;
        }
        .headTop{
            height: 30px;
            background: #2b542c;
        }
        .imgMessageDiv{
            height: 300px;
            width: 300px;
            display: inline-block;
            float: left;
            position: relative;
            margin-left: 150px;
        }
        .imgMessageDiv img{
            height: 150px;
            width: 150px;
            margin-left: 75px;
            margin-top: 75px;
        }
        .contentMessageDiv{
            height: 300px;
            width: 600px;
            float: left;
            position: relative;
        }
        .contentShow{
            height: 200px;
            width: 450px;
            position: relative;
            margin: auto;
            left: 0;
            right: 0;
            top: 50px;
        }
        .spanText{
            font-size: 18px;
            line-height: 30px;
        }
        .btn{
            width: 100px;
            margin-left: 150px;
        }
    </style>
</head>
<body>
<div class="headDiv">
    <div class="toDefault"><a href="<?php echo site_url()?>">首页</a></div>
    <?php if ($this->session->userdata('user')){?>
        <ul>
            <li class="rightLi"><a href="#"><?php echo $this->session->userdata('user')?></a></li>
            <li class="rightLi"><a href="<?php echo site_url('welcome/logout')?>">注销</a></li>
        </ul>
    <?php }else{ ?>
        <ul>
            <li class="rightLi"><a href="<?php echo site_url('welcome/login')?>">登录</a></li>
            <li class="rightLi"><a href="<?php echo site_url('welcome/registerPage')?>">注册</a></li>
        </ul>
    <?php }?>
</div>
<div class="wrapDiv">
    <div class="headTop"></div>
    <div class="imgMessageDiv">
        <img src="<?php echo base_url().$img?>" />
    </div>
    <div class="contentMessageDiv">
        <div class="contentShow">
            <span class="spanText"><b><i>商品名称：</i></b></span> <span class="spanText"><?php echo $commodname?></span>
            <br /><br />
            <span class="spanText"><b><i>价格：</i></b></span> <span class="spanText"><?php echo $price?></span>
            <br /><br />
            <span class="spanText"><b><i>库存：</i></b></span> <span class="spanText"><?php echo $hascount?></span>
            <span class="spanText"><b><i>&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;</i></b></span>
            <span class="spanText"><b><i>销售：</i></b></span> <span class="spanText"><?php echo $salecount?></span>
            <br /><br />
            <?php if ($hascount==0){?>
                <button class="btn" disabled="disabled">没有了</button>
            <?php }?>
            <?php if ($hascount>0){?>
                <a href="<?php echo site_url('welcome/buyCommod')?>"><button class="btn btn-primary">购买</button></a>
            <?php }?>
        </div>
    </div>
</div>
</body>
</html>
