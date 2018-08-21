package com.MyAllBlue.Model;

import java.util.Set;

public class State {
    private int id;
    private String statetype;
    private Set<Orders> orders;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStatetype() {
        return statetype;
    }

    public void setStatetype(String statetype) {
        this.statetype = statetype;
    }

    public Set<Orders> getOrders() {
        return orders;
    }

    public void setOrders(Set<Orders> orders) {
        this.orders = orders;
    }
}
