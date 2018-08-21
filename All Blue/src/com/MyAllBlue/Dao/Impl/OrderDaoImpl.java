package com.MyAllBlue.Dao.Impl;

import com.MyAllBlue.Dao.OrderDao;
import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Discuss;
import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.UserInfo;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class OrderDaoImpl extends HibernateDaoSupport implements OrderDao{
    @Override
    public UserInfo userInfo(String username) {
        String hql = "from UserInfo where username = ?";
        List<UserInfo> listUser = (List<UserInfo>) this.getHibernateTemplate().find(hql,username);
        if (listUser!=null){
            return listUser.get(0);
        }
        return null;
    }

    @Override
    public Commod commodInfo(int commodId) {
        String hql = "from Commod where id = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,commodId);
        if (list!=null){
            return list.get(0);
        }
        return null;
    }

    /*
    *  保存订单信息
    * */
    @Override
    public void saveOrder(Orders_commods orders_commods) {
        int cid = orders_commods.getCommod().getId();
        int count = orders_commods.getCountsize();

        //查询该货物拥有的数量
        int countHave = countOfCommod(cid);
        //购买后货物应有的数量
        int countBack = countHave - count;

        //查询该货物的销量
        int saleHave = countOfSale(cid);
        //购买后货物应有的销量
        int saleBack = saleHave + count;



        //修改货物的销量与存数
        String hql = "update Commod as c set c.hascount = ? , c.salecount = ? where c.id = ?";
        this.getHibernateTemplate().bulkUpdate(hql,countBack,saleBack,cid);

        //生成订单信息
        this.getHibernateTemplate().save(orders_commods);
    }

    @Override
    public Orders_commods getOrderMessage(int id) {
        String hql= "from Orders_commods where id = ?";
        List<Orders_commods> list = (List<Orders_commods>) this.getHibernateTemplate().find(hql,id);
        if (list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    /*
    *  添加评论
    * */
    @Override
    public void addAssessMessage(int userID, int commodId, String usercomment, String time) {
        Discuss discuss = new Discuss();
        UserInfo userInfo = new UserInfo();
        Commod commod = new Commod();

        userInfo.setId(userID);
        commod.setId(commodId);
        discuss.setComment(usercomment);
        discuss.setUserInfo(userInfo);
        discuss.setCommod(commod);


        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = sdf.parse(time);
            discuss.setDiscusstime(date);
        }catch (Exception e){
            e.printStackTrace();
        }

        this.getHibernateTemplate().save(discuss);

    }

    @Override
    public UserInfo getUserInfo(Integer userID) {
        String hql = "from UserInfo where id = ?";
        List<UserInfo> userInfo = (List<UserInfo>) this.getHibernateTemplate().find(hql,userID);
        if (userInfo!=null&&userInfo.size()>0){
            return userInfo.get(0);
        }
        return null;
    }

    @Override
    public List<Orders_commods> orderInfo(Integer userID) {
        String hql = "from Orders_commods r where r.userInfo.id = ?";
        /*Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");*/
        List<Orders_commods> orderInfo = (List<Orders_commods>) this.getHibernateTemplate().find(hql,userID.intValue());
        if (orderInfo!=null&&orderInfo.size()>0){
            System.out.println(orderInfo.get(0).getOrdertime());
            return orderInfo;
        }
        return null;
    }

    @Override
    public void updateOrderAssessState(int id) {
        String hql = "update Orders_commods as o set o.usercomment = ? where o.id = ?";
        this.getHibernateTemplate().bulkUpdate(hql,1,id);
    }

    //查询货物的数量
    public int countOfCommod(int cid){
        String hql = "from Commod where id = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,cid);
        if (list!=null&&list.size()>0){
            return list.get(0).getHascount();
        }
        return 0;
    }

    //查询货物的销量
    public int countOfSale(int cid){
        String hql = "from Commod where id = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,cid);
        if (list!=null&&list.size()>0){
            return list.get(0).getSalecount();
        }
        return 0;
    }
}
