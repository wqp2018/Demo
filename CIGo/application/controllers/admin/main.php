<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends Admin_Controller{
    public function __construct()
    {
        parent::__construct();
    }

    /*
     *  管理员注销登录
     * */
    public function logout(){
        $this->session->unset_userdata('admin');
        $this->load->model('categroy');
        $result['type'] = $this->categroy->showType();

        $this->load->view('default',$result);
    }

    /*
     *  添加商品
     * */
    public function addCommod(){
        $this->load->library('form_validation');

        $this->form_validation->set_rules('commodname','货物','required|is_unique[commods.commodname]');
        $this->form_validation->set_rules('price','价格','required|integer|greater_than[0]');
        $this->form_validation->set_rules('hascount','库存','required|integer|greater_than[0]');
        $data = $this->form_validation->run();

        if ($data){
            //上传图片配置
            $config['upload_path'] = 'public/images';
            $config['allowed_types'] = 'gif|jpg|png';
            $config['file_name'] = time();
            $config['max_size'] = '100';
            $config['max_width'] = '1024';
            $config['max_height'] = '768';

            $this->load->library('upload', $config);
            $this->upload->initialize($config);

            //上传图片成功与否
            if ( ! $this->upload->do_upload('img'))
            {
                $error = array('error' => $this->upload->display_errors());
                print_r($error);
            }
            else
            {
                $kk = $this->upload->data();
                $commodname = $this->input->post('commodname',true);
                $price = $this->input->post('price',true);
                $categroy = $this->input->post('categroy',true);
                $hascount = $this->input->post('hascount',true);
                $discuss = $this->input->post('discuss',true);
                $img = "public/images/".$kk['file_name'];

                $insertData = array(
                    'commodname'=>$commodname,
                    'price'=>$price,
                    'categroy'=>$categroy,
                    'hascount'=>$hascount,
                    'discuss'=>$discuss,
                    'img'=>$img,
                );
                $this->load->model('commods');
                $this->commods->insertCommods($insertData);

                //返回admin首页
                $this->load->model('categroy');
                $typeResult['type'] = $this->categroy->showAllType();
                $this->load->view("admin/default",$typeResult);
            }
        }else{
            //表单验证失败，返回添加表单页面
            $this->load->model('categroy');
            $typeResult['type'] = $this->categroy->showAllType();
            $this->load->view("admin/default",$typeResult);
        }

    }

    /*
     *  Ajax上传图片
     * */
    public function uploadImgAjax(){
        $config['upload_path'] = 'public/images';
        $config['allowed_types'] = 'gif|jpg|png';
        $config['file_name'] = time();
        $config['max_size'] = '100';
        $config['max_width'] = '1024';
        $config['max_height'] = '768';

        $this->load->library('upload', $config);
        $this->upload->initialize($config);

        if ( ! $this->upload->do_upload('img'))
        {
            $error = array('error' => $this->upload->display_errors());
            print_r($error);
        }
        else
        {
            $kk = $this->upload->data();
            $this->output->set_header('Content-Type: application/json; charset=utf-8');
            header("Access-Control-Allow-Origin: * ");
            echo json_encode($kk['file_name']);
        }
    }
}