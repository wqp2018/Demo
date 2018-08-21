<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/14
  Time: 18:48
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
                var big = 4;
                if(data.typeId.length > big){
                    big = data.typeId.length
                }
                for (var i=0;i<big;i++){
                    html += '<div class="imgWrap"><span class="spanShowType"><li id="'+data.typeId[i]+'" onclick="loadGoodImage('+data.typeId[i]+')" class="typeName")">'+data.typeName[i]+'</li></span></div>';
                }
                html += '</ul>';
                $(".goodTypeList").append(html);
            })
        }

        function loadGoodImage(id){
            window.location.assign("${pageContext.request.contextPath}/goods_showCommod.action?id="+id)
        }

        $(function () {
            loadType();
            var id = $("#id").val()-1;
            setTimeout(function () {
                $(".typeName:eq("+id+")").addClass("typeNameSelect");
            },100)

        })
    </script>
    <style>
        .goodsList{
            min-height: 300px;
            width: 1200px;
            height: 400px;
            position: relative;
            margin: 30px auto 0;
            border: 1px solid black;
        }
        .typeNameSelect{
            background: blue;
            color: white;
        }
        .goodType{
            text-align: left;
        }
        .List{
            list-style-type:none;
            margin-left: 100px;
        }
        .imgWrap{
            display: inline-block;
        }
        .goodPicList{
            width: 800px;
            position: relative;
            margin: 20px auto;
        }
        .spanClass{
            height: 30px;
            width: 1200px;
            text-align: center;
            background: skyblue;
        }
        .spanShowType{
            cursor: pointer;
        }
        .typeName{
            height: 30px;
            width: 60px;
            text-align: center;
            line-height: 30px;
            margin-right:12px ;
            display: inline-block;
        }
        a{
            display: inline-block;
            color: black;
            text-decoration: none;
        }
        .imgDiv{
            display: inline-flex;
            text-align: center;
            margin-left: 80px;
        }
        .imgDiv:hover{
            transform: scale(1.2);
            transition: all 0.1s;
            box-shadow: 2px 2px 2px black;
        }
        .spImg{
            height: 180px;
            width: 120px;
        }
        .pageSpan{
        }
        .spanDiv{
            margin-top: 50px;
            text-align: center;
        }
    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp"></jsp:include>
<jsp:include page="${pageContext.request.contextPath}/Comment/search.jsp"></jsp:include>
<div class="goodsList">
    <div class="spanClass">
        <span><i>商品区</i></span>
    </div>
    <div class="goodType">
        <ul class="goodTypeList">
        </ul>
    </div>
    <input type="hidden" id="id" value="<s:property value="commodPageBean.list[0].category.id" />">
    <div class="goodPicList">
        <s:iterator value="commodPageBean.list" var="k">
            <div class="imgDiv">
                <a href="${pageContext.request.contextPath}/goods_commodMessage.action?id=<s:property value="#k.id" />"><img class="spImg" src="<s:property value="#k.pic"/>" /><br/><span><s:property value="#k.commodname"></s:property></span></a>
            </div>
        </s:iterator>
        <br />
    </div>
    <div class="spanDiv">
        <span class="pageSpan">一共有<s:property value="commodPageBean.totalSize"/>条数据,共<s:property value="commodPageBean.totalPage"/>页</span>
        <br />
        <span class="changeSpan">
            <s:if test="commodPageBean.currentPage!=1">
                <a href="${pageContext.request.contextPath}/goods_showCommod.action?currentPage=<s:property value="commodPageBean.currentPage-1" />&id=<s:property value="commodPageBean.list[0].category.id" />">上一页</a>
            </s:if>
            <s:if test="commodPageBean.currentPage!=commodPageBean.totalPage">
                <a href="${pageContext.request.contextPath}/goods_showCommod.action?currentPage=<s:property value="commodPageBean.currentPage+1" />&id=<s:property value="commodPageBean.list[0].category.id" />">下一页</a>
            </s:if>
            <span>第<s:property value="commodPageBean.currentPage" />页</span>
        </span>
    </div>
</div>
</body>
</html>
