<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - 用户管理</title>

	<link href="${pageContext.request.contextPath}/Admin/adminCss/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Admin/adminCss/css/datepicker3.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/Admin/adminCss/css/styles.css" rel="stylesheet">

<script src="js/html5shiv.js"></script>
<script src="js/respond.min.js"></script>
<![endif]-->

</head>
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
</style>

<body>
<jsp:include page="${pageContext.request.contextPath}/Admin/adminList/headList.jsp" />
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<jsp:include page="${pageContext.request.contextPath}/Admin/adminList/list.jsp" />
	</div><!--/.sidebar-->
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">		
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="../adminCss/#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">用户管理</li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<center>
				<div class="searchDiv">
					<input id="searchInput" class="form-control" type="text" name="commodname" />
					<button onclick="searchUser()" class="btn btn-primary">搜 索</button>
				</div>
			</center>
			<span><s:if test="username!=null">
				搜索内容 <span id="username" style="color: red"><s:property value="username" /></span> 的结果 ：
			</s:if> </span>
			<br /><br /><br />
			<center>
				<table class="table myTable">
					<th colspan="5">用户信息</th>
					<tr>
						<td>用户账号</td>
						<td>真实姓名</td>
						<td>家庭地址</td>
						<td>联系方式</td>
						<td>操作</td>
					</tr>
					<s:iterator value="pageBeanUserInfo.list" var="k">
						<tr>
							<td><s:property value="#k.username" /></td>
							<td><s:property value="#k.realname" /></td>
							<td><s:property value="#k.address" /></td>
							<td><s:property value="#k.phone" /></td>
							<td>
								<s:if test="#k.ban==0">
									<button onclick="banUser(<s:property value="#k.id" />)" class="btn btn-danger">封号处理</button>
								</s:if>
								<s:else>
									<button onclick="openUser(<s:property value="#k.id" />)" class="btn btn-primary">解封账号</button>
								</s:else>

							</td>
						</tr>
					</s:iterator>
				</table>
				<s:if test="searchResult!=null">
					<s:if test="pageBeanUserInfo.currentPage==1">
						<button class="btn">上一页</button>
					</s:if>
					<s:else>
						<button onclick="lastPageResult()" class="btn btn-primary">上一页</button>
					</s:else>
					<s:if test="pageBeanUserInfo.currentPage>=pageBeanUserInfo.totalPage">
						<button class="btn">下一页</button>
					</s:if>
					<s:else>
						<button onclick="nextPageResult()" class="btn btn-primary">下一页</button>
					</s:else>
				</s:if>
				<s:else>
					<s:if test="pageBeanUserInfo.currentPage==1">
						<button class="btn">上一页</button>
					</s:if>
					<s:else>
						<button onclick="lastPage()" class="btn btn-primary">上一页</button>
					</s:else>
					<s:if test="pageBeanUserInfo.currentPage>=pageBeanUserInfo.totalPage">
						<button class="btn">下一页</button>
					</s:if>
					<s:else>
						<button onclick="nextPage()" class="btn btn-primary">下一页</button>
					</s:else>
				</s:else>
				<br />
				总共<s:property value="pageBeanUserInfo.totalSize" />条数据，共<s:property value="pageBeanUserInfo.totalPage" />页，当前为第<s:property value="pageBeanUserInfo.currentPage" />页
			</center>
		</div><!--/.row-->
		<input type="hidden" id="currentPage" value="<s:property value="pageBeanUserInfo.currentPage" />" />
	</div>	<!--/.main-->


	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/chart.min.js"></script>
	<script src="js/chart-data.js"></script>
	<script src="js/easypiechart.js"></script>
	<script src="js/easypiechart-data.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
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
        function lastPage() {
            var page = $("#currentPage").val()*1 - 1;
            window.location.href = "${pageContext.request.contextPath}/admin_showUserMessage.action?currentPage="+page
        }
        function nextPage() {
            var page = $("#currentPage").val()*1 + 1;
            window.location.href = "${pageContext.request.contextPath}/admin_showUserMessage.action?currentPage="+page
        }
        function banUser(i){
            window.location.href = "${pageContext.request.contextPath}/admin_banUser.action?userId="+i
		}
		function openUser(i) {
			window.location.href = "${pageContext.request.contextPath}/admin_openUser.action?userId="+i
        }
        function searchUser() {
			var username = $("#searchInput").val();
			window.location.href = "${pageContext.request.contextPath}/admin_searchUser.action?username="+username
        }
	</script>
</body>

</html>
