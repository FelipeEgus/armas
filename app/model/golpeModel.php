<?php

class golpeModel{

    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=armas;charset=utf8', 'root', '');
    }

    function getGolpes(){
        $query = $this->db->prepare('SELECT * FROM tipo_golpe');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getGolpeId($id){
        $query = $this->db->prepare('SELECT * FROM tipo_golpe WHERE id = ?');
        $query->execute([$id]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function addGolpe($golpe){
        $query = $this->db->prepare('INSERT INTO tipo_golpe(golpe) VALUES (?)');
        $query->execute([$golpe]);
    }


    function deleteGolpe($id){
        $query = $this->db->prepare('DELETE FROM tipo_golpe WHERE id = ?');
        $query->execute([$id]);
    }

    function editGolpe($golpe,$id){
        $query = $this->db->prepare('UPDATE tipo_golpe SET golpe = ? WHERE id = ?');
        $query->execute([$golpe,$id]);
    }

}

?>