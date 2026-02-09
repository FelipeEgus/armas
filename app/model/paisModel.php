<?php

class paisModel{

    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=armas;charset=utf8', 'root', '');
    }

    function getPaises(){
        $query = $this->db->prepare('SELECT pais.id , `pais`,continentes.continente, `fk_continente` FROM `pais` INNER JOIN continentes on pais.fk_continente = continentes.id ORDER BY fk_continente , pais');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }    

    function getPaisesId($id){
        $query = $this->db->prepare('SELECT pais.id , `pais`,continentes.continente, `fk_continente` as id_continente FROM `pais` INNER JOIN continentes on pais.fk_continente = continentes.id WHERE pais.id = ?');
        $query->execute([$id]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function addPais($pais,$cont){
        $query  = $this->db->prepare('INSERT INTO pais(pais, fk_continente) VALUE (?,?)');
        $query->execute([$pais,$cont]);
    }

    function deletePais($id){
        $query  = $this->db->prepare('DELETE FROM pais WHERE id = ?');
        $query->execute([$id]);
    }

    function editPais($pais,$cont,$id){
        $query = $this->db->prepare('UPDATE pais SET pais = ?, fk_continente = ? WHERE id = ?');
        $query->execute([$pais,$cont,$id]);
    }
    

}

?>