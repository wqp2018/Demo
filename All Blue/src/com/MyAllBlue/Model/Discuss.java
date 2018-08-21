package com.MyAllBlue.Model;

import java.util.Date;

public class Discuss {
    private int id;
    private String comment;
    private Date discusstime;
    private UserInfo userInfo;
    private Commod commod;
    private Orders orders;
    private Integer isDelete;

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getDiscusstime() {
        return discusstime;
    }

    public void setDiscusstime(Date discusstime) {
        this.discusstime = discusstime;
    }

    public UserInfo getUserInfo() {
        return userInfo;
    }

    public void setUserInfo(UserInfo userInfo) {
        this.userInfo = userInfo;
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
}
