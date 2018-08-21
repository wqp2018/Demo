package com.MyAllBlue.Model;

import java.util.Set;

public class Commod {
    private int id;
    private String pic;
    private String commodname;
    private Set<Discuss> discuss;
    private Integer price;
    private Integer salecount;
    private Integer hascount;
    private Integer IsDelete;
    private Category category;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }

    public String getCommodname() {
        return commodname;
    }

    public void setCommodname(String commodname) {
        this.commodname = commodname;
    }

    public Set<Discuss> getDiscuss() {
        return discuss;
    }

    public void setDiscuss(Set<Discuss> discuss) {
        this.discuss = discuss;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getSalecount() {
        return salecount;
    }

    public void setSalecount(Integer salecount) {
        this.salecount = salecount;
    }

    public Integer getHascount() {
        return hascount;
    }

    public Integer getIsDelete() {
        return IsDelete;
    }

    public void setIsDelete(Integer isDelete) {
        IsDelete = isDelete;
    }

    public void setHascount(Integer hascount) {
        this.hascount = hascount;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
}
