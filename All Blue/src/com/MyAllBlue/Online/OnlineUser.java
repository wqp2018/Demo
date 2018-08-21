package com.MyAllBlue.Online;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class OnlineUser {
    public static Map<String,UUID> map = new HashMap<String,UUID>();

    //1代表逼下线，0代表第一次登陆
    public static int OnlineUser(String username,UUID token){
        if (map.containsKey(username)){
            //若已经登陆，逼下线，改变token
            return 1;
        }else {
            //若第一次登录，往map中存值
            map.put(username,token);
            //System.out.println("原先的token" + token);
            return 0;
        }
    }

    //强行登陆,加入新token
    public static void breakLogin(String username,UUID token){
        map.remove(username);
        //System.out.println("新token：" + newToken);
        map.put(username,token);
    }

    //移除map中已登录的信息
    public static void outLogin(String username){
        map.remove(username);
    }
}
