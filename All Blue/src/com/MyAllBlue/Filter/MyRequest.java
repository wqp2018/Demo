package com.MyAllBlue.Filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class MyRequest extends HttpServletRequestWrapper {
    HttpServletRequest request=null;

    public MyRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }

    @Override
    public String getParameter(String name) {
        String method = request.getMethod();
        System.out.println("单个字符集到这里");
        String value = null;
        try {
            request.setCharacterEncoding("utf-8");
            value = request.getParameter(name);

            if (method.equals("GET")){
                value = new String(value.getBytes("iso-8859-1"),"utf-8");
            }

        }catch (Exception e){
            e.printStackTrace();
        }


        return value;
    }

    @Override
    public String[] getParameterValues(String name) {
        String method = request.getMethod();
        String[] values = null;

        try {
            request.setCharacterEncoding("utf-8");

            values = request.getParameterValues(name);

            System.out.println("字符集到这里");

            if("get".equalsIgnoreCase(method)){
                int i=0;
                for (String str : values) {
                    values[i++] = new String(str.getBytes("iso-8859-1"),"utf-8");
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }


        return values;
    }
}
