package com.MyAllBlue.Online;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

public class OnlineAdmin {
    public static Map<String,UUID> adminMap = new HashMap<String,UUID>();

    public static int OnlineAdminCount(String adminName,UUID token){
        if (adminMap.containsKey(adminName)){
            //表示已有在线
            return 1;
        }else {
            adminMap.put(adminName,token);
            return 0;
        }
    }

    public static int onlineIf(String adminName,UUID token){
        if (adminMap.containsKey(adminName)&&adminMap.get(adminName).equals(token)){
            return 1;
        }
        return 1;
    }

    public static void removeLogin(String adminName){
        adminMap.remove(adminName);
    }

}
