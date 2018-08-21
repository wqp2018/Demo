<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/10
  Time: 14:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/jquery.js"></script>
    <script>
        //展现商品的所有类型
        function loadType() {

            var Url = "${pageContext.request.contextPath}/goods_goodTypeList.action?time=new Date()";
            $.getJSON(Url,function (data) {
                var html = '';
                html += '<ul class="List">';
                for (var i=0;i<4;i++){
                    html += '<div class="imgWrap"><span class="spanShowType"><li id="'+data.typeId[i]+'" class="typeName" onclick="loadGoods('+data.typeId[i]+')">'+data.typeName[i]+'</li></span></div>';
                }
                html += '</ul>';
                $(".goodTypeList").append(html);
            })
        }


        //展现商品
        function loadGoods(id) {
            $(".selectName").removeClass("selectName");

            var Url = "${pageContext.request.contextPath}/goods_goodList.action?time=new Date()&id="+id;
            $.getJSON(Url,function (data) {
                var html = '';
                $(".goodTypePic").empty();
                for (var i=0;i<4;i++){
                    html += '<div class="goodImgDiv"><a href="${pageContext.request.contextPath}/goods_commodMessage.action?id='+data.commodId[i]+'"><img class="goodImg" src="${pageContext.request.contextPath}/'+data.commodPic[i]+'"></img><span>'+data.commodName[i]+'</span></a></div>';
                }
                html += '<a class="more" href="${pageContext.request.contextPath}/goods_showCommod.action?id='+id+'">更多>></a>'
                $(".goodTypePic").append(html);
            })
            $(".typeName:eq("+(id-1)+")").addClass("selectName");

        }

        $(function () {
            loadType();
            loadGoods(1);
            setTimeout(function () {
                $(".typeName:eq("+0+")").addClass("selectName");
            },300)
        })
    </script>
    <style>
        .goodsList{
            height: 300px;
            width: 1200px;
            position: relative;
            margin: 30px auto 0;
            text-align: center;
            border: 1px solid black;
        }
        .goodType{
            text-align: left;
        }
        .selectName{
            background: blue;
            color: white;
        }
        .List{
            list-style-type:none;
            margin-left: 100px;
        }
        .typeName{
            height: 30px;
            width: 60px;
            text-align: center;
            line-height: 30px;
            margin-right:12px ;
            display: inline-block;
        }
        .typeName:hover{
            background: blue;
            color: white;
            transition: all 0.2s;
        }
        .imgWrap{
            display: inline-block;
        }
        .goodTypePic{
            height: 200px;
            margin-top: 10px;
        }
        .spanShowType{
            cursor: pointer;
        }
        .goodImgDiv{
            height: 200px;
            width: 120px;
            margin-left: 100px;
            text-align: center;
            display: inline-block;
        }
        .goodImg{
            height: 180px;
            width: 120px;
        }
        .goodImgDiv:hover{
            transform: scale(1.1);
            box-shadow: 2px 2px 2px black;
            transition: all 0.5s;
        }
        .spanClass{
            height: 30px;
            width: 1200px;
            background: skyblue;
        }
        .more{
            margin-left: 120px;
        }
    </style>
</head>
<body>
<div class="goodsList">
    <div class="spanClass">
    <span><i>商品区</i></span>
    </div>
<div class="goodType">
    <ul class="goodTypeList"></ul>
    <div class="goodTypePic">
    </div>
</div>
</div>
</body>
</html>