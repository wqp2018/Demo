package com.MyAllBlue.Service;

import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.UserInfo;

import java.util.List;

public interface OrderService {
    //搜索个人信息
    UserInfo userInfo(String commodId);
    //搜索货物信息
    Commod commodInfo(int commodId);

    void saveOrder(Orders_commods orders_commods);

    Orders_commods getOrderMessage(int id);

    void addAssessMessage(int userID, int commodId, String usercomment);

    UserInfo getUserInfo(Integer userID);

    List<Orders_commods> orderInfo(Integer userID);

    void updateOrderAssessState(int id);
}
