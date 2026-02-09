<?php

include_once "libs/smarty/libs/Smarty.class.php";

class userView{

    protected $smarty;

    public function __CONSTRUCT(){
        $this->smarty= new Smarty;
    }

    function showLogin($error = null){
        $this->smarty->assign("error",$error); 
        $this->smarty->display('templates/login.tpl');
    }

    function userList($user){
        // var_dump($user);
        $this->smarty->assign("user", (array) $user);
        $this->smarty->display('templates/usuarios.tpl');
    }

}

?>