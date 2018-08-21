<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/20
 * Time: 18:09
 */
class categroy extends CI_Model{
    const TBL = 'categroy';
    public function __construct()
    {
        parent::__construct();

    }

    public function showType(){

        $result =  $this->db->limit(4,0)->get(self::TBL)->result_array();
        return $result;
    }

    public function showAllType(){
        return $this->db->get(self::TBL)->result_array();
    }
}