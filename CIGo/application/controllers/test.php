<?php
defined('BASEPATH') OR exit('No direct script access allowed');
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/22
 * Time: 12:32
 */
class Test extends CI_Controller{
    public function kk(){
        $this->load->model('commods');
        $this->commods->searchCommodByName_page('',1,2);
    }

    public function tt(){
        $page = $this->uri->segment(3);

        //总条数
        $totalSize = $this->db->query('select id from commods');

        $result = $this->db->from('commods')
            ->limit(1,$page)
            ->get()
            ->result_array();
        print_r($result);

        $this->load->library('pagination');

        $config['base_url'] = site_url().'/test/tt';
        $config['total_rows'] = $totalSize->num_rows;
        $config['per_page'] = 1;

        $this->pagination->initialize($config);

        echo $this->pagination->create_links();
    }

    public function testRedis(){
        //echo phpinfo();
        /*$redis = new Redis();

        $redis->connect('127.0.0.1',6379);

        echo "Server is Running : ".$redis->ping();*/
    }
}