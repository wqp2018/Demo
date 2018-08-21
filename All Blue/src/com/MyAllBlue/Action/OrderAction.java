package com.MyAllBlue.Action;

import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.State;
import com.MyAllBlue.Model.UserInfo;
import com.MyAllBlue.Service.OrderService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;

public class OrderAction extends ActionSupport implements ModelDriven<Orders_commods> {
    private OrderService orderService;
    Orders_commods orders_commods = new Orders_commods();
    private Integer commodId;
    private String username;
    private Integer userID;
    private String userCommentArea;

    public String getUserCommentArea() {
        return userCommentArea;
    }

    public void setUserCommentArea(String userCommentArea) {
        this.userCommentArea = userCommentArea;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setCommodId(int commodId) {
        this.commodId = commodId;
    }

    public void setOrderService(OrderService orderService) {
        this.orderService = orderService;
    }

    @Override
    public Orders_commods getModel() {
        return orders_commods;
    }

    /*
    *  生成订单信息
    * */
    public String orderMessage() throws Exception {
        //按username搜索个人信息
        UserInfo userInfo = orderService.userInfo(username);
        //按commodId搜索货物信息
        Commod commod = orderService.commodInfo(commodId);

        ActionContext.getContext().getValueStack().set("userInfo",userInfo);
        ActionContext.getContext().getValueStack().set("commod",commod);

        return "orderInfo";
    }

    /*
    *  获取提交到达的订单信息
    * */

    public String subOrder() throws Exception {
        //按username搜索个人信息
        UserInfo userInfo = orderService.userInfo(username);
        //按commodId搜索货物信息
        Commod commod = orderService.commodInfo(commodId);
        //获取当前时间
        Date date = new Date();
        //时间格式处理
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
        String str = sdf.format(date);
        Date fDate = sdf.parse(str);
        orders_commods.setOrdertime(fDate);
        //设置订单状态，1为已处理，2为未处理
        State s = new State();
        s.setId(2);
        orders_commods.setState(s);
        //存储用户信息
        orders_commods.setUserInfo(userInfo);
        //存储货物信息
        orders_commods.setCommod(commod);
        orders_commods.setUsercomment(0);

        //调用service生成订单
        orderService.saveOrder(orders_commods);
        return "orderSuccess";
    }

    //ajax展示订单信息并为评论表单提交提供commod信息

    public String getOrderMessage() throws Exception {
        Orders_commods list = orderService.getOrderMessage(orders_commods.getId());

        List returnList = new ArrayList();

        //货物名称，购买总数量，用户ID，
        returnList.add(list.getCommod().getCommodname());
        returnList.add(list.getCountsize());
        returnList.add(list.getUserInfo().getId());
        returnList.add(list.getCommod().getId());
        returnList.add(list.getId());

        Gson gson = new Gson();

        String result = gson.toJson(returnList);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("UTF-8");

        response.getWriter().print(result);

        return null;
    }

    /*
    *  生成订单并存入数据库中
    * */

    public String assessOrderEnd() throws Exception {

        orderService.addAssessMessage(userID,commodId,userCommentArea);

        //修改改订单的评价状态为已评价
        orderService.updateOrderAssessState(orders_commods.getId());

        //获取用户个人信息
        UserInfo myInfo = orderService.getUserInfo(userID);
        //获取用户订单信息
        List<Orders_commods> orderInfo = orderService.orderInfo(userID);

        ActionContext.getContext().getValueStack().set("myInfo",myInfo);
        ActionContext.getContext().getValueStack().set("orderInfo",orderInfo);

        ActionContext.getContext().getValueStack().set("orderReturn",1);



        return "assessSuccess";
    }
}