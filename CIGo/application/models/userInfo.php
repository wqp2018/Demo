<?php

class userInfo extends CI_Model{
    function __construct()
    {
        parent::__construct();
    }

    /*
     *  登录判断
     * */
    function findByLogin($username,$password){

        $this->db->where('username',$username);
        $this->db->where('password',$password);
        $result = $this->db->get('userinfo')->result_array();


        /*$sql = "select u.username,u.password,r.name as role from userinfo u LEFT JOIN role r ON u.role = r.id WHERE username=? and password=?";
        $result = $this->db->query($sql,array($username,$password))->result_array();*/

        return $result;
    }

    /*
     *  注册判断
     * */
    public function existUser($username){
        $result = $this->db->where('username',$username)->get('userinfo')->result_array();
        return $result;
    }

    /*
     *  添加用户
     * */
    public function insertUser($data){
        $this->db->insert('userinfo',$data);
    }

    public function showPage($size){
        $result = $this->db->limit(1,$size)->get('userinfo')->result_array();
        print_r($result);
    }



}