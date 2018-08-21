package com.MyAllBlue.Model;

import java.util.Set;

public class Role {
    private int id;
    private int rolelevel;
    private String roledescribe;
    private Set<UserInfo> userInfos;
    private Set<AdminInfo> adminInfos;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRolelevel() {
        return rolelevel;
    }

    public void setRolelevel(int rolelevel) {
        this.rolelevel = rolelevel;
    }

    public String getRoledescribe() {
        return roledescribe;
    }

    public void setRoledescribe(String roledescribe) {
        this.roledescribe = roledescribe;
    }

    public Set<UserInfo> getUserInfos() {
        return userInfos;
    }

    public void setUserInfos(Set<UserInfo> userInfos) {
        this.userInfos = userInfos;
    }

    public Set<AdminInfo> getAdminInfos() {
        return adminInfos;
    }

    public void setAdminInfos(Set<AdminInfo> adminInfos) {
        this.adminInfos = adminInfos;
    }
}
