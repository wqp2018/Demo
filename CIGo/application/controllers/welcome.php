<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/20
 * Time: 16:40
 */
class Welcome extends CI_Controller{
    public function index(){
        //$this->session->set_userdata("user","userKK");
        //$this->session->sess_destroy();

        $this->load->model('categroy');
        $result['type'] = $this->categroy->showType();

        $this->load->view('default',$result);
    }

    public function showCommodFour(){
        $cid = $this->uri->segment(3);
        $this->load->model('commods');
        $result = $this->commods->showCommodFour($cid);
        $this->output->set_header('Content-Type: application/json; charset=utf-8');
        header("Access-Control-Allow-Origin: * ");
        echo json_encode($result);
    }

   public function showCommodMessage(){
        $cid = $this->uri->segment(3);
        $this->load->model('commods');
        $result = $this->commods->showCommodMessage($cid);

        $this->load->view('common/commodMessage',$result[0]);
    }

    /*
     *  跳转登录页面
     * */
    public function login(){
        if ($this->session->userdata('user')!=null){
            $this->load->model('categroy');
            $result['type'] = $this->categroy->showType();

            $this->load->view('default',$result);
        }else{
            $this->load->helper("form");
            $this->load->view("common/login");
        }

    }

    /*
     *  登录判断方法
     * */
    public function loginDo(){
        $this->load->helper('form');
        $username = $this->input->post('username',true);
        $password = $this->input->post('password',true);
        $code = strtolower($this->input->post('validation',true));
        if ($code!=null){
            if ($this->session->has_userdata('code')){
                //判断验证码是否正确
                if ($code == strtolower($this->session->userdata('code')["word"])){
                  //数据库登录判断

                    $this->load->model("userInfo");
                    $result = $this->userInfo->findByLogin($username,$password);
                    if ($result!=null){
                        $this->session->set_userdata('user',$result[0]['username']);
                        $this->load->model('categroy');
                        $result['type'] = $this->categroy->showType();
                        $this->load->view('default',$result);
                    }else {
                        echo "登录失败";
                    }
                }else{
                    $data['msg'] = "验证码错误，请重新输入";
                    $this->load->view("common/login",$data);
                }
            }
        }else{
            $data['msg'] = "";
            $this->load->view("common/login",$data);
        }

    }

    /*
     *  用户注销
     * */
    public function logout(){
        $this->session->unset_userdata('user');
        $this->load->helper("form");
        $this->load->view("common/login");
    }

    /*
     *  跳转注册页面
     * */
    public function registerPage(){
        $this->load->helper('form');
        $this->load->view('common/register');
    }

    /*
     *  处理注册信息
     * */
    public function register(){
        $this->load->helper('form');
        $this->load->library('form_validation');

        $this->form_validation->set_rules('username',"用户名","required|min_length[4]|is_unique[userinfo.username]|is_kmh156");
        $this->form_validation->set_message('is_unique',"该用户已存在");
        $this->form_validation->set_rules('password','密码','required|min_length[6]');
        $this->form_validation->set_rules('email','邮箱','required|valid_email');
        $this->form_validation->set_rules('emailCode','邮箱验证码','required');
        $result = $this->form_validation->run();

        $emailCode = $this->input->post('emailCode',true);

        //判断邮箱验证码是否正确
        if ($emailCode == $this->session->userdata('emailCode')){
            //表单验证无误
            if ($result){
                $username = $this->input->post("username",true);
                $password = $this->input->post("password",true);
                $email = $this->input->post("email",true);
                $data = array(
                    'username'=>$username,
                    'password'=>$password,
                    'email'=>$email,
                    'role'=>1
                );
                $this->load->model("userInfo");
                $this->userInfo->insertUser($data);

                //清除邮箱验证
                $this->session->unset_userdata('emailCode');


                //返回登录页面
                $this->load->helper('form');
                $this->load->view('common/login');
            }else{
                //返回注册表单页面
                $this->load->helper('form');
                $this->load->view('common/register');
            }
        }else{
            //邮箱验证失败
            $data['msg'] = "<script>alert('邮箱验证码错误，请检查正确后再重试')</script>";

            $this->load->helper('form');
            $this->load->view('common/register',$data);

        }
    }

    /*
     *  生成验证码
     * */
    public function reloadPic(){
        $this->load->helper('captcha');
        //生成验证码
        $vals = array(
            'word' => rand(1000,9999)
        );

        $data = create_captcha($vals);

        $this->session->set_userdata("code",$data);
    }

    /*
     *  发送邮件
     * */

    public function sendEmail(){
        $this->load->library('email');

        $email =  $this->input->post("email");

        //设置email参数
        $config['protocol'] = 'smtp';
        $config['smtp_host'] = 'smtp.qq.com';
        $config['smtp_user'] = '1163985789@qq.com';
        $config['smtp_pass'] = 'dayrvjowdzbpiagh';
        $config['smtp_port'] = '25';
        $config['charset'] = 'utf-8';
        $config['wordwrap'] = TRUE;
        $config['crlf'] = "\r\n";
        $config['newline'] = "\r\n";

        $this->email->initialize($config);
        //设置email内容
        $this->email->from('1163985789@qq.com','海上商城');
        $this->email->to($email);
        $this->email->subject('注册验证码');
        //邮箱验证码

        $emailCode = rand(10000,99999);
        $emailMessage = "您好，此次注册的验证码为".$emailCode;
        $this->email->message($emailMessage);

        $this->session->set_userdata('emailCode',$emailCode);

        $this->email->send();
    }

    //判断是否存在user
    public function isExistUser(){
        $username = $this->input->post('username',true);
        $this->load->model('userInfo');
        $result = $this->userInfo->existUser($username);
        if ($result){
            echo false;
        }else{
            echo true;
        }
    }

    /*
     *  管理员登录页面
     * */
    public function adminLoginPage(){
        if ($this->session->has_userdata('admin')){
            $this->load->view("admin/default");
        }else{
            $this->load->view('common/adminLogin');
        }

    }

    /*
     *  购买商品
     * */
    public function buyCommod(){
        if ($this->session->has_userdata('user')){
            echo "<script>alert('购买成功')</script>";
            echo "<script>window.history.go(-1)</script>";
        }else{
            $this->load->helper('form');
            echo "<script>alert('请先登录')</script>";
            $this->load->view('common/login');
        }
    }


    /*
     *  管理员登录处理
     * */
    public function adminLogin(){
        $this->load->model('categroy');
        $this->load->helper('form');
        $typeResult['type'] = $this->categroy->showAllType();

        if ($this->session->has_userdata('admin')){
            $this->load->view("admin/default",$typeResult);
        }else{
            $adminName = $this->input->post('adminName',true);
            $password = $this->input->post('password',true);

            $this->load->model("admin");
            $result = $this->admin->login($adminName,$password);

            if ($result){
                $this->session->set_userdata('admin',$result[0]);
                $this->load->view("admin/default",$typeResult);
            }else{
                $data['msg'] = "<script>alert('用户名或密码错误')</script>";
                $this->load->view('common/adminLogin',$data);
            }
        }

    }
}