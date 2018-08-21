package com.MyAllBlue.Action;

import com.MyAllBlue.Model.Orders_commods;
import com.MyAllBlue.Model.UserInfo;
import com.MyAllBlue.Online.OnlineUser;
import com.MyAllBlue.Service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.List;
import java.util.Random;
import java.util.UUID;

public class UserAction extends ActionSupport implements ModelDriven<UserInfo> {
    /*
    *  注入service服务
    * */
    private UserService userService;

    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    /*
    *  判断是否重登陆
    * */
    private int k;

    private String loginValidate;

    public void setLoginValidate(String loginValidate) {
        this.loginValidate = loginValidate;
    }

    /*
    * 模型
    * */
    private UserInfo userInfo = new UserInfo();
    @Override
    public UserInfo getModel() {
        return userInfo;
    }

    /*
    *  登陆
    * */
    public String login() throws Exception {
        //判断是否存在session，有，进入，无，返回错误
        String username = (String) ActionContext.getContext().getSession().get("username");

        if(username!=null){
            return "login";
        }else {
            addFieldError("loginError","用户名或密码失败");
            return "error";
        }
    }

    /*
    *  强行登陆
    * */
    public String breakLogin() throws Exception {
        //二次登陆之强行登陆
        UUID token = UUID.randomUUID();
        //存储登录信息
        ActionContext.getContext().getSession().put(userInfo.getUsername(),token);
        ActionContext.getContext().getSession().put("username",userInfo.getUsername());
        OnlineUser.breakLogin(userInfo.getUsername(),token);
        return "breakLogin";
    }

    /*
    *  第一次登陆处理
    * */
    public void firstLogin(HttpServletResponse response,UUID token) throws IOException {
        //存储登录信息
        ActionContext.getContext().getSession().put(userInfo.getUsername(),token);
        ActionContext.getContext().getSession().put("username",userInfo.getUsername());
        //返回给页面k值，0
        response.getWriter().print(k);
    }

    /*
    *  已经登陆处理
    * */
    public void hasBeenLogin(HttpServletResponse response) throws IOException {
        //返回给页面k值，1
        response.getWriter().print(k);
    }

    /*
    *  生成验证码
    * */
    public String loginValidate() throws Exception {
        int width = 68;
        int height = 22;
        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);

        HttpServletResponse response = ServletActionContext.getResponse();

        Graphics2D g = image.createGraphics();

        Random r = new Random();

        //画板背景颜色
        Color c = new Color(r.nextInt(255),r.nextInt(255),r.nextInt(255));
        g.setColor(c);
        g.fillRect(0,0,width,height);
        //字颜色
        g.setColor(Color.WHITE);
        g.setFont(new Font("宋体",Font.ITALIC,18));

        String stb = new String();

        String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

        for (int i = 0 ; i < 4 ; i++){
            int num = r.nextInt(str.length());
            String k = str.substring(num,num+1);
            g.drawString(k,i*14+5,r.nextInt(5)+14);
            stb += k;
        }

        g.dispose();

        //loginValidate 验证码
        ActionContext.getContext().getSession().put("loginValidate",stb);

        ImageIO.write(image,"png",response.getOutputStream());

        return null;
    }


    /*
    *  登陆ajax判定
    * */
    public String loginAjax() throws Exception {

        UserInfo u = userService.login(userInfo.getUsername(),userInfo.getPassword());
        HttpServletResponse response = ServletActionContext.getResponse();
        if (u!=null){
            //1代表逼下线，0代表第一次登陆
            UUID token = UUID.randomUUID();
            k = OnlineUser.OnlineUser(userInfo.getUsername(),token);
            if (k==0){
                //第一次登陆
                firstLogin(response,token);
            }else {
                //已经登陆
                hasBeenLogin(response);
            }
        }else {
            addFieldError("loginError","用户名或密码错误");
        }
        return null;
    }

    /*
    *  检验验证码
    * */
    public String loginValidateAjax() throws Exception {
        String sessionValidate = (String) ActionContext.getContext().getSession().get("loginValidate");
        HttpServletResponse response = ServletActionContext.getResponse();

        //比较验证码
        if (sessionValidate != null){
            if (loginValidate.toLowerCase().equals(sessionValidate.toLowerCase())){
                response.getWriter().print("true");
                return null;
            }
        }
        response.getWriter().print("false");
        return null;
    }

    /*
    *  注销系统
    * */
    public String outLogin() throws Exception {
        String username = (String) ActionContext.getContext().getSession().get("username");
        //移除已登录信息
        OnlineUser.outLogin(username);
        ActionContext.getContext().getSession().clear();

        return "outLogin";
    }

    /*
    *  个人信息
    * */

    public String MyInfo() throws Exception {

        if (checkUserChange(userInfo.getUsername())){
            //获取用户个人信息
            UserInfo myInfo = userService.userInfo(userInfo.getUsername());
            //获取用户订单信息
            List<Orders_commods> orderInfo = userService.orderInfo(userInfo.getUsername());

            ActionContext.getContext().getValueStack().set("myInfo",myInfo);
            ActionContext.getContext().getValueStack().set("orderInfo",orderInfo);

            return "myInfo";
        }

        return "usernameError";
    }

    /*
    *  跳转到修改个人信息页面
    * */

    public String toUpdate() throws Exception {

        if (checkUserChange(userInfo.getUsername())){
            UserInfo myInfo = userService.userInfo(userInfo.getUsername());
            ActionContext.getContext().getValueStack().set("myInfo",myInfo);

            return "toUpdate";
        }

        return "usernameError";
    }

    /*
    *  检查修改者的密码是否正确
    * */
    public String checkPw() throws Exception {
        String pw = userInfo.getPassword();
        String username = userInfo.getUsername();

        if (checkUserChange(username)){
            UserInfo userExist = userService.checkPw(username,pw);

            if (userExist!=null){
                ActionContext.getContext().getValueStack().set("myInfo",userExist);
                return "upPwSuccess";
            }

            return "upPwError";
        }

        return "usernameError";
    }

    /*
    *  修改密码
    * */

    public String changePw() throws Exception {

        String username = userInfo.getUsername();
        String password = userInfo.getPassword();

        if (checkUserChange(username)){
            userService.changePw(username,password);

            ActionContext.getContext().getSession().remove("username");
            OnlineUser.outLogin(username);

            return "changePw";
        }

        return "usernameError";
    }

    /*
    *  修改个人信息
    * */

    public String updateInfo() throws Exception {

        if (checkUserChange(userInfo.getUsername())){
            String username = userInfo.getUsername();
            String realname = userInfo.getRealname();
            String phone = userInfo.getPhone();
            String address = userInfo.getAddress();

            userService.changUserInfo(username,realname,phone,address);

            return "updateInfo";
        }

        return "usernameError";
    }

    /*
    *  查看是否存在该用户名
    * */

    public String existOrNo() throws Exception {
        String username = userInfo.getUsername();
        String exist = userService.existOrNo(username);

        HttpServletResponse response = ServletActionContext.getResponse();
        //exist为 Y 或者 N,Y为已存在，N为可注册
        response.getWriter().print(exist);

        return null;
    }

    /*
    *  接收表单
    * */

    public String registerUser() throws Exception {
        String username = userInfo.getUsername();
        String password = userInfo.getPassword();
        String address = userInfo.getAddress();
        String phone = userInfo.getPhone();
        String realname = userInfo.getRealname();

        userService.addUser(username,password,address,phone,realname);

        return "registerSuccess";
    }

    public boolean checkUserChange(String username){
        String sessionUsername = (String) ActionContext.getContext().getSession().get("username");

        if (sessionUsername.equals(username)){
            return true;
        }
        return false;
    }
}
