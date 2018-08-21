<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/20
 * Time: 18:32
 */
class commods extends CI_Model{
    const TAB_COMMOD = "commods";
    public function __construct()
    {
        parent::__construct();
    }

    /*
     *  首页展现4个商品
     * */
    public function showCommodFour($cid){
        //$sql = "select c.* from commods c LEFT JOIN categroy cg on c.categroy=cg.id WHERE c.categroy=?";
        $result = $this->db->select('c.*,cg.typename')
            ->from('commods c')
            ->join('categroy cg','cg.id=c.categroy')
            ->where('categroy',$cid)
            ->get()
            ->result_array();
        return $result;
    }

    /*
     *  商品的详细信息
     * */
    public function showCommodMessage($cid){
        $result = $this->db->select('*')
            ->from('commods')
            ->where('id',$cid)
            ->get()
            ->result_array();
        return $result;
    }

    /*
     *  添加商品
     * */
    public function insertCommods($insertData){
        $this->db->insert(self::TAB_COMMOD,$insertData);
    }

    /*
     *  分页查询商品
     * */
    public function searchCommodByName_page($commodname,$limit,$size){
        $result = $this->db->from('commods')
            ->like('commodname',$commodname,'both')
            ->limit(4,4)
            ->get()
            ->result_array();
        foreach ($result as $v){
            print_r($v['commodname']);
        }
    }

}