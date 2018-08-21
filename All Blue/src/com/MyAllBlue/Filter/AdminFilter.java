package com.MyAllBlue.Filter;

import org.apache.struts2.ServletActionContext;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();


        String adminName = (String)request.getSession().getAttribute("adminName");

        if (adminName!=null){

            filterChain.doFilter(request,response);
        }else {

            response.sendRedirect("../adminLogin.jsp");
        }

    }

    @Override
    public void destroy() {

    }
}
