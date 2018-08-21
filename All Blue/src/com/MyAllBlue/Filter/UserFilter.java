package com.MyAllBlue.Filter;

import com.MyAllBlue.Online.OnlineUser;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

public class UserFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String username = (String)request.getSession().getAttribute("username");
        UUID token = (UUID) request.getSession().getAttribute(username);
        UUID token2 = OnlineUser.map.get(username);
        response.setHeader("Content-type", "text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        if (username!=null){
            if (token==token2){
                filterChain.doFilter(request,response);
            }else {
                //账号被逼下线
                request.getSession().setAttribute("loginBeOut","账号已在别处登陆");
                request.getSession().removeAttribute("username");
                response.sendRedirect("/user_login.action");
            }
        }else {
            request.getSession().setAttribute("noLogin","账号未登陆");
            response.sendRedirect("/user_login.action");
        }
    }

    @Override
    public void destroy() {
    }
}
