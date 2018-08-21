<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/3
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>

</head>
<style>
    *{
        margin: 0;
        padding: 0;
    }
    .wrapDiv{
        width: 1160px;
        min-height: 700px;
        position: relative;
        margin: 50px auto;
        border: 1px solid black;
    }
    .topColor{
        height: 45px;
        background: #4B4B4B;
        color: white;
        line-height: 45px;
    }
    .selectList{
        width: 196px;
        min-height: 500px;

        display: inline-block;
        float: left;
    }
    ul{
        list-style-type: none;
    }
    ul li{
        text-align: center;
        height: 50px;
        font-size: 20px;
        width: 196px;
        line-height: 50px;
        cursor: pointer;
        float: left;
    }
    .message{
        width: 960px;
        min-height: 500px;
        display: inline-block;
        float: left;
        position: relative;
    }
    .myOrder{
        width: 960px;
        min-height: 500px;
        display: inline-block;
        float: left;
        position: relative;
    }

    .h{
        display: none;
    }
    .s{
        background: gray;
        color: white;
    }
    a{
        text-decoration: none;
    }
    .showCenter{
        min-height: 300px;
        width: 700px;
        border: 1px solid black;
        position: relative;
        margin: 20px auto;
    }
    .sPadding{
        padding-left: 20px;
        display: inline-block;
        margin-top: 20px;
    }
    .oTable{
        position: relative;
        width: auto;
        height: auto;
        margin: 20px auto;
        text-align: center;
    }
    .showUpdatePw{
       text-align: center;
    }
    .oTable td{
        padding-left: 10px;
        padding-right: 10px;
        padding-top: 5px;
        padding-bottom: 5px;
    }
    .updateCenter{
        width: 960px;
        min-height: 500px;
        display: inline-block;
        float: left;
        position: relative;
    }
    .updateC{
        min-height: 300px;
        width: 700px;
        border: 1px solid black;
        position: relative;
        margin: 20px auto;
    }
    center:nth-child(1){
        margin-top: 20px;
    }
    .checkBtn{
        height: 20px;
        width: 60px;
        border: 1px solid black;
        cursor: pointer;
    }
    .alertWrap{
        display: none;
        position: absolute;
        height: 100%;
        width: 100%;
        background: rgba(0,0,0,0.5);
        z-index: 99;
    }
    .alertDiv{
        height:700px ;
        width:500px ;
        border: 1px solid black;
        background: white;
        position: relative;
        margin: 100px auto;
        z-index: 199;
    }
    .tArea{
        height: 100px;
        width: 200px;
        font-size: 18px;
    }
    .closeDiv{
        cursor: pointer;
        text-align: center;
        font-size: 30px;
        line-height: 20px;
        transform: rotate(45deg);
        -webkit-transform: rotate(45deg);
        height: 20px;
        width: 20px;
        position: relative;
        float: right;
        margin-top:5px;
        margin-right: 5px;
    }
    .formDiv{
        margin-left: 150px;
    }
</style>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp" />
<div class="alertWrap">
    <div class="alertDiv">
        <div class="closeDiv">+</div>
        <br /><br />
        <br /><br />
        <center><h3>订单评价</h3></center>
        <br /><br />
        <div class="formDiv">
            商品名称 ：<span class="commodNameComment"></span><br /><br /><br />
            &nbsp;个&nbsp;&nbsp; 数&nbsp;&nbsp;   ：<span class="commodCountComment"></span><br /><br /><br />
        </div>
        <form id="commentMessageForm" action="${pageContext.request.contextPath}/orders_assessOrderEnd.action" method="post">
            <input id="userId" name="userID" type="hidden" />
            <input id="commodId" name="commodId" type="hidden" />
            <input id="orderId" name="id" type="hidden" />
            <center>
            商品评价 ：<textarea class="tArea" rows="3" cols="20" name="userCommentArea"></textarea><br /><br /><br />
            <button type="button" onclick="submitOrederAssess()">提交评价</button>
            </center>
        </form>

    </div>
</div>

<div class="wrapDiv">
    <div class="topColor"></div>
    <div class="selectList">
        <ul>
            <s:if test="orderReturn==null">
                <li class="showMessage s">个人信息</li>
                <li class="showMyOrder">我的订单</li>
            </s:if>
            <s:else>
                <li class="showMessage">个人信息</li>
                <li class="showMyOrder s">我的订单</li>
            </s:else>
            <li class="showUpdatePw">修改密码</li>
        </ul>
    </div>
    <s:if test="orderReturn==null">
        <div class="message show">
            <div class="showCenter">
                <form id="updateInfo" action="user_updateInfo.action" method="post">
                    <span class="sPadding"><input type="hidden" name="username" value="<s:property value="myInfo.username" />" /></span><br />
                    <span class="sPadding">真实姓名 : <input name="realname" value="<s:property value="myInfo.realname"/>" /> </span><br />
                    <span class="sPadding">&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址&nbsp;&nbsp; : <input name="address" value="<s:property value="myInfo.address"/>" /></span><br />
                    <span class="sPadding">联系方式 : <input name="phone" value="<s:property value="myInfo.phone"/>" /></span><br />
                    <span class="sPadding"><span class="cSubmit" style="color: blue;cursor: pointer">修改个人设置</span></span>
                </form>
            </div>
        </div>
        <div class="myOrder show h">
            <div class="showCenter">
                <table class="oTable">
                    <tr><td colspan="7">我的订单</td></tr>
                    <tr>
                        <td>订单号</td>
                        <td>商品</td>
                        <td>单价</td>
                        <td>数量</td>
                        <td>总价</td>
                        <td>下单时间</td>
                        <td>订单状态</td>
                        <td>评价</td>
                    </tr>
                    <s:if test="orderInfo==null">
                        <tr><td colspan="7">订单为空</td></tr>
                    </s:if>
                    <s:iterator value="orderInfo" var="o">
                        <tr>
                            <td><s:property value="#o.id"></s:property></td>
                            <td><s:property value="#o.commod.commodname"></s:property></td>
                            <td><s:property value="#o.commod.price"></s:property></td>
                            <td><s:property value="#o.countsize"></s:property></td>
                            <td><s:property value="#o.totalprice"></s:property></td>
                            <td><s:date name="#o.ordertime" format="yy-MM-dd HH:mm:ss" nice="false"></s:date></td>
                            <td><s:property value="#o.state.statetype" /></td>
                            <td>
                                <s:if test="#o.state.id==2">
                                    <span>等待处理</span>
                                </s:if>
                                <s:elseif test="#o.state.id==1">
                                    <span>正在配送</span>
                                </s:elseif>
                                <s:else>
                                    <s:if test="#o.usercomment==0">
                                        <button onclick="assessOrder(<s:property value="#o.id" />)">评价订单</button>
                                    </s:if>
                                    <s:else>
                                        <span>已评价</span>
                                    </s:else>
                                </s:else>
                            </td>
                        </tr>
                    </s:iterator>
                </table>
            </div>
        </div>
    </s:if>
    <s:else>
        <input id="returnInput" type="hidden" value="1" />
        <div class="message show h">
            <div class="showCenter">
                <form id="updateInfo" action="user_updateInfo.action" method="post">
                    <span class="sPadding"><input type="hidden" name="username" value="<s:property value="myInfo.username" />" /></span><br />
                    <span class="sPadding">真实姓名 : <input name="realname" value="<s:property value="myInfo.realname"/>" /> </span><br />
                    <span class="sPadding">&nbsp;&nbsp;&nbsp;地&nbsp;&nbsp;址&nbsp;&nbsp; : <input name="address" value="<s:property value="myInfo.address"/>" /></span><br />
                    <span class="sPadding">联系方式 : <input name="phone" value="<s:property value="myInfo.phone"/>" /></span><br />
                    <span class="sPadding"><span class="cSubmit" style="color: blue;cursor: pointer">修改个人设置</span></span>
                </form>
            </div>
        </div>
        <div class="myOrder show">
            <div class="showCenter">
                <table class="oTable">
                    <tr><td colspan="7">我的订单</td></tr>
                    <tr>
                        <td>订单号</td>
                        <td>商品</td>
                        <td>单价</td>
                        <td>数量</td>
                        <td>总价</td>
                        <td>下单时间</td>
                        <td>订单状态</td>
                        <td>评价</td>
                    </tr>
                    <s:if test="orderInfo==null">
                        <tr><td colspan="7">订单为空</td></tr>
                    </s:if>
                    <s:iterator value="orderInfo" var="o">
                        <tr>
                            <td><s:property value="#o.id"></s:property></td>
                            <td><s:property value="#o.commod.commodname"></s:property></td>
                            <td><s:property value="#o.commod.price"></s:property></td>
                            <td><s:property value="#o.countsize"></s:property></td>
                            <td><s:property value="#o.totalprice"></s:property></td>
                            <td><s:property value="#o.ordertime"></s:property></td>
                            <td><s:property value="#o.state.statetype" /></td>
                            <td>
                                <s:if test="#o.state.id==2">
                                    <span>等待处理</span>
                                </s:if>
                                <s:elseif test="#o.state.id==1">
                                    <span>正在配送</span>
                                </s:elseif>
                                <s:else>
                                    <s:if test="#o.usercomment==0">
                                        <button onclick="assessOrder(<s:property value="#o.id" />)">评价订单</button>
                                    </s:if>
                                    <s:else>
                                        <span>已评价</span>
                                    </s:else>
                                </s:else>

                            </td>
                        </tr>
                    </s:iterator>
                </table>
            </div>
        </div>
    </s:else>
    <div class="updatePassword h">
        <div class="updateCenter">
            <div class="updateC">
                <center>修改密码</center>
            <br />
            <form id="pwUp" action="user_checkPw.action">
                <center>输入密码:<input class="pw" name="password" type="password" /></center><br />
                <input type="hidden" name="username" id="username" value="<s:property value="myInfo.username" />" />
                <center><div class="checkBtn">确认</div></center>
            </form>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/Comment/js/jquery-1.11.0.min.js"></script>
<script>
    $(function () {

        /*var k = $("#returnInput").val();
        if (k!=null){

        }*/

        $(".showMessage").click(function () {
            $(".s").removeClass("s");
            $(this).addClass("s")
            $(".message").removeClass("h");
            $(".myOrder").addClass("h");
            $(".updatePassword").addClass("h");
        })
        $(".showMyOrder").click(function () {
            $(".s").removeClass("s")
            $(this).addClass("s")
            $(".myOrder").removeClass("h");
            $(".message").addClass("h");
            $(".updatePassword").addClass("h");
        })
        $(".showUpdatePw").click(function () {
            $(".s").removeClass("s")
            $(this).addClass("s")
            $(".updatePassword").removeClass("h");
            $(".myOrder").addClass("h")
            $(".message").addClass("h")
        })

        $(".checkBtn").click(function () {
            var pw = $(".pw").val();
            var username = $("#username").val();

            if (pw==''){
                alert("请输入密码")
            }else {
                $("#pwUp").submit();
            }
        })

        $(".cSubmit").click(function () {
            $("#updateInfo").submit();
        })

        $(".closeDiv").click(function(){
            $(".alertWrap").css({
                "display":"none"
            })
        })

    })
    function assessOrder(i) {
        $(".alertWrap").css({
            "display":"block"
        })
        var url = "${pageContext.request.contextPath}/orders_getOrderMessage.action?id="+i;
        $.ajax({
            url:url,
            dataType:"json",
            success:function (data) {
                $(".commodNameComment").html(data[0]).css({"color":"red"})
                $(".commodCountComment").html(data[1])
                $("#userId").val(''+data[2]+'')
                $("#commodId").val(''+data[3]+'')
                $("#orderId").val(''+data[4]+'')
            }
        })
    }
    function submitOrederAssess() {
        $("#commentMessageForm").submit();
    }
</script>
</body>
</html>
