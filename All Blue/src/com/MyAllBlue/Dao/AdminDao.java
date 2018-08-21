package com.MyAllBlue.Dao;

import com.MyAllBlue.Model.*;
import com.MyAllBlue.Page.PageBean;

import java.util.List;

public interface AdminDao {
    AdminInfo loginCheck(String username, String password);

    List<Category> getTypeList();

    List<Commod> commodMessage();

    int commodCount(int commodType);

    List<Commod> findByType(int currentPage, int maxSize, int commodType);

    List<Commod> searchByCommodName(int currentPage,int maxSize,String commodName);

    void deleteCommod(int commodId);

    int countOfSearchName(String commodName);

    Commod getCommodById(int commodId);

    void updateCommod(int id, String updateName, int updatePrice, int updateHascount,String image);

    int countOfUser();

    List<UserInfo> getUserInfoList(int currentPage,int maxSize);

    void banUser(int userId);

    void openUser(int userId);

    int countOfSearchUserName(String user);

    List<UserInfo> searchByUserName(int currentPage, int maxSize, String user);

    int getCountOfOrder();

    List<Orders_commods> getAllOrder(int currentPage,int maxSize);

    int getCountOfNoDoOrder();

    List<Orders_commods> getNoDoOrder(int currentPage, int maxSize);

    Orders_commods searchOrderById(Integer orderId);

    void beginSend(Integer orderId);

    void endOrderById(Integer orderId);

    List<Category> getAllType();

    void addCommodMessage(String commodName, String image, int price, int hascount, Integer commodTypeId);

    void addCommodType(String commodTypeName);
}
