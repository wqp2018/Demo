package com.MyAllBlue.Dao.Impl;

import com.MyAllBlue.Dao.GoodsDao;
import com.MyAllBlue.Model.Category;
import com.MyAllBlue.Model.Commod;
import com.MyAllBlue.Model.Discuss;
import com.MyAllBlue.Page.PageBean;
import org.hibernate.Criteria;
import org.hibernate.criterion.DetachedCriteria;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import java.util.ArrayList;
import java.util.List;

public class GoodsDaoImpl extends HibernateDaoSupport implements GoodsDao {

    @Override
    public List<Commod> hotGoods() {
        String hql = "from Commod where isDelete = ? order by salecount desc";

        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,0);
        if (list!=null){
            return list;
        }
        return null;
    }

    //商品类别展示
    @Override
    public List<Category> goodTypeList() {
        String hql = "from Category";
        List<Category> list = (List<Category>) this.getHibernateTemplate().find(hql);
        if (list!=null){
            return list;
        }
        return null;
    }


    //商品展示
    @Override
    public List<Commod> goodList(int id) {
        String hql = "from Commod where category.id = ? and isDelete = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,id,0);
        if (list!=null){
            return list;
        }
        return null;
    }

    /*
    *  分页查询货物
    * */
    @Override
    public List<Commod> findByPage(int begin,int maxSize,int id) {
        String hql = "from Commod where category.id = ? and isDelete = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,id,0);

        List<Commod> returnList = new ArrayList<Commod>();

        if (list!=null&&list.size()>0){
            for(int i = 0;i<maxSize;i++){
                try {
                    if (list.size()>(i+begin)){
                        returnList.add(list.get(i+begin));
                    }
                }catch (Exception e){
                    e.printStackTrace();
                }

            }
            if (returnList!=null&&returnList.size()>0){
                return returnList;
            }
        }
        return null;
    }

    //按货物查找到的数量
    public int totalSearchCount(String commodname) {
        String hql = "select count(*) from Commod where commodname like ? and isDelete = ?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,"%"+commodname+"%",0);
        if (list!=null){
            return list.get(0).intValue();
        }
        return 0;
    }

    /*
    *  按货物名称分页查询
    * */
    @Override
    public List<Commod> searchName(int begin, int maxSize, String commodname) {
        String hql = "from Commod where commodname like ? and isDelete = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,"%"+commodname+"%",0);

        List<Commod> returnList = new ArrayList<Commod>();

        if (list!=null&&list.size()>0){
            for (int i=0;i<maxSize;i++){
                if (list.size()>(i+begin)) {
                    returnList.add(list.get(i + begin));
                }
            }
            if (returnList!=null&&list.size()>0){
                return returnList;
            }
        }
        return null;
    }

    /*
    *  查询商品的详细信息并展现在commodMessage页面
    * */
    @Override
    public Commod commodMessage(int id) {
        String hql = "from Commod where id = ?";
        List<Commod> list = (List<Commod>) this.getHibernateTemplate().find(hql,id);
        if (list!=null){
            return list.get(0);
        }
        return null;
    }

    /*
    *  查询物品相关评论
    * */
    @Override
    public List<Discuss> getDiscuss(int begin, int maxSize, int id) {
        String hql = "from Discuss where commod.id = ?";
        List<Discuss> discusses = (List<Discuss>) this.getHibernateTemplate().find(hql,id);
        List<Discuss> reList = new ArrayList<Discuss>();

        if (discusses!=null&&discusses.size()>0){
            for (int i=0;i<maxSize;i++){
                if (discusses.size()>(i+begin)) {
                    reList.add(discusses.get(i + begin));
                }
            }
            if (reList!=null&&discusses.size()>0){
                return reList;
            }
        }

        return null;
    }

    /*
    *  获取评论数
    * */
    @Override
    public int getDiscussCount(int id) {
        String hql = "select count(*) from Discuss where commod.id = ?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,id);
        if (list!=null&&list.size()>0){
            return list.get(0).intValue();
        }
        return 0;
    }


    /*
    *  查询货物总数量
    */
    @Override
    public int totalCommodCount(int id) {
        String hql = "select count(*) from Commod where category.id = ? and isDelete = ?";
        List<Long> list = (List<Long>) this.getHibernateTemplate().find(hql,id,0);

        while (list!=null){
            return list.get(0).intValue();
        }
        return 0;
    }
}
