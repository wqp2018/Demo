package com.MyAllBlue.Service;

import com.MyAllBlue.Model.Category;
import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Discuss;
import com.MyAllBlue.Page.PageBean;

import java.util.List;

public interface GoodsService {
    List<Commod> hotGoods();

    List<Category> goodTypeList();

    List<Commod> goodList(int id);

    PageBean<Commod> findByPage(int currentPage, int id);

    PageBean<Commod> searchByName(int currentPage, String commodname);

    Commod commodMessage(int id);

    PageBean<Discuss> getDiscuss(int currentPage, int id);
}
