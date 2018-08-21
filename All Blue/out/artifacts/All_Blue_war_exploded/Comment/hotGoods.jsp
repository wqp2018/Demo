<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/3
  Time: 16:09
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jquery.js"></script>
    <script>
        function loadPic() {
            var Url = "${pageContext.request.contextPath}/goods_hotGoods.action";
            $.getJSON(Url,function (data) {
                var imgss = '';
                for (var i=0;i<data.pic.length;i++){
                   imgss += '<div class="showGood"><a href="${pageContext.request.contextPath}/goods_commodMessage.action?id='+data.commodId[i]+'"><img src="${pageContext.request.contextPath}/'+data.pic[i]+'" class="hotPic"></img><span>'+data.commonName[i]+'<span></a></div>';
                }
                $(".showGoodWrap").append(imgss);
            })
        }
        $(function () {
            loadPic();
        })
    </script>
</head>
<style>
    .hotGoodsTitle{
        height: 30px;
        width: 1200px;
        position: relative;
        margin: 30px auto 0;
        text-align: center;
        background-color: lightskyblue;
    }
    .showGoodWrap{
        height: 240px;
        width: 1200px;
        position: relative;
        margin: 0 auto;
        text-align: center;
        border: 1px solid black;
    }
    .showGood{
        height: 220px;
        width:120px;
        margin-right: 120px;
        margin-left: 120px;
        display: inline-block;
    }
    .hotPic{
        height:200px;
        width:120px;
    }
    .showGood:hover{
        box-shadow: 1px 1px 2px black;
        transition: all 0.3s;
    }
    a{
        text-decoration: none;
    }
    a:hover{
        text-decoration: underline;
    }
</style>
<body>
<div class="hotGoodsTitle"><span>热门商品区</span></div>
<div class="showGoodWrap">
</div>
</body>
</html>