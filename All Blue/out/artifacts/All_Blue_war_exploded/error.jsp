<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/26
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
error
<s:debug></s:debug>

<%--<s:iterator value="[0].top">
    <s:property value="pic"></s:property>
</s:iterator>--%>
123
<s:iterator value="picList" var="s">
    <s:property value="#s.pic"></s:property>
</s:iterator>
<s:property value="[0].top" />

</body>
</html>
