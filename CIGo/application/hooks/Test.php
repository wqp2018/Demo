<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/24
 * Time: 20:00
 */
class Test{
    private $CI;
    public function __construct()
    {
        $this->CI = &get_instance();
    }

    public function T(){
        $this->CI->load->helper('url');
        if (preg_match("/admin/", uri_string())){
            die("管理员");
        }else{
            echo 123;
        }

    }
}