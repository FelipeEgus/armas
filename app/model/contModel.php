<?php

class contModel{

    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=armas;charset=utf8', 'root', '');
    }

    function getContinentes(){
        $query = $this->db->prepare('SELECT * FROM continentes');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getContId($id){
        $query = $this->db->prepare('SELECT * FROM continentes WHERE id = ?');
        $query->execute([$id]);

        return $query->fetchAll(PDO::FETCH_OBJ);   
    }

    function addCont($cont){
        $query = $this->db->prepare('INSERT INTO continentes (continente) VALUES (?)');
        $query->execute([$cont]);
    }

    function deleteCont($id){
        $query = $this->db->prepare('DELETE FROM continentes WHERE id = ? ');
        $query->execute([$id]);
    }

    function editCont($cont,$id){
        $query = $this->db->prepare('UPDATE continentes SET continente = ? WHERE id = ?');
        $query->execute([$cont,$id]);
    }

}

?>