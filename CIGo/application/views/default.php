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
    <script type="text/javascript" src="<?php echo base_url().'public/js/jquery.js'?>"></script>
    <script>
        $(function () {
            var content = "<?php foreach ($type as $v):?>"+
                "<a href='javascript:void(0)' onclick=ajaxType(<?php echo $v['id']?>)>"+
                "<span class='showType'><?php echo $v['typename']?></span></a><?php endforeach;?>";
            $("#showCommodType").append(content);

            ajaxType(1);
        })
        function ajaxType(i) {
            $("#showCommod").html('');
            var contentMessage = "";
            $.ajax({
                url:"<?php echo site_url('welcome/showCommodFour/')?>" + i,
                success:function (data) {
                    console.log(data)
                    for (var i = 0;i<data.length;i++){
                        contentMessage += "<a href='<?php echo site_url('welcome/showCommodMessage/')?>"+data[i]['id']+"'><div class='imgDiv'>" +
                            "<img class='img' src='<?php echo base_url()?>"+data[i]['img']+"'></img>" +
                            "<span class='commodName'>"+data[i]['commodname']+"</span>" +
                            "</div></a>"
                    }
                    $("#showCommod").append(contentMessage);
                }
            })
        }
    </script>
    <title>Document</title>
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
        .hotWrap{
            width: 60%;
            margin: auto;
            left: 0;
            right: 0;
            height: 200px;
        }
        .hotGoods{
            display: block;
            height: 50px;
            width: 80%;
            background: cornflowerblue;
            position: relative;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
            left: 0;
            right: 0;
            text-align: center;
            font-size: 30px;
            line-height: 50px;
            color: white;
        }
        .showType{
            display: inline-block;
            width: 50px;
            height: 30px;
            background: orange;
            color: white;
            text-align: center;
            line-height: 30px;
            margin-left:10px ;
        }
        .imgDiv{
            display: inline-block;
            width: 150px;
            float: left;
            position: relative;
            text-align: center;
            margin-right: 30px;
            margin-top: 20px;
        }
        .imgDiv:hover{
            transform: scale(1.05);
        }
        .commodName{
            display: inline-block;
            width: 100%;
            background: lightskyblue;
        }
        .img{
            height: 150px;
            width: 150px;
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
<div class="hotWrap">
    <span class="hotGoods">热门商品区</span>
    <div id="showCommodType">
    </div>
    <div id="showCommod">
    </div>
</div>
</body>
</html>