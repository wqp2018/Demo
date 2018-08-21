<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/3/26
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
   String username = (String)request.getSession().getAttribute("username");
   if (username!=null){
       response.sendRedirect("user_login.action");
   }
%>
<html>
<head>
    <title>Title</title>
    <script src="jquery.js" type="text/javascript"></script>
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
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/Comment/head.jsp"></jsp:include>
<s:fielderror name="loginError" />
<form id="loginForm" action="${pageContext.request.contextPath}/user_breakLogin.action" method="post">
    用户名 ：<input id="l_username" type="text" name="username" /><br />
    密 码 ：<input id="l_password" type="password" name="password" /><br />
    验证码 ：<input id="l_validate" type="text" name="loginValidate" />
    <img id="loginValidate" src="${pageContext.request.contextPath}/user_loginValidate.action"><br />
    <input id="loginButton" type="button" value="登陆" /><br />
</form>
</body>
</html>
