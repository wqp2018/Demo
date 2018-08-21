<?php
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
    <title>Document</title>
    <link href="<?php echo base_url().'public/css/bootstrap.css'?>" rel="stylesheet" type="text/css"/>
</head>
<body>
<form action="<?php echo site_url('/test/send');?>" method="post">
    <input type="text" value="<?php echo set_value('title')?>" name="title" /><?php echo form_error('title','<span>','</span>')?>
    <hr />
    <input type="radio" name="type" value="0" <?php echo set_radio('type','0',TRUE)?>/> 普通
    <input type="radio" name="type" value="1" <?php echo set_radio('type','1') ?>/> 热门
    <hr />
    <input type="submit" value="发布">
</form>
<button class="btn btn-primary">按钮</button>
</body>
</html>
