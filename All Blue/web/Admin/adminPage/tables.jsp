<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Lumino - Tables</title>

<link href="${pageContext.request.contextPath}/Admin/adminCss/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Admin/adminCss/css/datepicker3.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/Admin/adminCss/css/bootstrap-table.css" rel="stylesheet">
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
		.hasOver:hover{
			cursor: not-allowed;
		}
	</style>

</head>

<body>
<jsp:include page="../adminList/headList.jsp" />
		
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<jsp:include page="${pageContext.request.contextPath}/Admin/adminList/list.jsp" />
	</div><!--/.sidebar-->
<input id="currentPage" type="hidden" value="<s:property value="pageBean.currentPage" />" />
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">			
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="../adminCss/#"><span class="glyphicon glyphicon-home"></span></a></li>
				<li class="active">订单管理</li>
			</ol>
		</div><!--/.row-->
		<center>
			<div class="searchDiv">
				<input id="searchInput" class="form-control" type="text" />
				<button onclick="searchOrder()" class="btn btn-primary">搜 索</button>
			</div>
		</center>
		<br />
		<br />
		<center>
			<button class="btn btn-primary" onclick="noDoOrder()">待处理订单</button>
			<button class="btn btn-primary" onclick="allOrder()">全部订单</button>
		</center>
		<br />
		<table class="table myTable">
			<th colspan="7">产品信息</th>
			<tr>
				<td>订单Id</td>
				<td>用户</td>
				<td>订单费用</td>
				<td>地址</td>
				<td>下单时间</td>
				<td>相隔时间</td>
				<td>状态</td>
				<td>操作</td>
			</tr>
			<s:if test="order!=null">
				<tr>
					<td><s:property value="order.id" /></td>
					<td><s:property value="order.userInfo.realname" /></td>
					<td><s:property value="order.totalprice" /></td>
					<td><s:property value="order.userInfo.address" /></td>
					<td><s:date name="order.ordertime" format="yy-MM-dd HH:mm:ss" nice="false" /></td>
					<td><s:date name="order.ordertime" format="" nice="true" /></td>
					<td><s:property value="order.state.statetype" /></td>
					<td>
						<s:if test="order.state.id==1">
							<button onclick="endOrderById(<s:property value="order.id" />)" class="btn btn-success">已送达</button>
						</s:if>
						<s:elseif test="order.state.id==2">
							<button onclick="beginSendById(<s:property value="order.id" />)" class="btn btn-primary">开始配送</button>
						</s:elseif>
						<s:else>
							<button class="btn hasOver">已完成</button>
						</s:else>
					</td>
				</tr>
			</s:if>
			<s:else>
			<s:iterator value="pageBean.list" var="k">
				<tr>
					<td><s:property value="#k.id" /></td>
					<td><s:property value="#k.userInfo.realname" /></td>
					<td><s:property value="#k.totalprice" /></td>
					<td><s:property value="#k.userInfo.address" /></td>
					<td><s:date name="#k.ordertime" format="yy-MM-dd HH:mm:ss" nice="false" /></td>
					<td><s:date name="#k.ordertime" format="" nice="true" /></td>
					<td><s:property value="#k.state.statetype" /></td>
					<td>
						<s:if test="#k.state.id==1">
							<button onclick="endOrder(<s:property value="#k.id"/>)" class="btn btn-success">已送达</button>
						</s:if>
						<s:elseif test="#k.state.id==2">
							<button onclick="beginSend(<s:property value="#k.id"/>)" class="btn btn-primary">开始配送</button>
						</s:elseif>
						<s:else>
							<button class="btn hasOver">已完成</button>
						</s:else>
					</td>
				</tr>
			</s:iterator>
		</table>
		<br /><br />

		<center>
		<s:if test="searchResult!=null">
			<input type="hidden" id="allOrNo" value="has" />
			<s:if test="pageBean.currentPage==1">
				<button class="btn">上一页</button>
			</s:if>
			<s:else>
				<button onclick="lastPageResult()" class="btn btn-primary">上一页</button>
			</s:else>
			<s:if test="pageBean.currentPage>=pageBean.totalPage">
				<button class="btn">下一页</button>
			</s:if>
			<s:else>
				<button onclick="nextPageResult()" class="btn btn-primary">下一页</button>
			</s:else>
		</s:if>
		<s:else>
			<input type="hidden" id="allOrNo" value="no" />
			<s:if test="pageBean.currentPage==1">
				<button class="btn">上一页</button>
			</s:if>
			<s:else>
				<button onclick="lastPage()" class="btn btn-primary">上一页</button>
			</s:else>
			<s:if test="pageBean.currentPage>=pageBean.totalPage">
				<button class="btn">下一页</button>
			</s:if>
			<s:else>
				<button onclick="nextPage()" class="btn btn-primary">下一页</button>
			</s:else>
		</s:else>
		<br />
		总共<s:property value="pageBean.totalSize" />条数据，共<s:property value="pageBean.totalPage" />页，当前为第<s:property value="pageBean.currentPage" />页
		</center>
		</s:else>
	</div><!--/.main-->

	<script src="${pageContext.request.contextPath}/Admin/adminCss/js/jquery-1.11.1.min.js"></script>

	<script>
        function lastPage() {
            var page = $("#currentPage").val()*1 - 1;
            window.location.href = "${pageContext.request.contextPath}/admin_allOrder.action?currentPage="+page
        }
        function nextPage() {
            var page = $("#currentPage").val()*1 + 1;
            window.location.href = "${pageContext.request.contextPath}/admin_allOrder.action?currentPage="+page
        }
        function lastPageResult() {
            var page = $("#currentPage").val()*1 - 1;
            window.location.href = "${pageContext.request.contextPath}/admin_noDoOrder.action?currentPage="+page
        }
        function nextPageResult() {
            var page = $("#currentPage").val()*1 + 1;
            window.location.href = "${pageContext.request.contextPath}/admin_noDoOrder.action?currentPage="+page
        }
        function noDoOrder() {
			window.location.href = "${pageContext.request.contextPath}/admin_noDoOrder.action"
        }
        function allOrder() {
            window.location.href = "${pageContext.request.contextPath}/admin_allOrder.action"
        }
        function searchOrder() {
			var orderId = $("#searchInput").val();
			window.location.href = "${pageContext.request.contextPath}/admin_searchOrder.action?orderId="+orderId
        }
        function beginSend(i) {
            var result = $("#allOrNo").val();
            var currentPage = $("#currentPage").val();
			window.location.href = "${pageContext.request.contextPath}/admin_beginSend.action?orderId="+i+"&searchName="+result+"&currentPage="+currentPage
        }
        function endOrder(i) {
            var result = $("#allOrNo").val();
            var currentPage = $("#currentPage").val();
            window.location.href = "${pageContext.request.contextPath}/admin_endOrder.action?orderId="+i+"&searchName="+result+"&currentPage="+currentPage
        }
        function beginSendById(i){
            window.location.href = "${pageContext.request.contextPath}/admin_beginSendById.action?orderId="+i
		}
		function endOrderById(i) {
            window.location.href = "${pageContext.request.contextPath}/admin_endOrderById.action?orderId="+i
        }

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
	</script>	
</body>

</html>