package com.MyAllBlue.Dao;

import com.MyAllBlue.Model.Category;
import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Discuss;
import com.MyAllBlue.Page.PageBean;

import java.util.List;

public interface GoodsDao {
    List<Commod> hotGoods();

    List<Category> goodTypeList();

    List<Commod> goodList(int id);

    int totalCommodCount(int id);

    List<Commod> findByPage(int begin, int maxSize,int id);

    int totalSearchCount(String commodname);

    List<Commod> searchName(int begin, int maxSize, String commodname);

    Commod commodMessage(int id);

    int getDiscussCount(int id);

    List<Discuss> getDiscuss(int begin, int maxSize, int id);
}
