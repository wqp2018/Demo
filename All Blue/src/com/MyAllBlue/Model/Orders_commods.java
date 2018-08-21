package com.MyAllBlue.Model;

import java.util.Date;

public class Orders_commods {
    private int id;
    private Orders orders;
    private Commod commod;
    private Integer monovalen;   //单价
    private Integer countsize;   //数量
    private Integer totalprice;  //总价
    private UserInfo userInfo;
    private Date ordertime;
    private Integer usercomment;     //是否评论
    private State state;

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public State getState() {
        return state;
    }

    public void setState(State state) {
        this.state = state;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getMonovalen() {
        return monovalen;
    }

    public void setMonovalen(Integer monovalen) {
        this.monovalen = monovalen;
    }

    public Orders getOrders() {
        return orders;
    }

    public void setOrders(Orders orders) {
        this.orders = orders;
    }

    public Commod getCommod() {
        return commod;
    }

    public void setCommod(Commod commod) {
        this.commod = commod;
    }

    public Integer getCountsize() {
        return countsize;
    }

    public void setCountsize(Integer countsize) {
        this.countsize = countsize;
    }

    public Integer getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(Integer totalprice) {
        this.totalprice = totalprice;
    }

    public Integer getUsercomment() {
        return usercomment;
    }

    public void setUsercomment(Integer usercomment) {
        this.usercomment = usercomment;
    }
}
