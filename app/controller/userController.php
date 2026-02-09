<?php

include 'app/model/userModel.php';
include 'app/view/userView.php';
include_once 'app/helpers/authHelper.php';

class userController{

    private $model;
    private $view;
    private $helper;

    function __construct (){

        $this->model = new userModel();
        $this->view = new userView();
        $this->helper = new AuthHelper();

    }

    function showLogin(){
        $this->view->showLogin();
    }

    function registerUser(){

        $mail = $_REQUEST['mail'];
        $password = password_hash($_REQUEST['password'], PASSWORD_BCRYPT);

        $this->model->register($mail,$password);

        header("Location: " . 'login');
        
    }

    function logout(){

        session_start();
        session_destroy();
        header("location: " . BASE_URL);

    }

    function showUsers(){
        $this->helper->checkAdmin();
        $user = $this->model->getUsers();
        $this->view->userList($user);
    }

}

?>