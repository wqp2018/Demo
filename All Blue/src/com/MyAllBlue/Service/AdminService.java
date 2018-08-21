package com.MyAllBlue.Service;

import com.MyAllBlue.Model.*;
import com.MyAllBlue.Page.PageBean;

import java.util.List;

public interface AdminService {
    AdminInfo loginCheck(String username, String password);

    //获取产品分类信息
    List<Category> getTypeList();

    List<Commod> commodMessage();

    int commodCount(int commodType);

    PageBean<Commod> findByType(int currentPage, int commodId);

    PageBean<Commod> searchByCommodName(int currentPage,String commodName);

    void deleteCommod(int commodId);

    Commod getCommodById(int commodId);

    void updateCommod(int id, String updateName, int updatePrice, int updateHascount,String image);

    PageBean<UserInfo> searchUserInfo(int currentPage);

    void banUser(int userId);

    void openUser(int userId);

    PageBean<UserInfo> searchByUserName(int currentPage, String user);

    PageBean<Orders_commods> getAllOrder(int currentPage);

    PageBean<Orders_commods> noDoOrder(int currentPage);

    Orders_commods getOrderById(Integer orderId);

    void beginSend(Integer orderId);

    void endOrderById(Integer orderId);

    List<Category> getAllType();

    void addCommodMessage(String commodName, String image, int price, int hascount, Integer commodTypeId);

    void addCommodType(String commodTypeName);
}
