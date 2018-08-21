package com.MyAllBlue.Model;

import java.util.Set;

public class Orders {
    private int id;
    private Set<Orders_commods> orders_commods;
    private String orderNum;

    public String getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(String orderNum) {
        this.orderNum = orderNum;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Set<Orders_commods> getOrders_commods() {
        return orders_commods;
    }

    public void setOrders_commods(Set<Orders_commods> orders_commods) {
        this.orders_commods = orders_commods;
    }
}
