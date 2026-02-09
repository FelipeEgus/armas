<?php

class userModel{

    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=armas;charset=utf8', 'root', '');
    }

    function getUsers(){
        $query = $this->db->prepare("SELECT usuarios.id, mail, roles.rol ,SUBSTRING_INDEX(mail,'@' , 1) as usuario FROM usuarios INNER JOIN roles ON usuarios.rol = roles.id;");
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getUserMail($mail){
        $query = $this->db->prepare("SELECT id, mail , password, rol , SUBSTRING_INDEX(mail,'@' , 1) as usuario FROM usuarios WHERE mail = ?");
        $query->execute([$mail]);
        return $query->fetch(PDO::FETCH_OBJ);
    }  

    function register($mail,$password){
        $query = $this->db->prepare("INSERT INTO usuarios (mail , password) VALUES (?,?)");
        $query->execute([$mail,$password]);
    }

}

?>