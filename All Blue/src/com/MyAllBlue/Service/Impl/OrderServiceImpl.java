package com.MyAllBlue.Service.Impl;

import com.MyAllBlue.Dao.OrderDao;
import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.UserInfo;
import com.MyAllBlue.Service.OrderService;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Transactional
public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao;

    public void setOrderDao(OrderDao orderDao) {
        this.orderDao = orderDao;
    }

    /*
    *  搜索个人信息
    * */
    @Override
    public UserInfo userInfo(String username) {
        UserInfo userInfo = orderDao.userInfo(username);
        return userInfo;
    }

    /*
    *  搜索货物信息
    * */
    @Override
    public Commod commodInfo(int commodId) {
        Commod commod = orderDao.commodInfo(commodId);
        return commod;
    }

    /*
    *  保存订单信息
    * */
    @Override
    public void saveOrder(Orders_commods orders_commods) {
        orderDao.saveOrder(orders_commods);
    }

    @Override
    public Orders_commods getOrderMessage(int id) {
        return orderDao.getOrderMessage(id);
    }

    @Override
    public void addAssessMessage(int userID, int commodId, String usercomment) {
        //获取当前时间
        Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(date);

        orderDao.addAssessMessage(userID,commodId,usercomment,time);
    }

    @Override
    public UserInfo getUserInfo(Integer userID) {
        UserInfo userInfo = orderDao.getUserInfo(userID);
        return userInfo;
    }

    @Override
    public List<Orders_commods> orderInfo(Integer userID) {
        List<Orders_commods> orderInfo = orderDao.orderInfo(userID);
        return orderInfo;
    }

    @Override
    public void updateOrderAssessState(int id) {
        orderDao.updateOrderAssessState(id);
    }
}
