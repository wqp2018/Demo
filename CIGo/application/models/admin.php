<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/21
 * Time: 18:20
 */
class Admin extends CI_Model{
    const TAB_ADMIN = 'admin';
    public function __construct()
    {
        parent::__construct();
    }

    /*
     *  管理员登录
     * */
    public function login($adminName,$password){
        $result = $this->db->where('adminname',$adminName)
            ->where('password',$password)
            ->get(self::TAB_ADMIN)
            ->result_array();

        return $result;
    }

}