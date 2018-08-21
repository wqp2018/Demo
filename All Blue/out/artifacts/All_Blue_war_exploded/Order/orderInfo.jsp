<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/4/22
  Time: 0:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jquery.js"></script>
    <script>
        $(function () {
            $(".countsize").val(1);
            $(".number").html($(".countsize").val())
            var dj = $(".dj").html();
            var totalprice;
            $(".totalprice").html(dj);
            $("#totalprice").val(dj);
            $("#countsize").val(1);
            var hascount = $(".hascount").val();
            //增加货物数量
            $(".increase").click(function () {
                var countsize = $(".countsize").val();
                if (countsize==hascount){
                    alert("货物不足")
                }else {
                    countsize = countsize*1 + 1*1;
                    $(".countsize").val(countsize)
                }
                //统计个数
                $(".number").html($(".countsize").val())
                //单价
                dj = $(".dj").html();
                //统计总价
                totalprice = dj * countsize;
                $(".totalprice").html(totalprice);
                $("#totalprice").val(totalprice);
                $("#countsize").val(countsize);
            })
            //货物减少数量
            $(".release").click(function () {
                var countsize = $(".countsize").val();
                if (countsize>1){
                    countsize--;
                }
                $(".countsize").val(countsize)
                totalprice = dj*countsize;
                $(".totalprice").html(totalprice);
                $("#totalprice").val(totalprice);
                $("#countsize").val(countsize);
            })

            //提交订单
            $("#beginOrder").click(function () {

                 $("#order").submit();
            })

        })
    </script>
    <style>
        .wrapDiv{
            height: 800px;
            width: 1160px;
            border: 1px solid blue;
            position: relative;
            margin: 20px auto;
        }
        .topColor{
            height: 45px;
            background: #4B4B4B;
        }
        .marginDiv{
            width: 800px;
            position: relative;
            margin: 50px auto;
        }
        .release{
            display: inline-block;
            height: 20px;
            width: 20px;
            text-align: center;
            cursor: default;
            border-bottom-left-radius: 5px;
            border-top-left-radius: 5px;
            line-height: 20px;
            border: 1px solid gray;
        }
        .countsize{
            display: inline-block;
            position: relative;
            height: 22px;
            width: 60px;
            text-align: center;
            top: -2px;
        }
        .increase{
            display: inline-block;
            height: 20px;
            width: 20px;
            text-align: center;
            cursor: default;
            border-bottom-right-radius: 5px;
            border-top-right-radius: 5px;
            line-height: 20px;
            border: 1px solid gray;
        }
        .commodImage{
            height: 80px;
            width: 80px;
            float: left;
        }
        .commodmessage{
            height: 80px;
            border: 1px solid black;
        }
        #beginorder{
            height: 50px;
            width: 120px;
            text-align: center;
            margin-top: 30px;
            cursor: pointer;
            background: #666600;
            color: white;
            float: right;
            line-height: 50px;
            font-size: 24px;
            border: 1px solid black;
        }
    </style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp"></jsp:include>
    <div class="wrapDiv">
    <div class="topColor"></div>
        <div class="marginDiv">
            <span class="">收货人：<i><strong><s:property value="userInfo.realname" /></strong></i></span><br /><br/>
            <span class="">收获地址：<i><strong><s:property value="userInfo.address" /></strong></i></span><br /><br/>
            <div class="commodmessage">
                <div class="commodImage"><img height="80px" width="80px" src="${pageContext.request.contextPath}/<s:property value="commod.pic" />" /></div>
                <span style="display:inline-block;margin-top: 10px"><i><strong><s:property value="commod.commodname" /></strong></i></span><br /><br/>
                <span style="color: red">￥<i><strong class="dj"><s:property value="commod.price" /></strong></i></span><br /><br/>
            </div>
            <br /><br />
            <input type="hidden" class="hascount" value="<s:property value="commod.hascount" />">
            <span class="release">-</span><input class="countsize" readonly="true" type="text" name="countsize" /><span class="increase">+</span><br/><br/>
            共 <span style="color: #666600" class="number"></span> 件商品，总计
            <span style="color: #666600" class="totalprice"></span> 元

            <form id="order" method="post" action="${pageContext.request.contextPath}/orders_subOrder.action">
                <input type="hidden" name="monovalen" value="<s:property value="commod.price" />" />
                <input id="totalprice" type="hidden" name="totalprice" />
                <input id="countsize" type="hidden" name="countsize" />
                <input type="hidden" name="username" value="<s:property value="userInfo.username" />" />
                <input type="hidden" name="commodId" value="<s:property value="commod.id" />">
            </form>
            <div id="beginOrder">提交订单</div>
        </div>
</div>
</body>
</html>
