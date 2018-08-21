<?php
    if (!$this->session->has_userdata('admin')){
        redirect(site_url('common/adminLogin'));
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
    <title>管理员页面</title>
    <style>
        .adminHead{
            height: 80px;
            width: 80%;
            background: mediumslateblue;
            position: relative;
            margin: auto;
            left: 0;
            right: 0;
        }
        a{
            font-size: 24px;
            color: white;
            line-height: 80px;
        }
    </style>
    <script type="text/javascript" src="<?php echo base_url().'public/js/jquery.js'?>"></script>
    <script>
        function fileSelect() {
            return $("#fileInput").click();
        }
        function loadCommodImageAjax(file) {
            var formData = new FormData($("#addForm")[0]);
            var newUrl = "<?php echo site_url('admin/main/uploadImgAjax')?>";

            $.ajax({
                url:newUrl,
                type:"POST",
                data:formData,
                dataType:"json",
                processData: false,
                contentType: false,
                success: function (msg) {
                    console.log(msg)
                    $("#showImg").attr("src","<?php echo base_url('public/images/')?>"+msg)
                }
            })
        }
    </script>
</head>
<body>
<div class="adminHead">
    <a href="#"><?php echo $this->session->userdata('admin')['adminname']?></a>
    &nbsp;&nbsp;&nbsp;
    <a href="<?php echo site_url('admin/main/logout')?>">注销</a>
</div>
<center>
    <div class="addCommod">
        <form id="addForm" action="<?php echo site_url('admin/main/addCommod')?>" method="post" enctype="multipart/form-data">
        <h2>添加商品</h2>
        货物名称 ：<input type="text" name="commodname" /><?php echo form_error('commodname','<span style="position: absolute">','</span>')?><br /><br />
        价格 ： <input type="text" name="price"><?php echo form_error('price','<span style="position: absolute">','</span>')?><br /><br />
        分类 ： <select name="categroy">
                    <option value="0">请选择分类</option>
                <?php foreach ($type as $v):?>
                    <option value="<?php echo $v['id']?>"><?php echo $v['typename']?></option>
                <?php endforeach;?>
                </select><br /><br />
        库存数量：<input type="text" name="hascount"><?php echo form_error('hascount','<span style="position: absolute">','</span>')?><br /><br />
        商品描述：<input type="text" name="discuss"><br /><br />
        商品图片：<input id="fileInput"onchange="loadCommodImageAjax(this)" type="file" name="img" style="display: none">
            <img onclick="fileSelect()" id="showImg" width="80px" height="80px" src="<?php echo base_url('public/images/default.jpg')?>"><br /><br />
        <button type="reset" class="btn btn-primary">重置</button>
        <button type="submit" class="btn btn-primary">添加</button>
        </form>
    </div>
</center>
</body>
</html>
