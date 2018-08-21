package com.MyAllBlue.Service;

import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.UserInfo;

import java.util.List;

public interface UserService {

    UserInfo login(String username,String password);

    UserInfo userInfo(String username);

    List<Orders_commods> orderInfo(String username);

    UserInfo checkPw(String username, String pw);

    void changePw(String username,String password);

    void changUserInfo(String username, String realname, String phone, String address);

    String existOrNo(String username);

    void addUser(String username, String password, String address, String phone,String realname);
}
