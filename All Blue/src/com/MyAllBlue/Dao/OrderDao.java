package com.MyAllBlue.Dao;

import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.UserInfo;

import java.util.List;

public interface OrderDao {
    //搜索个人信息
    UserInfo userInfo(String username);
    //搜索货物信息
    Commod commodInfo(int commodId);

    void saveOrder(Orders_commods orders_commods);

    Orders_commods getOrderMessage(int id);

    void addAssessMessage(int userID, int commodId, String usercomment, String time);

    UserInfo getUserInfo(Integer userID);

    List<Orders_commods> orderInfo(Integer userID);

    void updateOrderAssessState(int id);
}
