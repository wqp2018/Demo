package com.MyAllBlue.Action;

import com.MyAllBlue.Model.*;
import com.MyAllBlue.Online.OnlineAdmin;
import com.MyAllBlue.Page.PageBean;
import com.MyAllBlue.Service.AdminService;
import com.MyAllBlue.Util.UploadImgUtil;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.*;

public class AdminAction extends ActionSupport implements ModelDriven<AdminInfo> {

    AdminInfo adminInfo = new AdminInfo();

    private int currentPage = 1;

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    private int commodType = 1;

    public void setCommodType(int commodType) {
        this.commodType = commodType;
    }

    @Override
    public AdminInfo getModel() {
        return adminInfo;
    }

    private AdminService adminService;

    public void setAdminService(AdminService adminService) {
        this.adminService = adminService;
    }

    private String searchName;

    public void setSearchName(String searchName) {
        this.searchName = searchName;
    }

    private int commodId;

    public void setCommodId(int commodId) {
        this.commodId = commodId;
    }

    private String commodName;

    public void setCommodName(String commodName) {
        this.commodName = commodName;
    }

    private int price;

    public void setPrice(int price) {
        this.price = price;
    }

    private int hascount;

    public void setHascount(int hascount) {
        this.hascount = hascount;
    }

    private int userId;

    public void setUserId(int userId) {
        this.userId = userId;
    }

    private String username;

    public void setUsername(String username) {
        this.username = username;
    }

    private Integer orderId;

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    private Integer commodTypeId;

    public void setCommodTypeId(Integer commodTypeId) {
        this.commodTypeId = commodTypeId;
    }

    private String commodTypeName;

    public void setCommodTypeName(String commodTypeName) {
        this.commodTypeName = commodTypeName;
    }

    //上传图片
    private File img;
    private String imgFileName;
    private MultipartFile file;

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public void setImg(File img) {
        this.img = img;
    }

    public void setImgFileName(String imgFileName) {
        this.imgFileName = imgFileName;
    }

    /*
                                    *  管理员登录
                                    * */
    public String login() throws Exception {
        String username = adminInfo.getAdminname();
        String password = adminInfo.getPassword();

        //检测是否已登录
        AdminInfo admin = adminService.loginCheck(username,password);

        if (admin!=null){
            UUID token = UUID.randomUUID();
            OnlineAdmin.OnlineAdminCount(admin.getAdminname(),token);

            //展示管理员信息
            ActionContext.getContext().getSession().put("adminName",username);

            //保存token信息
            ActionContext.getContext().getSession().put(username,token);

            showCommod();

            return "AdminPage";
        }
        return "backCall";
    }

    public String showCommodFunction() throws Exception {
        //获取管理员User
        String adminName = (String)ActionContext.getContext().getSession().get("adminName");

        //获取token
        if (ActionContext.getContext().getSession().containsKey(adminName)){
            UUID token = (UUID) ActionContext.getContext().getSession().get(adminName);

            //判断admin是否有效
            int isOk = OnlineAdmin.onlineIf(adminName,token);

            //1为有效，0为无效
            if (isOk == 1){
                showCommod();
                return "AdminPage";
            }
        }
        return "backCall";
    }

    //展示商品
    public void showCommod() throws Exception {
        //存分类名称list到值栈中
        List<Category> categories = goodTypeList();
        ActionContext.getContext().getValueStack().set("categories",categories);

        //pageBean
        PageBean<Commod> pageBean = adminService.findByType(currentPage,commodType);
        ActionContext.getContext().getValueStack().set("pageBeanCommod",pageBean);

        //存储搜索类型
        ActionContext.getContext().getValueStack().set("commodType",commodType);
    }

    //产品分类列表
    public List<Category> goodTypeList() throws Exception {
        List<Category> categories = adminService.getTypeList();
        return categories;
    }

    //产品列表
    public void commodMessage() throws Exception {
        List<Commod> commods = adminService.commodMessage();
        int count = adminService.commodCount(commodType);
    }

    //按名字查询货物
    public String searchCommod() throws Exception {
        String commodName = new String(searchName.getBytes("ISO-8859-1"),"UTF-8");
        PageBean<Commod> pageBean = adminService.searchByCommodName(currentPage,commodName);

        //存分类名称list到值栈中
        List<Category> categories = goodTypeList();
        ActionContext.getContext().getValueStack().set("categories",categories);

        //搜索的值
        ActionContext.getContext().getValueStack().set("commodName",commodName);

        ActionContext.getContext().getValueStack().set("pageBeanCommod",pageBean);

        //设置不为空，以便分页不冲突
        ActionContext.getContext().getValueStack().set("searchResult",1);

        return "AdminPage";
    }

    public String deleteCommod() throws Exception {
        adminService.deleteCommod(commodId);
        showCommod();
        return "AdminPage";
    }

    public String commodAjax() throws Exception {
        Commod commodMessage = adminService.getCommodById(commodId);

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("commodId",commodMessage.getId());
        map.put("commodName",commodMessage.getCommodname());
        map.put("commodPrice",commodMessage.getPrice());
        map.put("commodHascount",commodMessage.getHascount());
        map.put("pic",commodMessage.getPic());

        Gson gson = new Gson();
        String result = gson.toJson(map);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(result);

        return null;
    }

    //获取到商品的修改信息并修改

    public String updateCommod() throws Exception {
        int id = commodId;
        String updateName = commodName;
        int updatePrice = price;
        int updateHascount = hascount;

        String image = UploadImgUtil.upLoadImg(img,imgFileName);

        adminService.updateCommod(id,updateName,updatePrice,updateHascount,image);

        showCommod();

        return "AdminPage";
    }

    //添加商品

    public String addCommod() throws Exception {

        String image = UploadImgUtil.upLoadImg(img,imgFileName);

        adminService.addCommodMessage(commodName,image,price,hascount,commodTypeId);

        showCommod();

        return "AdminPage";
    }

    //注销登录
    public String adminLogout() throws Exception {
        String adminName = (String)ActionContext.getContext().getSession().get("adminName");
        ActionContext.getContext().getSession().remove("adminName");
        OnlineAdmin.removeLogin(adminName);

        return "backCall";
    }

    //展示用户列表

    public String showUserMessage() throws Exception {
        PageBean<UserInfo> pageBeanUserInfo = adminService.searchUserInfo(currentPage);

        //将PageBeanUserInfo存入值栈中
        ActionContext.getContext().getValueStack().set("pageBeanUserInfo",pageBeanUserInfo);

        return "UserManage";
    }

    /*
    *  封号处理
    * */

    public String banUser() throws Exception {
        adminService.banUser(userId);
        showUserMessage();
        return "UserManage";
    }

    /*
    *  解封账号
    * */

    public String openUser() throws Exception {
        adminService.openUser(userId);
        showUserMessage();
        return "UserManage";
    }

    /*
    *  查询用户
    * */

    public String searchUser() throws Exception {
        String user = new String(username.getBytes("ISO-8859-1"),"UTF-8");

        PageBean<UserInfo> pageBean = adminService.searchByUserName(currentPage,user);

        //搜索的值
        ActionContext.getContext().getValueStack().set("username",user);

        ActionContext.getContext().getValueStack().set("pageBeanUserInfo",pageBean);

        //设置不为空，以便分页不冲突
        ActionContext.getContext().getValueStack().set("searchResult",1);

        return "UserManage";
    }

    /*
    *  查询所有订单信息
    * */

    public String allOrder() throws Exception {
        PageBean<Orders_commods> pageBean = adminService.getAllOrder(currentPage);

        ActionContext.getContext().getValueStack().set("pageBean",pageBean);

        return "OrderMessage";
    }

    /*
    *  查询未处理订单
    * */

    public String noDoOrder() throws Exception {
        PageBean<Orders_commods> pageBean = adminService.noDoOrder(currentPage);

        ActionContext.getContext().getValueStack().set("pageBean",pageBean);

        //System.out.println(pageBean.getList().get(0).getCommod().getCommodname());

        ActionContext.getContext().getValueStack().set("searchResult","kk");

        return "OrderMessage";
    }

    /*
    *  按ID查询订单
    * */

    public String searchOrder() throws Exception {
        Orders_commods orders_commods = adminService.getOrderById(orderId);

        ActionContext.getContext().getValueStack().set("order",orders_commods);

        return "OrderMessage";
    }

    /*
    *  开始配送订单,并根据传回来的searchName设置查询结果
    *  no --- 返回所有订单结果
    *  has --- 返回未处理订单结果
    * */

    public String beginSend() throws Exception {
        adminService.beginSend(orderId);

        if (searchName.equals("no")){

            PageBean<Orders_commods> pageBean = adminService.getAllOrder(currentPage);

            ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        }else {

            PageBean<Orders_commods> pageBean = adminService.noDoOrder(currentPage);

            ActionContext.getContext().getValueStack().set("pageBean",pageBean);

            ActionContext.getContext().getValueStack().set("searchResult",1);
        }



        return "OrderMessage";
    }

    /*
    *  返回搜索订单Id页面
    * */
    public String beginSendById() throws Exception {
        adminService.beginSend(orderId);

        Orders_commods orders_commods = adminService.getOrderById(orderId);

        ActionContext.getContext().getValueStack().set("order",orders_commods);

        return "OrderMessage";
    }

    /*
    *  结束订单并
    *  返回搜索订单Id页面
    * */
    public String endOrderById() throws Exception {
        adminService.endOrderById(orderId);

        Orders_commods orders_commods = adminService.getOrderById(orderId);

        ActionContext.getContext().getValueStack().set("order",orders_commods);

        return "OrderMessage";
    }

    /*
    *  开始配送订单,并根据传回来的searchName设置查询结果
    *  no --- 返回所有订单结果
    *  has --- 返回未处理订单结果
    * */

    public String endOrder() throws Exception {
        adminService.endOrderById(orderId);

        if (searchName.equals("no")){

            PageBean<Orders_commods> pageBean = adminService.getAllOrder(currentPage);

            ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        }else {

            PageBean<Orders_commods> pageBean = adminService.noDoOrder(currentPage);

            ActionContext.getContext().getValueStack().set("pageBean",pageBean);

            ActionContext.getContext().getValueStack().set("searchResult",1);
        }

        return "OrderMessage";
    }

    /*
    *  通过AJAX上传图片
    * */

    public String uploadImageAjax() throws Exception {



        String image = UploadImgUtil.upLoadImg(img,imgFileName);

        List l = new ArrayList();
        l.add(image);

        Gson g = new Gson();
         String returnImg = g.toJson(l);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");

        response.getWriter().print(returnImg);

        return null;
    }


    public String toPanel() throws Exception {
        List<Category> categories = adminService.getAllType();


        ActionContext.getContext().getValueStack().set("type",categories);

        return "panel";
    }


    public String addCommodType() throws Exception {
        adminService.addCommodType(commodTypeName);

        List<Category> categories = adminService.getAllType();

        ActionContext.getContext().getValueStack().set("type",categories);

        return "panel";
    }
}
