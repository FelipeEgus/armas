<?php 

class tipoModel{

    private $db;

    function __construct(){
        $this->db = new PDO('mysql:host=localhost;'.'dbname=armas;charset=utf8', 'root', '');
    }

    function getTipos(){ 
        $query = $this->db->prepare('SELECT tipo_arma.id , `tipo`, tipo_golpe.golpe FROM `tipo_arma` INNER JOIN tipo_golpe ON tipo_arma.fk_golpe = tipo_golpe.id ORDER BY fk_golpe, tipo');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getTipoId($id){
        $query = $this->db->prepare('SELECT tipo_arma.id , `tipo`, tipo_golpe.golpe , `fk_golpe` as id_golpe FROM `tipo_arma` INNER JOIN tipo_golpe ON tipo_arma.fk_golpe = tipo_golpe.id WHERE tipo_arma.id = ?');
        $query->execute([$id]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function addTipo($tipo,$golpe){
        $query = $this->db->prepare('INSERT INTO tipo_arma(tipo,fk_golpe) values (?,?)');
        $query->execute([$tipo,$golpe]);
    }

    function deleteTipo($id){
        $query = $this->db->prepare('DELETE FROM tipo_arma WHERE id = ?');
        $query->execute([$id]);
    }


    function editTipo($tipo,$golpe,$id){
        $query = $this->db->prepare('UPDATE tipo_arma SET tipo = ? , fk_golpe = ? WHERE id = ?');
        $query->execute([$tipo,$golpe,$id]);
    }

}

?>