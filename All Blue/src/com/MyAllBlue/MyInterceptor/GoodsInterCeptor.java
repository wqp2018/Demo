package com.MyAllBlue.MyInterceptor;

import com.MyAllBlue.Online.OnlineUser;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.UUID;

public class GoodsInterCeptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        String username = (String)request.getSession().getAttribute("username");
        UUID token = (UUID) request.getSession().getAttribute(username);
        UUID token2 = OnlineUser.map.get(username);
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (username!=null){
            if (token==token2){
                //放行，不做任何处理
                actionInvocation.invoke();
            }else {
                //账号被逼下线，清空session
                request.getSession().setAttribute("loginBeOut","账号已在别处登陆");
                request.getSession().removeAttribute("username");
                actionInvocation.invoke();
            }
        }else {
            //没有登录，放行，不做任何处理
            actionInvocation.invoke();
        }

        return null;
    }
}
