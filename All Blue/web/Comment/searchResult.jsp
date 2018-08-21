<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/16
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/jquery.js"></script>
    <script>
        $(function () {
            var current = $("#getCurrentPage").html();
            var totalPage = $("#getTotalPage").html();
            var searchName = $("#getSearname").html();
            setTimeout(function () {

                if(current==1){
                    $("#lastPage").css({
                        opacity:0.4,
                        cursor:"default"
                });
                    $("#lastPage").attr("href","javascript:void(0)")
                }
                if(current==totalPage){
                    $("#nextPage").css({
                        opacity:0.4,
                        cursor:"default"
                    });
                    $("#nextPage").attr("href","javascript:void(0)")
                }
            },200)

            $("#changePage").click(function () {
                var page = $(".inputPage").val();
                if (page == ""){
                    alert("请输入页数！")
                    return
                }else if(page>totalPage){
                    alert("没有此页数")
                    return
                }else {
                    $("#changePage").attr("href","${pageContext.request.contextPath}/goods_searchCommod.action?currentPage="+page+"&commodname="+searchName);
                }

            })

            createPage(current,totalPage,searchName);

            $("#"+current+"").css({
                color:"red",
                cursor:"default"
            }).attr("href","javascript:return false")

        })

        function createPage(current,totalPage,searchName) {

            //最大呈现页数
            var maxPage = 5;
            //偏移量
            var offset = (maxPage-1)/2;
            var html = '';
            if (totalPage<maxPage){
                for (var i=1;i<=totalPage;i++){
                    html += '<a id="'+i+'" class="apage" href="${pageContext.request.contextPath}/goods_searchCommod.action?currentPage='+i+'&commodname='+searchName+'">'+i+'</a>'
                }
            }else {
                if ((current-offset)>1){
                    html += "..."
                }
                //单前页减去偏移量
                var page = current*1-offset*1;
                //第三页时，依旧从1页开始
                if(page<=1){
                    for (var i=1;i<=maxPage;i++){
                        html += '<a id="'+i+'" class="apage" href="${pageContext.request.contextPath}/goods_searchCommod.action?currentPage='+i+'&commodname='+searchName+'">'+i+'</a>'
                    }
                }else {
                    for (var i=0;i<maxPage;i++){
                        var m = page;
                        //若当前页加上偏移量大于总页数时，大多少，page减多少
                        if((offset*1+current*1)>totalPage){
                            m = page*1-(current*1+offset*1-totalPage*1)
                        }
                        var beginPage = m + i;
                        html += '<a id="'+(m+i*1)+'" class="apage" href="${pageContext.request.contextPath}/goods_searchCommod.action?currentPage='+beginPage+'&commodname='+searchName+'">'+beginPage+'</a>&nbsp';
                        if(beginPage==totalPage){
                            break;
                        }
                    }
                }
                if ((current*1+offset*1)<totalPage){
                    html += "..."
                }
            }

            $("#pageSpan").append(html);

        }
    </script>
    <style>
        .divWrap{
            width: 1160px;
            min-height: 700px;
            position: relative;
            margin: 50px auto;
            border: 1px solid black;
        }
        .apage{
            display: inline-block;
            height:18px;
            width: 18px;
            text-align: center;
            line-height: 18px;
            margin-left: 2px;
            border: 1px solid black;
        }
        .topColor{
            height: 45px;
            background: #4B4B4B;
            color: white;
            line-height: 45px;
        }
        .resultList{
            width: 900px;
            min-height: 630px;
            margin: 20px auto;
        }
        .result{
            height: 160px;
            width: 800px;
            margin-bottom: 10px;
            position: relative;
        }
        .resultImg{
            height:100px;
            width: 100px;
            float: left;
            margin-top: 25px;
        }
        .resultImg img{
            height: 100px;
            width: 100px;
            cursor: pointer;
        }
        .resultMessage{
            height: 100px;
            width: 500px;
            float: left;
            margin-top: 25px;
            margin-left: 50px;
        }
        .inputPage{
            width: 40px;
            text-align: center;
        }
        .imgToMessage:hover{
            transform: scale(1.1);
            transition: all 0.2s;
        }
    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/endHead.jsp"></jsp:include>
<div class="divWrap">
    <div class="topColor">
        <span>&nbsp;&nbsp;一共查询到 <s:property value="pageBean.totalSize" /> 条数据</span>
    </div>
    <div class="showResult">
        <div class="resultList">
            <s:iterator value="pageBean.list" var="k">
                <div class="result">
                    <div class="resultImg"><a href="${pageContext.request.contextPath}/goods_commodMessage.action?id=<s:property value="#k.id" />"><img class="imgToMessage" src="${pageContext.request.contextPath}/<s:property value="#k.pic"/>" /></a></div>
                    <div class="resultMessage">
                        <strong><s:property value="#k.commodname" /></strong>
                        <br />
                        <br />
                        <strong>价格:￥<s:property value="#k.price" /></strong>
                        <br />
                        <br />
                        <strong>销量:<s:property value="#k.salecount" /></strong>
                    </div>
                </div>
                <hr />
            </s:iterator>
            <center><span>
                <a id="lastPage" href="${pageContext.request.contextPath}/goods_searchCommod.action?commodname=<s:property value="searchMessage" />&currentPage=<s:property value="pageBean.currentPage-1" />">上一页</a>
                <span id="pageSpan"></span>
                <a id="nextPage" href="{pageContext.request.contextPath}/goods_searchCommod.action?commodname=<s:property value="searchMessage" />&currentPage=<s:property value="pageBean.currentPage+1" />">下一页</a>,
                共<span id="getTotalPage"><s:property value="pageBean.totalPage" /></span>页,
                第<span id="getCurrentPage"><s:property value="pageBean.currentPage" /></span>页,
                到<input type="text" name="currentPage" class="inputPage"/>页<a id="changePage" style="border: 1px solid black;color: blue;cursor: pointer;">跳转</a>
            </span></center>
            <span hidden id="getSearname"><s:property value="pageBean.searchName"></s:property></span>
        </div>
    </div>
</div>
</body>
</html>
