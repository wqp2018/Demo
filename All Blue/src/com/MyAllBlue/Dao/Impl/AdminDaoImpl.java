package com.MyAllBlue.Dao.Impl;

import com.MyAllBlue.Dao.AdminDao;
import com.MyAllBlue.Model.*;
import com.MyAllBlue.Page.PageBean;
import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao {

    @Override
    public AdminInfo loginCheck(String username, String password) {
        String hql = "from AdminInfo where adminname = ? and  password = ?";
        List<AdminInfo> lists = (List<AdminInfo>) this.getHibernateTemplate().find(hql,username,password);
        if (lists!=null&&lists.size()>0){
            return lists.get(0);
        }
        return null;
    }

    @Override
    public List<Category> getTypeList() {
        String hql = "from Category";
        List<Category> lists = (List<Category>) this.getHibernateTemplate().find(hql);
        if (lists!=null&&lists.size()>0){
            return lists;
        }else{
            return null;
        }

    }

    @Override
    public List<Commod> commodMessage() {
        String hql = "from Commod ";
        List<Commod> commodList = (List<Commod>) this.getHibernateTemplate().find(hql);
        return commodList;
    }

    @Override
    public int commodCount(int commodType) {
        String hql = "select count(*) from Commod where category.id = ? and isDelete = 0";
        List<Long> count = (List<Long>) this.getHibernateTemplate().find(hql,commodType);
        return count.get(0).intValue();
    }

    @Override
    public List<Commod> findByType(int currentPage, int maxSize, int commodType) {
        String hql = "from Commod where category.id = ? and isDelete = 0";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,commodType);
        List<Commod> listReturn = new ArrayList<Commod>();
        if (list!=null&& list.size()>0){
            for (int i=(currentPage-1)*3;i<(currentPage-1)*3+maxSize;i++){
                listReturn.add(list.get(i));
                if (i==list.size()-1)
                    break;
            }
        }
        return listReturn;
    }

    /*
    *  按名称查询货物
    * */
    @Override
    public List<Commod> searchByCommodName(int currentPage,int maxSize,String commodName) {
        String hql = "from Commod where commodname like ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,"%"+commodName+"%");
        List<Commod> listReturn = new ArrayList<Commod>();
        if (list!=null&&list.size()>0){
            for (int i=(currentPage-1)*3;i<(currentPage-1)*3+maxSize;i++){
                listReturn.add(list.get(i));
                if (i==list.size()-1)
                    break;
            }
        }
        return listReturn;
    }

    @Override
    public void deleteCommod(int commodId) {
        String hql = "update Commod set isDelete = ? where id = ?";
        System.out.println("操作" + commodId);
        //0为存在，1为已删除
        this.getHibernateTemplate().bulkUpdate(hql,1,commodId);
    }

    @Override
    public int countOfSearchName(String commodName) {
        String hql = "select count(*) from Commod where commodname like ?";

        List<Long> count = (List<Long>) this.getHibernateTemplate().find(hql,"%"+commodName+"%");

        if (count!=null&&count.size()>0){
            return count.get(0).intValue();
        }

        return 0;
    }

    @Override
    public Commod getCommodById(int commodId) {
        String hql = "from Commod where id = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,commodId);
        if (list!=null&&list.size()>0){
            return list.get(0);
        }
        return null;
    }

    @Override
    public void updateCommod(int id, String updateName, int updatePrice, int updateHascount,String image) {
        String hql = "update Commod as c set c.commodname = ?,c.price = ?,c.hascount = ?,c.pic = ? where c.id = ?";
        this.getHibernateTemplate().bulkUpdate(hql,updateName,updatePrice,updateHascount,image,id);
    }

    /*
    *  返回用户总数量
    * */
    @Override
    public int countOfUser() {
        String hql = "select count(*) from UserInfo ";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql);
        if (list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }

    /*
    *  获取用户结果集
    * */
    @Override
    public List<UserInfo> getUserInfoList(int currentPage,int maxSize) {
        String hql = "from UserInfo ";
        List<UserInfo> list = (List<UserInfo>) this.getHibernateTemplate().find(hql);
        List<UserInfo> listReturn = new ArrayList<UserInfo>();
        if (list!=null&&list.size()>0){
            for (int i=(currentPage-1)*3;i<(currentPage-1)*3+maxSize;i++){
                listReturn.add(list.get(i));
                if (i==list.size()-1)
                    break;
            }
        }
        return listReturn;
    }

    @Override
    public void banUser(int userId) {
        String hql = "update UserInfo as u set u.ban = ? where u.id = ?";
        //0为正常，1为封号
        this.getHibernateTemplate().bulkUpdate(hql,1,userId);
    }

    @Override
    public void openUser(int userId) {
        String hql = "update UserInfo as u set u.ban = ? where u.id = ?";
        //0为正常，1为封号
        this.getHibernateTemplate().bulkUpdate(hql,0,userId);
    }

    @Override
    public int countOfSearchUserName(String user) {
        String hql = "select count(*) from UserInfo where username like ?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,"%"+user+"%");

        if (list!=null&&list.size()>0){
            return list.get(0).intValue();
        }

        return 0;
    }

    @Override
    public List<UserInfo> searchByUserName(int currentPage, int maxSize, String user) {
        String hql = "from UserInfo as u where u.username like ?";
        List<UserInfo> list = (List<UserInfo>) this.getHibernateTemplate().find(hql,"%"+user+"%");

        List<UserInfo> listReturn = new ArrayList<UserInfo>();
        if (list!=null&&list.size()>0){
            for (int i=(currentPage-1)*3;i<(currentPage-1)*3+maxSize;i++){
                listReturn.add(list.get(i));
                if (i==list.size()-1)
                    break;
            }
        }
        return listReturn;
    }

    /*
    *  返回订单总数量
    **/
    @Override
    public int getCountOfOrder() {
        String hql = "select count(*) from Orders_commods";
        List<Long> count = (List<Long>) this.getHibernateTemplate().find(hql);

        if (count!=null&&count.size()>0){
            return count.get(0).intValue();
        }

        return 0;
    }

    /*
    *  返回订单详细信息
    * */

    @Override
    public List<Orders_commods> getAllOrder(int currentPage,int maxSize) {
        String hql = "from Orders_commods";
        List<Orders_commods> list = (List<Orders_commods>) this.getHibernateTemplate().find(hql);

        List<Orders_commods> listReturn = new ArrayList<Orders_commods>();
        if (list!=null&&list.size()>0){
            for (int i=(currentPage-1)*5;i<(currentPage-1)*5+maxSize;i++){
                listReturn.add(list.get(i));
                if (i==list.size()-1)
                    break;
            }
        }
        return listReturn;
    }

    @Override
    public int getCountOfNoDoOrder() {
        String hql = "select count(*) from Orders_commods o where o.state.id = ?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,2);

        if (list!=null&&list.size()>0){
            return list.get(0).intValue();
        }

        return 0;
    }

    @Override
    public List<Orders_commods> getNoDoOrder(int currentPage, int maxSize) {
        String hql = "from Orders_commods where state.id = ?";
        List<Orders_commods> list = (List<Orders_commods>) this.getHibernateTemplate().find(hql,2);

        List<Orders_commods> listReturn = new ArrayList<Orders_commods>();
        if (list!=null&&list.size()>0){
            for (int i=(currentPage-1)*5;i<(currentPage-1)*5+maxSize;i++){
                listReturn.add(list.get(i));
                if (i==list.size()-1)
                    break;
            }
        }

        return listReturn;
    }

    @Override
    public Orders_commods searchOrderById(Integer orderId) {
        String hql = "from  Orders_commods where id = ?";
        List<Orders_commods> list = (List<Orders_commods>) this.getHibernateTemplate().find(hql,orderId);

        if (list!=null&&list.size()>0){
            return list.get(0);
        }

        return null;
    }

    @Override
    public void beginSend(Integer orderId) {
        String hql = "update Orders_commods o set o.state.id = ? where o.id = ?";
        this.getHibernateTemplate().bulkUpdate(hql,1,orderId);
    }

    @Override
    public void endOrderById(Integer orderId) {
        String hql = "update Orders_commods o set o.state.id = ? where o.id = ?";
        this.getHibernateTemplate().bulkUpdate(hql,3,orderId);
    }

    @Override
    public List<Category> getAllType() {
        String hql = "from Category ";
        List<Category> list = (List<Category>) this.getHibernateTemplate().find(hql);

        return list;
    }

    @Override
    public void addCommodMessage(String commodName, String image, int price, int hascount, Integer commodTypeId) {
        Commod c = new Commod();
        Category category = new Category();
        category.setId(commodTypeId);

        c.setCommodname(commodName);
        c.setPic(image);
        c.setPrice(price);
        c.setHascount(hascount);
        c.setCategory(category);

        c.setIsDelete(0);
        c.setSalecount(0);

        this.getHibernateTemplate().save(c);
    }

    @Override
    public void addCommodType(String commodTypeName) {
        Category category = new Category();
        category.setTypename(commodTypeName);

        this.getHibernateTemplate().save(category);
    }


}
