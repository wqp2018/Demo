package com.MyAllBlue.MyInterceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdminInterceptor extends MethodFilterInterceptor {
    @Override
    protected String doIntercept(ActionInvocation actionInvocation) throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();

        String adminName = (String)request.getSession().getAttribute("adminName");

        if (adminName!=null){

            return actionInvocation.invoke();

        }

        response.sendRedirect("adminLogin.jsp");

        return null;
    }
}
