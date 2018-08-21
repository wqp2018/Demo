<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/8
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        var time = 4;

        function returnUrlByTime() {

            window.setTimeout('returnUrlByTime()', 1000);

            time = time - 1;

            document.getElementById("layer").innerHTML = time;
        }
    </script>
</head>
<body onload="returnUrlByTime()">
<b>下单成功，<span id="layer">3</span>秒后返回首页。</b>

<%
    //转向语句
    response.setHeader("Refresh", "3;URL=Comment/commonPage.jsp");
%>
</body>
</html>
