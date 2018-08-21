package com.MyAllBlue.Service.Impl;

import com.MyAllBlue.Dao.UserDao;
import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.UserInfo;
import com.MyAllBlue.Service.UserService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class UserServiceImpl implements UserService {
    /*
    *  注入Dao
    * */
    private UserDao userDao;

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }

    @Override
    public UserInfo login(String username,String password) {
        return userDao.login(username,password);
    }

    /*
    *  获取用户个人信息
    * */
    @Override
    public UserInfo userInfo(String username) {
        UserInfo userInfo = userDao.userInfo(username);
        return userInfo;
    }

    /*
    *  获取用户的订单信息
    * */
    @Override
    public List<Orders_commods> orderInfo(String username) {
        List<Orders_commods> orderInfo = userDao.orderInfo(username);
        return orderInfo;
    }

    @Override
    public UserInfo checkPw(String username, String pw) {
        UserInfo userExist = userDao.checkPw(username,pw);
        return userExist;
    }

    @Override
    public void changePw(String username,String password) {
        userDao.changePw(username,password);
    }

    @Override
    public void changUserInfo(String username, String realname, String phone, String address) {
        userDao.changeUserInfo(username,realname,phone,address);
    }

    @Override
    public String existOrNo(String username) {
        String exist = userDao.existOrNo(username);
        return exist;
    }

    /*
    *  添加用户
    * */
    @Override
    public void addUser(String username, String password, String address, String phone,String realname) {
        userDao.addUser(username,password,address,phone,realname);
    }
}
