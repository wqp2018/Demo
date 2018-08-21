package com.MyAllBlue.Model;

import java.util.Set;

/*
*  货物类型
* */
public class Category {
    private int id;
    private String typename;
    private Set<Commod> commods;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public Set<Commod> getCommods() {
        return commods;
    }

    public void setCommods(Set<Commod> commods) {
        this.commods = commods;
    }
}
