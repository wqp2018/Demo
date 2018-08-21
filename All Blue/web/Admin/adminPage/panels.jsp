<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>管理员页面</title>

	<link href="${pageContext.request.contextPath}/Admin/adminCss/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Admin/adminCss/css/datepicker3.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Admin/adminCss/css/styles.css" rel="stylesheet">

	<style>
		#searchInput{
			margin-top: 50px;
			width: 500px;
			display: inline-block;
		}
		.table th, .table td {
			text-align: center;
			vertical-align: middle!important;
		}
		.alertDivWrap{
			display: none;
			position: absolute;
			z-index: 9999;
			top:0;
			height: 100%;
			width: 100%;
			background: rgba(0,0,0,0.5);
		}
		.alertDiv{
			z-index: 10000;
			position: absolute;
			height:700px ;
			width:500px ;
			top: 100px;
			left: 20%;
			background: white;
			border: 1px solid black;
		}
		.closeJia{
			cursor: pointer;
			text-align: center;
			font-size: 30px;
			line-height: 20px;
			transform: rotate(45deg);
			-webkit-transform: rotate(45deg);
			height: 20px;
			width: 20px;
			position: relative;
			float: right;
			margin-top:5px;
			margin-right: 5px;
		}
		.spanText{
			font-size: 20px;
			margin-left: 100px;
		}
		.inputCName{
			width: 200px;
			display: inline-block;
		}
		.showImg{
			display: inline-block;
			width: 200px;
			height: 100px;
		}
		#showImg{
			width: 200px;
			height: 100px;
		}
		.newFormDiv{
			z-index: 10000;
			position: absolute;
			height:350px ;
			width:500px ;
			top: 100px;
			left: 55%;
			background: white;
			border: 1px solid black;
		}
	</style>

</head>

<body>
<jsp:include page="${pageContext.request.contextPath}/Admin/adminList/headList.jsp" />

<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
	<jsp:include page="${pageContext.request.contextPath}/Admin/adminList/list.jsp" />
</div><!--/.sidebar-->

<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	<div class="row">
		<ol class="breadcrumb">
			<li><a href="adminPage/adminPage/#"><span class="glyphicon glyphicon-home"></span></a></li>
			<li class="active">产品管理</li>
		</ol>
	</div><!--/.row-->

	<div class="alertDiv">
		<br />
		<center><h2>修改商品信息</h2></center>
		<br />
		<br />
		<form id="addForm" action="${pageContext.request.contextPath}/admin_addCommod.action" method="post" enctype="multipart/form-data">
			<input id="commodId" type="hidden" name="commodId" />
			<span class="spanText">商品名称 ：</span><input placeholder="请输入货物名称" id="commodNameUpdate" class="form-control inputCName" type="text" name="commodName" />
			<br /><br /><br />
			<span class="spanText">商品价格 ：</span><input placeholder="请输入货物价格" id="commodPriceUpdate" class="form-control inputCName" type="text" name="price" />
			<br /><br /><br />
			<span class="spanText">商品分类 ：</span>
			<select name="commodTypeId">
				<s:iterator value="type" var="t">
					<option value="<s:property value="#t.id" />"><s:property value="#t.typename" /></option>
				</s:iterator>
			</select>
			<br /><br /><br />
			<span class="spanText">商品库存 ：</span><input placeholder="请输入货物库存" id="commodHascoutnUpdate" class="form-control inputCName" type="text" name="hascount" />
			<br /><br /><br />
			<span class="spanText">商品图片 ：</span>
			<div class="showImg">
				<img onclick="fileSelect()" id="showImg" src="/image/default.jpg" />
				<input onchange="loadCommodImageAjax(this)" type="file" accept=".dmp" name="img" style="display: none" id="fileInput" />
			</div>
			<br /><br /><br />
			<center>
				<button type="button" class="btn btn-primary" onclick="qx()">取消修改</button>
				<button type="submit" class="btn btn-primary">确认上传</button>
			</center>
		</form>

	</div>
	<div class="newFormDiv">
		<form action="${pageContext.request.contextPath}/admin_addCommodType.action" method="post">
			<br />
			<center><h2>增加货物类别</h2></center>
			<br />
			<br />
			<span class="spanText">商品类型 ：</span><input placeholder="请输入商品类型" class="form-control inputCName" type="text" name="commodTypeName" />
			<br />
			<br />
			<br /><br />
			<center>
			<button type="submit" class="btn btn-primary">确认添加</button>
			</center>
		</form>
	</div>




</div>	<!--/.main-->



<script src="${pageContext.request.contextPath}/Admin/adminCss/js/jquery-1.11.1.min.js"></script>

<script>
    $('#calendar').datepicker({
    });

    !function ($) {
        $(document).on("click","ul.nav li.parent > a > span.icon", function(){
            $(this).find('em:first').toggleClass("glyphicon-minus");
        });
        $(".sidebar span.icon").find('em:first').addClass("glyphicon-plus");
    }(window.jQuery);

    $(window).on('resize', function () {
        if ($(window).width() > 768) $('#sidebar-collapse').collapse('show')
    })
    $(window).on('resize', function () {
        if ($(window).width() <= 767) $('#sidebar-collapse').collapse('hide')
    })

    function fileSelect() {
        return $("#fileInput").click();
    }

    function loadCommodImageAjax(file) {

        var formData = new FormData($("#addForm")[0]);

        var newUrl = "${pageContext.request.contextPath}/admin_uploadImageAjax.action";

        $.ajax({
            url:newUrl,
            type:"POST",
            data:formData,
            dataType:"json",
            processData: false,
            contentType: false,
            success: function (msg) {
                $("#showImg").attr("src","${pageContext.request.contextPath}"+msg)
            }
        })

    }
</script>
</body>

</html>
