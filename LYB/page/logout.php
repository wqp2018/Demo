<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/8/22
 * Time: 19:11
 */
session_start();

if (isset($_SESSION['userinfo'])){
    unset($_SESSION['userinfo']);
}
header("Location:../index.php");