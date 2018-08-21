<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/19
 * Time: 16:04
 */
class Admin_Controller extends CI_Controller{
    public function __construct()
    {
        parent::__construct();
        if (!$this->session->has_userdata("admin")){
            redirect('welcome/adminLoginPage');
        }
    }
}