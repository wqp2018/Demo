<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/30
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form>
    <img src="image/default.jpg" onclick="kk()" />
    <input onchange="jj()" type="file" id="uploadInput" />
</form>
<script src="jquery.js"></script>
<script>
    $(function () {

    })
    function kk() {
        $("#uploadInput").click();
    }
    function jj() {
        alert(123)
    }

</script>
</body>
</html>
