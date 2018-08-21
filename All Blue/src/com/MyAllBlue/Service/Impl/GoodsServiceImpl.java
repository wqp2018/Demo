package com.MyAllBlue.Service.Impl;

import com.MyAllBlue.Dao.GoodsDao;
import com.MyAllBlue.Model.Category;
import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Discuss;
import com.MyAllBlue.Page.PageBean;
import com.MyAllBlue.Service.GoodsService;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
public class GoodsServiceImpl implements GoodsService {
    private GoodsDao goodsDao;

    public void setGoodsDao(GoodsDao goodsDao) {
        this.goodsDao = goodsDao;
    }

    @Override
    public List<Commod> hotGoods() {
        List<Commod> commod = goodsDao.hotGoods();
        return commod;
    }

    @Override
    public List<Category> goodTypeList() {
        List<Category> category = goodsDao.goodTypeList();
        return category;
    }

    @Override
    public List<Commod> goodList(int id) {
        List<Commod> commod = goodsDao.goodList(id);
        return commod;
    }

    //分页查询货物
    @Override
    public PageBean<Commod> findByPage(int currentPage, int id) {
        PageBean<Commod> commodPageBean = new PageBean<Commod>();
        //当前页数
        commodPageBean.setCurrentPage(currentPage);
        //每页的最大记录数
        int maxSize = 3;
        commodPageBean.setMaxSize(maxSize);
        //货物数量
        int totalCount = goodsDao.totalCommodCount(id);
        //总数量
        commodPageBean.setTotalSize(totalCount);
        //总页数
        Double totalPageSize = Math.ceil((double) totalCount/maxSize);
        commodPageBean.setTotalPage(totalPageSize.intValue());
        //查询开始数
        int begin = (currentPage - 1) * maxSize;

        List<Commod> commod = goodsDao.findByPage(begin,maxSize,id);

        commodPageBean.setList(commod);

        return commodPageBean;
    }

    /*
    *  按名称查询货物
    * */
    @Override
    public PageBean<Commod> searchByName(int currentPage, String commodname) {
        PageBean<Commod> commodPageBean = new PageBean<Commod>();
        //当前页数
        commodPageBean.setCurrentPage(currentPage);
        //每页的最大记录数
        int maxSize = 3;
        commodPageBean.setMaxSize(maxSize);
        //货物数量
        int totalCount = goodsDao.totalSearchCount(commodname);
        //总数量
        commodPageBean.setTotalSize(totalCount);
        //总页数
        Double totalPageSize = Math.ceil((double) totalCount/maxSize);
        commodPageBean.setTotalPage(totalPageSize.intValue());
        //查询开始数
        int begin = (currentPage - 1) * maxSize;

        List<Commod> commods = goodsDao.searchName(begin,maxSize,commodname);

        commodPageBean.setList(commods);

        return commodPageBean;
    }

    /**/
    @Override
    public Commod commodMessage(int id) {
        Commod commod = goodsDao.commodMessage(id);
        return commod;
    }

    @Override
    public PageBean<Discuss> getDiscuss(int currentPage, int id) {
        PageBean<Discuss> pageBean = new PageBean<Discuss>();

        //设置当前页
        pageBean.setCurrentPage(currentPage);

        //每页的最大记录数
        int maxSize = 2;
       pageBean.setMaxSize(maxSize);

       //评论数量
        int count = goodsDao.getDiscussCount(id);
        pageBean.setTotalSize(count);

        //总页数
        Double totalPageSize = Math.ceil((double) count/maxSize);
        pageBean.setTotalPage(totalPageSize.intValue());

        //查询开始数
        int begin = (currentPage - 1) * maxSize;

        List<Discuss> discusses = goodsDao.getDiscuss(begin,maxSize,id);

        pageBean.setList(discusses);

        return pageBean;
    }


}
