<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/16
  Time: 11:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/jquery.js"></script>
    <script>
        $(function () {
           $(".overhidden").mousemove(function (e) {
               var offsetX = e.offsetX-40;
               var offsetY = e.offsetY-40;

               if (offsetX<0){
                   offsetX=0;
               }
               if (offsetY<0){
                   offsetY=0;
               }
               if (offsetX>140){
                   offsetX=140;
               }
               if (offsetY>200){
                   offsetY=200
               }

               $(".hiddenD").css({
                   display:"inline-block",
                   left:offsetX,
                   top:offsetY
               })

               $(".showBigImg img").css({
                   display:"block",
                   left:-offsetX*3.5,
                   top:-offsetY*3.5
               })
               $(".showBigImg").css({
                   display:"block"
               })
           }).mouseout(function (e) {
               $(".hiddenD").css({
                   display:"none"
               })
               $(".showBigImg img").css({
                   display:"none"
               })
               $(".showBigImg").css({
                   display:"none"
               })
           });

           //设置默认数量
           $(".count").val(1);
            $(".reduce").click(function () {
                var count = $(".count").val()*1 - 1*1;
                if (count<1){
                    count = 1;
                }
                $(".count").val(count)
            })
           $(".add").click(function () {
               var count = $(".count").val()*1 + 1*1;
               $(".count").val(count)
           })


        })
        function lastPage() {
            var page = $("#currentPage").val()*1 - 1;
            var id = $("#commodId").val();
            window.location.href = "${pageContext.request.contextPath}/goods_commodMessage.action?currentPage="+page+"&id="+id
        }

        function nextPage() {
            var page = $("#currentPage").val()*1 + 1;
            var id = $("#commodId").val();
            window.location.href = "${pageContext.request.contextPath}/goods_commodMessage.action?currentPage="+page+"&id="+id
        }
    </script>
    <style>
        .wrapDiv{
            min-height: 840px;
            width: 1160px;
            border: 1px solid black;
            margin:20px auto;
        }
        .topColor{
            height: 45px;
            background: #4B4B4B;
        }
        .includeDiv{
            width: 900px;
            height: 360px;
            margin: 30px auto;
        }
        .commodImage{
            height: 280px;
            width: 220px;
            display: inline-block;
            position: relative;
            float: left;
            margin-top: 40px;
            margin-left: 50px;
        }
        .commodInformation{
            height: 280px;
            width: 500px;
            float: left;
            margin-top: 40px;
            display: inline-block;
            margin-left: 50px;

        }
        img{
            height: 280px;
            width: 220px;
        }
        .hiddenD{
            height: 80px;
            width: 80px;
            z-index: 30;
            position: absolute;
            background: black;
            opacity: 0.2;
            display: none;
        }
        .overhidden{
            background: black;
            z-index: 100;
            position: absolute;
            height: 280px;
            width: 220px;
            opacity: 0;
        }
        .showBigImg{
            height: 280px;
            width: 280px;
            position: absolute;
            border: 1px solid skyblue;
            display: none;
            z-index: 99;
            overflow: hidden;
        }
        .showBigImg img{
            height: 980px;
            width: 770px;
            position: absolute;
            left: -20px;
            display: none;
        }
        .showMessage{
            height: 260px;
            width: 420px;
            position: relative;
            margin: 10px auto;
        }
        hr{
            border: 0.5px dashed #987cb9;
            margin-bottom: 20px;
        }
        b{
            color: gray;
            margin-left: 10px;
            margin-right:30px ;
        }
        .selectCount{
            height: 20px;
            width: 20px;
            line-height: 15px;
            display: inline-block;
            cursor: pointer;
            font-size: 28px;
            text-align: center;
            border: 1px solid black;
            border-radius: 100%;
        }
        .selectCountWrap{
            margin-left: 50px;
        }
        .count{
            width: 50px;
            height: 24px;
            text-align: center;
        }
        .k{
            margin-left: 12px;
        }
        .commentDiv{
            margin-top: 25px;
            margin-left: 50px;
            display: inline-block;
            height: 30px;
            padding: 5px;
            cursor: pointer;
        }
        .buy{
            border: 1px solid black;
            background: #33CCFF;
            color: blue;
        }
        .car{
            border: 1px solid black;
            color: white;
            background: #666600;
        }
        .car:hover{
            cursor: not-allowed;
        }
        .havenot{
            background: deepskyblue;
            color: white;
        }
        .commentShowDiv{
            width: 900px;
            height: 300px;
            position: relative;
            margin: 10px auto;

        }
        .commentMessage{
            height: 300px;
            width: 600px;
            position: relative;
            margin:20px auto;
        }
        .userMessage{
            height: 80px;
            width: 500px;

        }
        .userHead{
            display: inline-block;

            float: left;
        }
        .bottomButton{
            margin-top: -20px;
        }
    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/endHead.jsp" />

<input type="hidden" id="currentPage" value="<s:property value="pageBean.currentPage" />" />
<input type="hidden" id="commodId" value="<s:property value="commod.id" />">

<div class="wrapDiv">
    <div class="topColor"></div>
    <div class="includeDiv">
    <div class="commodImage">
        <div class="overhidden"></div>
        <div class="hiddenD"></div>
        <img class="imgPic" src="${pageContext.request.contextPath}/<s:property value="commod.pic" />" />
    </div>
    <div class="commodInformation">
        <div class="showBigImg">
            <img src="${pageContext.request.contextPath}/<s:property value="commod.pic" />" />
        </div>
        <div class="showMessage">
            <span style="display: inline-block;height: 30px;line-height: 30px"><b>名称</b><i><strong><s:property value="commod.commodname"></s:property></strong></i></span><br />
            <hr />
            <span style="display: inline-block;height: 30px;line-height: 30px"><b>价格</b><i><strong>￥<s:property value="commod.price"></s:property></strong></i></span><br />
            <hr />
            <span style="display: inline-block;height: 30px;line-height: 30px"><b>销量</b><b><i><strong><s:property value="commod.salecount"></s:property></strong></i></b><b>|</b><b>存货</b><b><i><strong><s:property value="commod.hascount"></s:property></strong></i></b></span><br />
            <hr />
            <s:if test="commod.hascount>0">
                <a href="${pageContext.request.contextPath}/orders_orderMessage.action?username=<s:property value="#session.username" />&commodId=<s:property value="commod.id" />"><div class="buy commentDiv">立即购买</div></a>
                <a href="#"><div class="car commentDiv">加入购物车</div></a>
            </s:if>
            <s:else>
                <div class="commentDiv havenot">没有库存了,客官换个商品吧！</div>
            </s:else>
    </div>
    </div>

    </div>

    <div class="commentShowDiv">
        <div class="commentMessage">
            <h4 class="text-primary">热门评论（<s:property value="pageBean.totalSize" />）</h4>
            <s:if test="pageBean.list!=null">
                <s:iterator value="pageBean.list" var="d">
                    <div class="userMessage">
                        <div class="userHead">
                            <img src="${pageContext.request.contextPath}/image/default.jpg" style="height: 50px;width: 50px;border-radius: 50%" />
                            <div style="height: 20px"><center><s:property value="#d.userInfo.username" /></center></div>
                        </div>
                        <div style="height: 80px;width: 400px;margin-left: 80px">
                            <h4 class="text-info">内容：</h4><s:property value="#d.comment" />
                            <br /><br />
                            <s:date name="#d.discusstime" format="yyyy-MM-dd HH:mm:ss"></s:date>
                        </div>
                    </div>
                    <hr style="background-color: black"/>
                </s:iterator>
            </s:if>
            <s:else>
                <br /><br />
                <center><h4 class="text-info">该商品还没有人评论哦！</h4></center>

            </s:else>
        </div>
        <div class="bottomButton">
            <center>
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
            </center>
        </div>

    </div>

    <div class="commodComment"></div>
</div>
</body>
</html>
