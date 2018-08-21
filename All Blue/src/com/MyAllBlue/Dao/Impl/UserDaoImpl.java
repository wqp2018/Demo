package com.MyAllBlue.Dao.Impl;

import com.MyAllBlue.Dao.UserDao;
import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.Role;
import com.MyAllBlue.Model.UserInfo;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class UserDaoImpl extends HibernateDaoSupport implements UserDao {


    @Override
    public UserInfo login(String username,String password) {
        String hql = "from UserInfo where username = ? and password = ?";
        List<UserInfo> list = (List<UserInfo>) this.getHibernateTemplate().find(hql,username,password);
        if (list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    /*
    *  获取用户信息
    * */
    @Override
    public UserInfo userInfo(String username) {
        String hql = "from UserInfo where username = ?";
        List<UserInfo> userInfo = (List<UserInfo>) this.getHibernateTemplate().find(hql,username);
        if (userInfo!=null&&userInfo.size()>0){
            return userInfo.get(0);
        }
        return null;
    }

    /*
    *  获取用户订单信息
    * */
    @Override
    public List<Orders_commods> orderInfo(String username) {
        String hql = "from Orders_commods r where r.userInfo.username = ?";
        /*Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");*/
        List<Orders_commods> orderInfo = (List<Orders_commods>) this.getHibernateTemplate().find(hql,username);
        if (orderInfo!=null&&orderInfo.size()>0){
            return orderInfo;
        }
        return null;
    }

    @Override
    public UserInfo checkPw(String username, String pw) {
        String hql = "from UserInfo where username = ? and password = ?";
        List<UserInfo> list = (List<UserInfo>) this.getHibernateTemplate().find(hql,username,pw);
        if (list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public void changePw(String username,String password) {
        String hql = "update UserInfo as u set u.password = ? where u.username = ?";
        this.getHibernateTemplate().bulkUpdate(hql,password,username);
    }

    @Override
    public void changeUserInfo(String username, String realname, String phone, String address) {
        String hql = "update UserInfo as u set u.realname = ?, u.phone = ?,u.address = ? where u.username = ?";
        this.getHibernateTemplate().bulkUpdate(hql,realname,phone,address,username);
    }

    @Override
    public String existOrNo(String username) {
        String hql = "from UserInfo where username = ?";
        List<UserInfo> lists = (List<UserInfo>) this.getHibernateTemplate().find(hql,username);
        if (lists!=null&&lists.size()>0){
            /*System.out.println(lists.get(0).getUsername());
            System.out.println("搜索的信息："+username);*/
            return "Y";
        }else {
            /*System.out.println("搜索的信息："+username);
            System.out.println("没有找到");*/
            return "N";
        }

    }

    @Override
    public void addUser(String username, String password, String address, String phone, String realname) {
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        userInfo.setPassword(password);
        userInfo.setAddress(address);
        userInfo.setPhone(phone);
        userInfo.setRealname(realname);

        Role role = new Role();
        role.setId(1);

        userInfo.setRole(role);

        this.getHibernateTemplate().save(userInfo);

        System.out.println(userInfo.getAddress() + "明知无人回顾");
    }
}
