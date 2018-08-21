<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/26
  Time: 0:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp"></jsp:include>
<jsp:include page="${pageContext.request.contextPath}/Comment/search.jsp"></jsp:include>
<jsp:include page="${pageContext.request.contextPath}/Comment/hotGoods.jsp"></jsp:include>
<jsp:include page="${pageContext.request.contextPath}/Comment/goods.jsp"></jsp:include>
<jsp:include page="${pageContext.request.contextPath}/Comment/foot.jsp"></jsp:include>
</body>
</html>
