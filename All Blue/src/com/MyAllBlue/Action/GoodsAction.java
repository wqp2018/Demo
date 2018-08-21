package com.MyAllBlue.Action;

import com.MyAllBlue.Model.Category;
import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Discuss;
import com.MyAllBlue.Page.PageBean;
import com.MyAllBlue.Service.GoodsService;
import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GoodsAction extends ActionSupport implements ModelDriven<Commod> {

    //货物
    Commod commodall = new Commod();

    @Override
    public Commod getModel() {
        return commodall;
    }

    private GoodsService goodsService;

    public void setGoodsService(GoodsService goodsService) {
        this.goodsService = goodsService;
    }

    private int currentPage = 1;

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    //展示热门商品图片
    public String hotGoods() throws Exception {
        List<Commod> commod = goodsService.hotGoods();

        List listPic = new ArrayList();
        List listCommodName = new ArrayList();
        List listCommodId = new ArrayList();
        for (int i =0;i<3;i++){
            listPic.add(commod.get(i).getPic());
            listCommodName.add(commod.get(i).getCommodname());
            listCommodId.add(commod.get(i).getId());
        }
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("pic",listPic);
        map.put("commonName",listCommodName);
        map.put("commodId",listCommodId);

        Gson gson = new Gson();
        String result = gson.toJson(map);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(result);

        return null;
    }

    //展示商品类别列表
    public String goodTypeList() throws Exception {
        List<Category> category = goodsService.goodTypeList();

        List typeName = new ArrayList();
        List typeId = new ArrayList();
        for (int i=0;i<category.size();i++){
            typeName.add(category.get(i).getTypename());
            typeId.add(category.get(i).getId());
        }

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("typeName",typeName);
        map.put("typeId",typeId);

        Gson gson = new Gson();

        String result = gson.toJson(map);

        HttpServletResponse response = ServletActionContext.getResponse();
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(result);

        return null;
    }

    //展现商品列表
    public String goodList() throws Exception {
        List<Commod> commods = goodsService.goodList(commodall.getId());

        List commodPic = new ArrayList();
        List commodName = new ArrayList();
        List commodId = new ArrayList();
        for(int i=0;i<commods.size();i++){
            commodPic.add(commods.get(i).getPic());
            commodName.add(commods.get(i).getCommodname());
            commodId.add(commods.get(i).getId());
        }

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("commodPic",commodPic);
        map.put("commodName",commodName);
        map.put("commodId",commodId);

        Gson gson = new Gson();

        String result = gson.toJson(map);

        HttpServletResponse response = ServletActionContext.getResponse();

        response.setCharacterEncoding("utf-8");
        response.getWriter().print(result);

        return null;
    }

    //更多商品列表
    public String showCommod() throws Exception {
        //默认搜索id为1的商品
        if (commodall.getId() == 0){
            commodall.setId(1);
        }
        PageBean<Commod> commodPageBean = goodsService.findByPage(currentPage,commodall.getId());

        ActionContext.getContext().getValueStack().set("commodPageBean",commodPageBean);

        return "showCommod";
    }

    //查询商品
    public String searchCommod() throws Exception {

        HttpServletRequest request = ServletActionContext.getRequest();

        if (commodall.getCommodname()==null){
            commodall.setCommodname("");
        }
        String method = ServletActionContext.getRequest().getMethod();
        if (method.equals("GET")){
            commodall.setCommodname(new String(commodall.getCommodname().getBytes("ISO-8859-1"), "UTF-8"));
        }

        PageBean<Commod> pageBean = goodsService.searchByName(currentPage,commodall.getCommodname());
        pageBean.setSearchName(commodall.getCommodname());
        ActionContext.getContext().getValueStack().set("pageBean",pageBean);
        ActionContext.getContext().getValueStack().set("searchMessage",commodall.getCommodname());
        return "search";
    }

    //根据ID查找出物品并展现在commodMessage页面
    public String commodMessage() throws Exception {
        Commod commod = goodsService.commodMessage(commodall.getId());

        ActionContext.getContext().getValueStack().set("commod",commod);

        PageBean<Discuss> pageBean = goodsService.getDiscuss(currentPage,commod.getId());

        ActionContext.getContext().getValueStack().set("pageBean",pageBean);

        return "commodMessage";
    }
}
