<?php

class armasModel{

    private $db;

    public function __construct() {
        $this->db = new PDO('mysql:host=localhost;'.'dbname=armas;charset=utf8', 'root', '');
    }

    // SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen` FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id
    // SELECT pais.id , `pais`,continentes.continente, `fk_continente` FROM `pais` INNER JOIN continentes on pais.fk_continente = continentes.id

    // SELECT tipo_arma.tipo, COUNT(*) AS cant FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma
    // SELECT tipo_arma.tipo, COUNT(*) AS cant FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id GROUP BY tipo_arma.id ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma 
    // SELECT tipo_golpe.golpe, COUNT(*) AS cant FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id INNER JOIN tipo_golpe on tipo_arma.fk_golpe = tipo_golpe.id GROUP BY tipo_golpe.id ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma
    // SELECT SUM(CASE WHEN imagen <> '' THEN 1 ELSE 0 END) AS cantidad_con_imagen, SUM(CASE WHEN imagen = '' THEN 1 ELSE 0 END) AS cantidad_sin_imagen FROM armas;
    // SELECT SUM(CASE WHEN imagen <> 'imgArmas/' THEN 1 ELSE 0 END) AS cantidad_con_imagen, SUM(CASE WHEN imagen = 'imgArmas/' THEN 1 ELSE 0 END) AS cantidad_sin_imagen FROM armas;

    function getArmas(){
        $query = $this->db->prepare('SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen` FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getArmaId($id){
        $query = $this->db->prepare('SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen`FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id WHERE armas.id = ?');
        $query->execute([$id]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getArmaArma($arma){
        $query = $this->db->prepare('SELECT `arma` FROM `armas` WHERE arma = ?');
        $query->execute([$arma]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getArmasEdit($offset){
        $query = $this->db->prepare("SELECT armas.id, `arma`, pais.pais , tipo_arma.tipo , `fk_pais`, `fk_tipo` FROM `armas` INNER JOIN pais ON armas.fk_pais = pais.id INNER join tipo_arma on armas.fk_tipo = tipo_arma.id ORDER BY arma LIMIT 200 OFFSET $offset");
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getArmasBorradas(){
        $query = $this->db->prepare('SELECT armasborradas.id, `arma`, `fk_pais`, `fk_tipo`, `imagen`, tipo_arma.tipo , pais.pais FROM `armasborradas` INNER JOIN pais on armasborradas.fk_pais = pais.id INNER JOIN tipo_arma on armasborradas.fk_tipo = tipo_arma.id');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    
    function getArmasEditadas(){
        $query = $this->db->prepare('SELECT armaeditadas.id, `arma`, `fk_pais`, `fk_tipo`, `imagen`, tipo_arma.tipo , pais.pais, `id_original` FROM armaeditadas INNER JOIN pais on armaeditadas.fk_pais = pais.id INNER JOIN tipo_arma on armaeditadas.fk_tipo = tipo_arma.id;');
        $query->execute();

        return $query->fetchAll(PDO::FETCH_OBJ);
    }



    function addArma($arma,$pais,$tipo,$imagen){
        $query = $this->db->prepare('INSERT INTO armas(arma, fk_pais, fk_tipo, imagen) VALUES (?,?,?,?)');
        $query->execute([$arma,$pais,$tipo,$imagen]);   
        return $this->db->lastInsertId();
    }


    function deleteArma($id){
        $query = $this->db->prepare('DELETE FROM armas WHERE id = ?');
        $query->execute([$id]);
    }

    function deleteDeleted($id){
        $query = $this->db->prepare('DELETE FROM armasborradas  WHERE id = ?');
        $query->execute([$id]);
    }

    function deleteEdited($id){
        $query = $this->db->prepare('DELETE FROM armaeditadas WHERE  id = ?');
        $query->execute([$id]);
    }


    function editArma($arma,$pais,$tipo,$imagen,$id){
        $query = $this->db->prepare('UPDATE armas SET arma = ? ,fk_pais = ? ,fk_tipo = ?, imagen =? WHERE id = ?');
        $query->execute([$arma,$pais,$tipo,$imagen,$id]);
    }

    function addImg($imagen,$id){
        $this->db->query("SET @restaurando = TRUE");
        
        $query = $this->db->prepare('UPDATE armas SET imagen = ? WHERE id = ?');
        $query->execute([$imagen,$id]);

        $this->db->query("SET @restaurando = FALSE");
    }

    function editEdited($arma,$origen,$tipo,$imagen,$id){
        $this->db->query('SET @restaurando = TRUE');

        $query = $this->db->prepare('UPDATE armas SET arma = ? ,fk_pais = ? ,fk_tipo = ?, imagen =? WHERE id = ?');
        $query->execute([$arma,$origen,$tipo,$imagen,$id]);
        
        $this->db->query("SET @restaurando = FALSE");
    }



    function buscarArma($buscar,$tipo,$golpe,$pais,$continente){
        $sql = 'SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen`FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id INNER JOIN tipo_golpe ON tipo_arma.fk_golpe = tipo_golpe.id INNER JOIN continentes on pais.fk_continente = continentes.id WHERE arma LIKE ?';

        $params[] = $buscar.'%';

        if (!empty($tipo)) {
            $sql .= " AND tipo_arma.id = ? ";
            $params[] = $tipo;
        }
        
        if (!empty($golpe)) {
            $sql .= " AND tipo_golpe.id = ? ";
            $params[] = $golpe;
        }

        if (!empty($pais)) {
            $sql .= " AND pais.id = ? ";
            $params[] = $pais;
        }

        if (!empty($continente)) {
            $sql .= " AND continentes.id = ? ";
            $params[] = $continente;
        }

        $sql .= 'ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma';

        $query = $this->db->prepare($sql);
        $query->execute($params);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    function buscarArmaAjax($buscar){
        $query = $this->db->prepare('SELECT id, arma FROM armas WHERE LOWER(arma) LIKE LOWER( ? ) LIMIT 10');
        $query->execute([$buscar.'%']);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    


    function getArmasSinImagen(){
        $query = $this->db->prepare('SELECT id,arma FROM armas where imagen = "imgArmas/"');
        $query->execute([]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }



    function getCantArmas(){
        $query = $this->db->prepare('SELECT COUNT(*) AS cant FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma');
        $query->execute([]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }
    
    function getCantxArma(){
        $query = $this->db->prepare('SELECT tipo_arma.tipo, COUNT(*) AS cant FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id GROUP BY tipo_arma.id ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma ');
        $query->execute([]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getCantxGolpe(){
        $query = $this->db->prepare('SELECT tipo_golpe.golpe, COUNT(*) AS cant FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id INNER JOIN tipo_golpe on tipo_arma.fk_golpe = tipo_golpe.id GROUP BY tipo_golpe.id ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma');
        $query->execute([]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }



    function getArmasTipo($tipo){
        $query = $this->db->prepare('SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen` FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id WHERE fk_tipo = ? ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma');
        $query->execute([$tipo]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getArmasGolpe($golpe){
        $query = $this->db->prepare('SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen` FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id WHERE tipo_arma.fk_golpe = ? ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma');
        $query->execute([$golpe]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getArmasOrigen($origen){
        $query = $this->db->prepare('SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen` FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id WHERE armas.fk_pais = ? ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma');
        $query->execute([$origen]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    function getArmasCont($cont){
        $query = $this->db->prepare('SELECT armas.id, `arma`,pais.pais, tipo_arma.tipo,`fk_pais`, `fk_tipo`, `imagen` FROM `armas` INNER JOIN pais on armas.fk_pais = pais.id INNER JOIN tipo_arma on armas.fk_tipo = tipo_arma.id WHERE pais.fk_continente = ? ORDER BY tipo_arma.fk_golpe,tipo_arma.id, armas.arma');
        $query->execute([$cont]);

        return $query->fetchAll(PDO::FETCH_OBJ);
    }

}

?>