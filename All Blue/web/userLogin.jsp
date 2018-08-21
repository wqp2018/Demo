<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="userLogin/css/style2.0.css">
    <style type="text/css">
        ul li{font-size: 30px;color:#2ec0f6;}
        .tyg-div{z-userLogin:-1000;float:left;position:absolute;left:5%;top:20%;}
        .tyg-p{
            font-size: 14px;
            font-family: 'microsoft yahei';
            position: absolute;
            top: 135px;
            left: 60px;
        }
        .tyg-div-denglv{
            z-userLogin:1000;float:right;position:absolute;right:3%;top:10%;
        }
        .tyg-div-form{
            background-color: #23305a;
            width:300px;
            height:auto;
            margin:120px auto 0 auto;
            color:#2ec0f6;
        }
        .tyg-div-form form {padding:10px;}
        .tyg-div-form form input[type="text"]{
            width: 270px;
            height: 30px;
            margin: 25px 10px 0px 0px;
        }
        .tyg-div-form form button {
            cursor: pointer;
            width: 270px;
            height: 44px;
            margin-top: 25px;
            padding: 0;
            background: #2ec0f6;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #2ec0f6;
            -moz-box-shadow:
                    0 15px 30px 0 rgba(255,255,255,.25) inset,
                    0 2px 7px 0 rgba(0,0,0,.2);
            -webkit-box-shadow:
                    0 15px 30px 0 rgba(255,255,255,.25) inset,
                    0 2px 7px 0 rgba(0,0,0,.2);
            box-shadow:
                    0 15px 30px 0 rgba(255,255,255,.25) inset,
                    0 2px 7px 0 rgba(0,0,0,.2);
            font-family: 'PT Sans', Helvetica, Arial, sans-serif;
            font-size: 14px;
            font-weight: 700;
            color: #fff;
            text-shadow: 0 1px 2px rgba(0,0,0,.1);
            -o-transition: all .2s;
            -moz-transition: all .2s;
            -webkit-transition: all .2s;
            -ms-transition: all .2s;
        }
        #loginButton{
            margin-top: 20px;
            width: 200px;
            height: 40px;
            text-align: center;
            font-size: 30px;
            color: white;
            cursor: pointer;
            background-color:skyblue;

        }
        #l_password{
            height: 30px;
            width: 270px;
            margin-top: 25px;
        }
    </style>
</head>
<body>
<div class="tyg-div">
    <ul>
        <li>让</li>
        <li><div style="margin-left:20px;">数</div></li>
        <li><div style="margin-left:40px;">据</div></li>
        <li><div style="margin-left:60px;">改</div></li>
        <li><div style="margin-left:80px;">变</div></li>
        <li><div style="margin-left:100px;">生</div></li>
        <li><div style="margin-left:120px;">活</div></li>
    </ul>
</div>
<div id="contPar" class="contPar">
    <div id="page1"  style="z-userLogin:1;">
        <div class="title0">行业智慧能力平台</div>
        <div class="title1">旅游、交通、气象、公共安全、大数据</div>
        <div class="imgGroug">
            <ul>
                <img alt="" class="img0 png" src="userLogin/img/page1_0.png">
                <img alt="" class="img1 png" src="userLogin/img/page1_1.png">
                <img alt="" class="img2 png" src="userLogin/img/page1_2.png">
            </ul>
        </div>
        <img alt="" class="img3 png" src="userLogin/img/page1_3.jpg">
    </div>
</div>
<div class="tyg-div-denglv">
    <div class="tyg-div-form">
        <form id="loginForm" action="${pageContext.request.contextPath}/user_breakLogin.action" method="post">
            <h2>登录</h2><p class="tyg-p">欢迎访问  智慧能力</p>
            <div style="margin:5px 0px;">
                <input id="l_username" type="text" name="username" placeholder="请输入账号..."/>
            </div>
            <div style="margin:5px 0px;">
                <input id="l_password" type="password" name="password" placeholder="请输入密码..."/>
            </div>
            <div style="margin:5px 0px;">
                <input id="l_validate" type="text" name="loginValidate" style="width:150px;" placeholder="请输入验证码..."/>
                <img src="${pageContext.request.contextPath}/user_loginValidate.action" id="loginValidate" style="vertical-align:bottom;" alt="验证码"/>
            </div>
            <center><div id="loginButton">登录</div></center><br />
        </form>
    </div>
</div>

<script type="text/javascript" src="userLogin/js/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="userLogin/js/com.js"></script>
<script>
    $(function () {
        $("#loginValidate").click(function () {
            //$("#loginValidate").src = "";
            $("#loginValidate").attr('src','${pageContext.request.contextPath}/user_loginValidate.action?time='+new Date());
        });

        <% if (request.getSession().getAttribute("loginBeOut")!=null){%>
        alert("该账号已在别处登陆")
        <%
          request.getSession().removeAttribute("loginBeOut");
        }else if (request.getSession().getAttribute("loginPlease")!=null){%>
        alert("请先登录")
        <%
        request.getSession().removeAttribute("loginPlease");
        }
        %>

        $("#loginButton").click(function () {
            var username = $("#l_username").val();
            var password = $("#l_password").val();
            var loginValidate = $("#l_validate").val();

            if (username.length == 0){
                alert("用户名不能为空");
                return
            }
            if (password.length == 0){
                alert("密码不能为空");
                return
            }
            if (loginValidate.length == 0){
                alert("请输入验证码");
                return
            }
            if (username.length!=0&&password.length!=0&&loginValidate.length!=0){
                var loginValidateUrl = ${pageContext.request.contextPath}"/userAjax_loginValidateAjax.action?loginValidate="+loginValidate;

                $.ajax({
                    url:loginValidateUrl,
                    success:function (data) {
                        if (data == "true"){
                            var ajaxto = "${pageContext.request.contextPath}/userAjax_loginAjax.action?username="+username+"&password="+password;
                            $.ajax({
                                url:ajaxto,
                                success:function (data) {
                                    if(data==0){
                                        /*
                                        *  第一次登陆
                                        * */
                                        console.log(data);
                                        window.location.href = ${pageContext.request.contextPath}"/user_login.action";
                                    }else {
                                        if(confirm("该账号已经登陆，是否继续登陆")){
                                            var loginForm = $("#loginForm");
                                            loginForm.submit();
                                        }
                                    }
                                }
                            })
                        }else {
                            alert("验证码错误");
                        }
                    }
                })
            }

        })
    })
</script>

</body>
</html>