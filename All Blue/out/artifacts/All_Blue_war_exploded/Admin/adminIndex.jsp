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
			display: none;
			z-index: 10000;
			position: absolute;
			height:700px ;
			width:500px ;
			top: 100px;
			left: 40%;
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
	</style>

</head>

<body>
<div class="alertDivWrap">
</div>
<div class="alertDiv">
	<br />
	<center><h2>修改商品信息</h2></center>
	<br />
	<br />
	<form id="addForm" action="${pageContext.request.contextPath}/admin_updateCommod.action" method="post" enctype="multipart/form-data">
		<input id="commodId" type="hidden" name="commodId" />
		<span class="spanText">商品名称 ：</span><input id="commodNameUpdate" class="form-control inputCName" type="text" name="commodName" />
		<br /><br /><br />
		<span class="spanText">商品价格 ：</span><input id="commodPriceUpdate" class="form-control inputCName" type="text" name="price" />
		<br /><br /><br />
		<span class="spanText">商品库存 ：</span><input id="commodHascoutnUpdate" class="form-control inputCName" type="text" name="hascount" />
		<br /><br /><br />
		<span class="spanText">商品图片 ：</span>
		<div class="showImg">
		<img onclick="fileSelect()" id="showImg" src="" />
		<input onchange="loadCommodImageAjax(this)" type="file" accept=".dmp" name="img" style="display: none" id="fileInput" />
		</div>
		<br /><br /><br />
		<center>
			<button type="button" class="btn btn-primary" onclick="qx()">取消修改</button>
			<button type="submit" class="btn btn-primary">确认修改</button>
		</center>
	</form>

</div>
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
		<center>
		<div class="searchDiv">
			<input id="searchInput" class="form-control" type="text" name="commodname" />
			<button onclick="searchCommod()" class="btn btn-primary">搜 索</button>
		</div>
		</center>
		<br />
		<br />
		<center class="typeCenter">
		   <%-- 展示分类list --%>
			<s:iterator value="categories" var="c">
				<button onclick="changeType(<s:property value="#c.id" />)" class="btn btn-primary"><s:property value="#c.typename" /></button>
			</s:iterator>
		</center>
		<br />
		<span><s:if test="commodName!=null">
			搜索内容 <span id="commodName" style="color: red"><s:property value="commodName" /></span> 的结果 ：
		</s:if> </span>
		<center>
			<table class="table myTable">
				<th colspan="6">产品信息</th>
				<tr>
					<td>名称</td>
					<td>价格</td>
					<td>所属分类</td>
					<td>库存</td>
					<td>销量</td>
					<td>操作</td>
				</tr>
				<s:iterator value="pageBeanCommod.list" var="k">
					<tr>
						<td><s:property value="#k.commodname" /></td>
						<td><s:property value="#k.price" /></td>
						<td><s:property value="#k.category.typename" /></td>

						<td><s:property value="#k.hascount" /></td>
						<td><s:property value="#k.salecount" /></td>
						<td><a onclick="updateCommod(<s:property value="#k.id" />)" href="#">修改</a> &nbsp;<a onclick="deleteWarn(<s:property value="#k.id" />)" href="#">删除</a></td>
					</tr>
				</s:iterator>
			</table>
			<s:if test="searchResult!=null">
				<s:if test="pageBeanCommod.currentPage==1">
					<button class="btn">上一页</button>
				</s:if>
				<s:else>
					<button onclick="lastPageResult()" class="btn btn-primary">上一页</button>
				</s:else>
				<s:if test="pageBeanCommod.currentPage>=pageBeanCommod.totalPage">
					<button class="btn">下一页</button>
				</s:if>
				<s:else>
					<button onclick="nextPageResult()" class="btn btn-primary">下一页</button>
				</s:else>
			</s:if>
			<s:else>
				<s:if test="pageBeanCommod.currentPage==1">
					<button class="btn">上一页</button>
				</s:if>
				<s:else>
					<button onclick="lastPage()" class="btn btn-primary">上一页</button>
				</s:else>
				<s:if test="pageBeanCommod.currentPage>=pageBeanCommod.totalPage">
					<button class="btn">下一页</button>
				</s:if>
				<s:else>
					<button onclick="nextPage()" class="btn btn-primary">下一页</button>
				</s:else>
			</s:else>
			<br />
			总共<s:property value="pageBeanCommod.totalSize" />条数据，共<s:property value="pageBeanCommod.totalPage" />页，当前为第<s:property value="pageBeanCommod.currentPage" />页
		</center>

	</div>	<!--/.main-->

	<input id="currentPage" type="hidden" value="<s:property value="pageBeanCommod.currentPage" />" />
	<input id="commodType" type="hidden" value="<s:property value="commodType" />" />

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
		function qx(){
            $(".alertDivWrap").css({
                display:"none"
            })
            $(".alertDiv").css({
                display:"none"
            })
		}
		function lastPage() {
            var page = $("#currentPage").val()*1 - 1;
            var commodType = $("#commodType").val();
            window.location.href = "${pageContext.request.contextPath}/admin_showCommodFunction.action?currentPage="+page+"&commodType="+commodType
        }
        function nextPage() {
            var page = $("#currentPage").val()*1 + 1;
            var commodType = $("#commodType").val();
			window.location.href = "${pageContext.request.contextPath}/admin_showCommodFunction.action?currentPage="+page+"&commodType="+commodType
        }
        function changeType(i) {
		    window.location.href = "${pageContext.request.contextPath}/admin_showCommodFunction.action?commodType="+i
        }
        function searchCommod(){
		    var searchName = $("#searchInput").val();
		    window.location.href = "${pageContext.request.contextPath}/admin_searchCommod.action?searchName="+searchName;
		}
		function deleteWarn(i) {
            if (confirm("是否确认删除该商品！！！")){
                window.location.href = "${pageContext.request.contextPath}/admin_deleteCommod.action?commodId="+i;
			}else {
                return false;
			}
        }
        function lastPageResult() {
            var page = $("#currentPage").val()*1 - 1;
            var commodName = $("#commodName").html()
            window.location.href = "${pageContext.request.contextPath}/admin_searchCommod.action?currentPage="+page+"&searchName="+commodName
        }
		function nextPageResult() {
            var page = $("#currentPage").val()*1 + 1;
            var commodName = $("#commodName").html()
            window.location.href = "${pageContext.request.contextPath}/admin_searchCommod.action?currentPage="+page+"&searchName="+commodName
        }

		function updateCommod(i){
            $(".alertDivWrap").css({
                display:"block"
            })
            $(".alertDiv").css({
                display:"block"
            })
			var url = "${pageContext.request.contextPath}/admin_commodAjax.action?commodId="+i;
			$.ajax({
				url: url,
				dataType:"json",
				success: function (data) {
				    $("#commodNameUpdate").val(''+data.commodName+'')
					$("#commodPriceUpdate").val(''+data.commodPrice+'')
					$("#commodHascoutnUpdate").val(''+data.commodHascount+'')
					$("#commodId").val(''+data.commodId+'')
					$("#showImg").attr("src","${pageContext.request.contextPath}/"+data.pic)
                }
			})
		}
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
