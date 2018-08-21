<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/16
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/jquery.js"></script>
    <script>
        $(function () {
            $("#imgsub").click(function () {
                $("#search").submit();
            })
        })
    </script>
    <style>
        #imgsub{
            height: 42px;
            width: 42px;
            border: 4px solid red;
            position: absolute;
            left: 292px;
        }
        .type{
            height: 50px;
            width: 300px;
            font-size: 20px;
            border: 4px solid red;
            position: absolute;
        }
        #searchDiv{
            height: 50px;
            width: 400px;
            position: relative;
            margin: 20px auto;
            line-height: 50px;
        }
    </style>
</head>
<body>
<div id="searchDiv">
    <form id="search" action="goods_searchCommod.action" method="post">
        <input class="type" type="text" name="commodname" autofocus placeholder="请输入商品名称" />
        <input type="image" src="${pageContext.request.contextPath}/image/search.jpg" id="imgsub" />
    </form>
</div>
</body>
</html>
