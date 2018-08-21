package com.MyAllBlue.Service.Impl;

import com.MyAllBlue.Dao.AdminDao;
import com.MyAllBlue.Model.*;
import com.MyAllBlue.Page.PageBean;
import com.MyAllBlue.Service.AdminService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class AdminServiceImpl implements AdminService {
    private AdminDao adminDao;

    public void setAdminDao(AdminDao adminDao) {
        this.adminDao = adminDao;
    }

    @Override
    public AdminInfo loginCheck(String username, String password) {
        AdminInfo admin = adminDao.loginCheck(username,password);
        return admin;
    }

    @Override
    public List<Category> getTypeList() {
        List<Category> lists = adminDao.getTypeList();
        return lists;
    }

    @Override
    public List<Commod> commodMessage() {
        List<Commod> list = adminDao.commodMessage();
        return list;
    }

    @Override
    public int commodCount(int commodType) {
        int count = adminDao.commodCount(commodType);
        return count;
    }

    @Override
    public PageBean<Commod> findByType(int currentPage, int commodType) {
        PageBean<Commod> pageBean = new PageBean<Commod>();
        //设置当前页数
        pageBean.setCurrentPage(currentPage);

        //设置每页最大数
        int maxSize = 3;
        pageBean.setMaxSize(maxSize);

        //设置获取到的货物列表
        List<Commod> list = adminDao.findByType(currentPage,maxSize,commodType);
        pageBean.setList(list);

        //设置货物总数量
        int totalSize = commodCount(commodType);
        pageBean.setTotalSize(totalSize);

        //设置最大页数
        Double totalPageSize = Math.ceil((double) totalSize/maxSize);
        pageBean.setTotalPage(totalPageSize.intValue());

        return pageBean;
    }

    @Override
    public PageBean<Commod> searchByCommodName(int currentPage,String commodName) {
        PageBean<Commod> pageBean = new PageBean<Commod>();

        //设置当前页数
        pageBean.setCurrentPage(currentPage);

        //设置每页最大值
        int maxSize = 3;
        pageBean.setMaxSize(maxSize);

        //获取货物总数量
        int totalSize = adminDao.countOfSearchName(commodName);
        pageBean.setTotalSize(totalSize);

        //设置总页数
        Double totalPageSize = Math.ceil((double) totalSize/maxSize);
        pageBean.setTotalPage(totalPageSize.intValue());

        //查询到的结果列表
        List<Commod> list = adminDao.searchByCommodName(currentPage,maxSize,commodName);

        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public void deleteCommod(int commodId) {
        adminDao.deleteCommod(commodId);
    }

    @Override
    public Commod getCommodById(int commodId) {
        Commod commod = adminDao.getCommodById(commodId);
        return commod;
    }

    @Override
    public void updateCommod(int id, String updateName, int updatePrice, int updateHascount,String image) {
        adminDao.updateCommod(id,updateName,updatePrice,updateHascount,image);
    }

    @Override
    public PageBean<UserInfo> searchUserInfo(int currentPage) {
        PageBean<UserInfo> pageBean = new PageBean<UserInfo>();

        pageBean.setCurrentPage(currentPage);

        //设置每页最大数
        int maxSize = 3;
        pageBean.setMaxSize(maxSize);

        //获取用户总数量
        int totalSize = adminDao.countOfUser();
        pageBean.setTotalSize(totalSize);

        //设置总页数
        Double totalPageSize = Math.ceil((double) totalSize/maxSize);
        pageBean.setTotalPage(totalPageSize.intValue());

        //查询到的用户结果集
        List<UserInfo> list = adminDao.getUserInfoList(currentPage,maxSize);
        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public void banUser(int userId) {
        adminDao.banUser(userId);
    }

    @Override
    public void openUser(int userId) {
        adminDao.openUser(userId);
    }

    @Override
    public PageBean<UserInfo> searchByUserName(int currentPage, String user) {
        PageBean<UserInfo> pageBean = new PageBean<UserInfo>();

        //设置当前页数
        pageBean.setCurrentPage(currentPage);

        //设置每页最大值
        int maxSize = 3;
        pageBean.setMaxSize(maxSize);

        //获取按用户名查询到的总数量
        int totalSize = adminDao.countOfSearchUserName(user);
        pageBean.setTotalSize(totalSize);

        //设置总页数
        Double totalPageSize = Math.ceil((double) totalSize/maxSize);
        pageBean.setTotalPage(totalPageSize.intValue());

        //查询到的结果列表
        List<UserInfo> list = adminDao.searchByUserName(currentPage,maxSize,user);

        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public PageBean<Orders_commods> getAllOrder(int currentPage) {
        PageBean<Orders_commods> pageBean = new PageBean<Orders_commods>();

        //设置当前页
        pageBean.setCurrentPage(currentPage);

        //设置每页最大值
        int maxSize = 5;

        //查询到的订单总数量
        int totalSize = adminDao.getCountOfOrder();
        pageBean.setTotalSize(totalSize);

        //设置总页数
        Double totalPageSize = Math.ceil((double) totalSize/maxSize);
        pageBean.setTotalPage(totalPageSize.intValue());

        //查询到的结果列表
        List<Orders_commods> list = adminDao.getAllOrder(currentPage,maxSize);

        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public PageBean<Orders_commods> noDoOrder(int currentPage) {
        PageBean<Orders_commods> pageBean = new PageBean<Orders_commods>();

        //设置当前页
        pageBean.setCurrentPage(currentPage);

        //设置每页最大值
        int maxSize = 5;

        //查询到的订单总数量
        int totalSize = adminDao.getCountOfNoDoOrder();
        pageBean.setTotalSize(totalSize);

        //设置总页数
        Double totalPageSize = Math.ceil((double) totalSize/maxSize);
        pageBean.setTotalPage(totalPageSize.intValue());

        //查询到的结果列表
        List<Orders_commods> list = adminDao.getNoDoOrder(currentPage,maxSize);
        pageBean.setList(list);

        return pageBean;
    }

    @Override
    public Orders_commods getOrderById(Integer orderId) {
        return adminDao.searchOrderById(orderId);
    }

    @Override
    public void beginSend(Integer orderId) {

        adminDao.beginSend(orderId);
    }

    @Override
    public void endOrderById(Integer orderId) {
        adminDao.endOrderById(orderId);
    }

    @Override
    public List<Category> getAllType() {
        return adminDao.getAllType();
    }

    @Override
    public void addCommodMessage(String commodName, String image, int price, int hascount, Integer commodTypeId) {
        adminDao.addCommodMessage(commodName,image,price,hascount,commodTypeId);
    }

    @Override
    public void addCommodType(String commodTypeName) {
        adminDao.addCommodType(commodTypeName);
    }
}
