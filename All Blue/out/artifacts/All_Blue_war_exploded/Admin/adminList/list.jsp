<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/9
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="../adminCss/css/bootstrap.min.css" rel="stylesheet">
    <link href="../adminCss/css/datepicker3.css" rel="stylesheet">
    <link href="../adminCss/css/styles.css" rel="stylesheet">
</head>
<body>
<ul class="nav menu">
    <li><a href="${pageContext.request.contextPath}/admin_showCommodFunction.action"><span class="glyphicon glyphicon-dashboard"></span> 产品管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin_showUserMessage.action"><span class="glyphicon glyphicon-th"></span> 用户管理</a></li>
    <li><a href="${pageContext.request.contextPath}/Admin/adminPage/charts.jsp"><span class="glyphicon glyphicon-stats"></span> 商品评论管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin_allOrder.action"><span class="glyphicon glyphicon-list-alt"></span> 订单管理</a></li>
    <li><a href="${pageContext.request.contextPath}/admin_toPanel.action"><span class="glyphicon glyphicon-info-sign"></span> 添加商品</a></li>

    <li role="presentation" class="divider"></li>

</ul>
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/chart.min.js"></script>
<script src="js/chart-data.js"></script>
<script src="js/easypiechart.js"></script>
<script src="js/easypiechart-data.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/bootstrap-table.js"></script>
</body>

</html>
