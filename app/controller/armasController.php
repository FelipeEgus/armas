<?php

include_once 'app/view/armasView.php';
include_once 'app/model/armasModel.php';
include_once 'app/model/paisModel.php';
include_once 'app/model/contModel.php';
include_once 'app/model/tipoModel.php';
include_once 'app/model/golpeModel.php';
include_once 'app/helpers/authHelper.php';
       

class armasController{

    private $view;
    private $helper;
    private $armasModel;
    private $paisModel;
    private $contModel;
    private $tiposModel;
    private $golpeModel;

    function __construct(){
        $this->view = new armasView();
        $this->authHelper = new AuthHelper();
        $this->armasModel = new armasModel();
        $this->paisModel =  new paisModel();
        $this->contModel = new contModel();
        $this->tiposModel = new tipoModel();
        $this->golpeModel = new golpeModel();
    }

    function getID($params = null){
        return $params[':ID'];
    }

    function showHome(){
        $armas  = $this->armasModel->getArmas();
        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();
        $cantTotal = $this->armasModel->getCantArmas();
        $cantArmas = $this->armasModel->getCantxArma();
        $cantGolpe = $this->armasModel->getCantxGolpe();
        $sinImagen = $this->armasModel->getArmasSinImagen();
        $payload = $this->authHelper->getToken();
        $this->view->home($armas,$paises,$cont,$tipos,$golpes,$payload,$cantTotal,$cantArmas,$cantGolpe,$sinImagen);
    }   

    function showArma($params = null){
        
        $id = $this->getID($params);
        
        $arma = $this->armasModel->getArmaId($id);
        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();        
        $payload = $this->authHelper->getToken();

        $this->view->unico($arma,$paises,$cont,$tipos,$golpes,$payload);
    }

    function showTipo($params){
        
        $id = $this->getID($params);

        $armas = $this->armasModel->getArmasTipo($id);
        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();
        $payload = $this->authHelper->getToken();

        $this->view->home($armas,$paises,$cont,$tipos,$golpes,$payload);
    }

    function showOrigen($params){
        
        $id = $this->getID($params);
        
        $armas = $this->armasModel->getArmasOrigen($id);
        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();
        $payload = $this->authHelper->getToken();

        $this->view->home($armas,$paises,$cont,$tipos,$golpes,$payload);
    }

    function showGolpe($params){
        
        $id = $this->getID($params);
        
        $armas = $this->armasModel->getArmasGolpe($id);
        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();
        $payload = $this->authHelper->getToken();

        $this->view->home($armas,$paises,$cont,$tipos,$golpes,$payload);
    }

    function showCont($params){
        
        $id = $this->getID($params);
        
        $armas = $this->armasModel->getArmasCont($id);
        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();
        $payload = $this->authHelper->getToken();

        $this->view->home($armas,$paises,$cont,$tipos,$golpes,$payload);
    }

    function showAddArmas(){
        $this->authHelper->checkAdmin();
        $armas  = $this->armasModel->getArmas();
        $paises = $this->paisModel->getPaises();
        $tipos = $this->tiposModel->getTipos(); 
        $this->view->formArmas($armas,$paises,$tipos);
    }

    function showDatos(){
        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();
        $this->view->showDatos($paises,$cont,$tipos,$golpes);
    }

    function getArmasAlteradas(){
        $this->authHelper->checkAdmin();
        
        $borradas  = $this->armasModel->getArmasBorradas();
        $editadas = $this->armasModel->getArmasEditadas();
        $payload = $this->authHelper->getToken();
        
        $this->view->armasAlteradas($borradas,$editadas,$payload); 
    }



    function addArma(){
        $this->authHelper->checkAdmin();
        $arma = $_POST['arma'];
        $origen = $_POST['origen'];
        $tipo = $_POST['tipo'];
    
        $repetida = $this->armasModel->getArmaArma($arma);

        $carpeta_destino = "imgArmas/";

        $nom_archivo = $_FILES["imagen"]["name"];
        $ruta_temporal = $_FILES["imagen"]["tmp_name"];

        $ruta_destino = $carpeta_destino . $nom_archivo;

        $ok_subida = move_uploaded_file($ruta_temporal, $ruta_destino);

        if (empty($arma) && !empty($repetida) && !$ok_subida) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'mensaje' => 'Datos incompletos o arma repetida']);        
            return;
        }
        
        $lastID = $this->armasModel->addArma($arma, $origen, $tipo, $ruta_destino);

        $arma_insertada = $this->armasModel->getArmaId($lastID);

        header('Content-Type: application/json');
        echo json_encode(['success' => true, 'mensaje' => 'Arma agregada con éxito','arma' => $arma_insertada]);
    }

    function addArmas(){
        $this->authHelper->checkAdmin();
        for ($i=1; $i<=20; $i++) { 
            $arma = $_POST["arma$i"];
            $origen = $_POST["origen$i"];
            $tipo = $_POST["tipo$i"];

            $repetida = $this->armasModel->getArmaArma($arma);

            $carpeta_destino = "imgArmas/";

            $nom_archivo = $_FILES["imagen$i"]["name"];
            $ruta_temporal = $_FILES["imagen$i"]["tmp_name"];
    
            $ruta_destino = $carpeta_destino . $nom_archivo;
            move_uploaded_file($ruta_temporal, $ruta_destino);          

            if (!empty($arma) && empty($repetida)) {
                $this->armasModel->addArma($arma,$origen,$tipo,$ruta_destino);   
            }
        }    
           
        header("Location: " . BASE_URL . "#sinImg");
    }

    function addArmaBorrada(){
        $this->authHelper->checkAdmin();

        $arma = $_POST['arma'];
        $origen = $_POST['origen'];
        $tipo = $_POST['tipo'];
        $imagen = $_POST['imagen'];

        if (empty($arma)) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'mensaje' => 'Datos incompletos o arma repetida']);        
            return;
        }
        
        $lastID = $this->armasModel->addArma($arma, $origen, $tipo, $imagen);

       $arma_insertada = $this->armasModel->getArmaId($lastID);

        header('Content-Type: application/json');
        echo json_encode(['success' => true, 'mensaje' => 'Arma agregada con éxito','arma' => $arma_insertada]);
    }

    function deleteArma($params) {
        $this->authHelper->checkAdmin(); 
        $id = $this->getID($params);

        header('Content-Type: application/json'); 

        if ($this->armasModel->deleteArma($id)) {
            http_response_code(500); 
            echo json_encode(['success' => false, 'mensaje' => 'No se pudo eliminar el arma']);
        }

        echo json_encode(['success' => true, 'mensaje' => 'Arma eliminada correctamente']);
    
    }

    function deleteDeleted($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        header('Content-Type: application/json'); 

        if ($this->armasModel->deleteDeleted($id)) {
            http_response_code(500); 
            echo json_encode(['success' => false, 'mensaje' => 'No se pudo eliminar el arma']);
        }

        echo json_encode(['success' => true, 'mensaje' => 'Arma eliminada correctamente']);

    }

    function deleteEdited($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        header('Content-Type: application/json'); 

        if ($this->armasModel->deleteEdited($id)) {
            http_response_code(500); 
            echo json_encode(['success' => false, 'mensaje' => 'No se pudo eliminar el arma']);
        }
            
        echo json_encode(['success' => true, 'mensaje' => 'Arma eliminada correctamente']);

    }

    function showEditArma($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);
        $arma = $this->armasModel->getArmaId($id);
        $paises = $this->paisModel->getPaises();
        $tipos = $this->tiposModel->getTipos(); 
        
        $this->view->editArma($arma, $paises, $tipos);    
    }

    function editArma($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        $arma = $_POST['arma_edit'];
        $origen = $_POST['origen_edit'];
        $tipo = $_POST['tipo_edit'];
        
        $carpeta_destino = "imgArmas/";

        if (!isset($_FILES['nueva_imagen']) || $_FILES['nueva_imagen']['error'] != 0) {
            $ruta_destino = $_POST['vieja_imagen']; 
            $ok_subida = true;
        } else {
            $nom_archivo = $_FILES["nueva_imagen"]["name"];
            $ruta_temporal = $_FILES["nueva_imagen"]["tmp_name"];
            
            $ruta_destino = $carpeta_destino . $nom_archivo;
            
            $ok_subida = move_uploaded_file($ruta_temporal, $ruta_destino);
        }
        
        if ($this->armasModel->editArma($arma,$origen,$tipo,$ruta_destino,$id) && $ok_subida) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'mensaje' => 'Arma no editada']);
            return;
        }
        
        header('Content-Type: application/json');
        echo json_encode(['success' => true, 'mensaje' => 'Arma editada con éxito']);

    }

    function editArmaImg($params){  
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);
        
        $carpeta_destino = "imgArmas/";

        $nom_archivo = $_FILES["addImg"]["name"];
        $ruta_temporal = $_FILES["addImg"]["tmp_name"];  

        if (empty($_FILES['addImg'])) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'mensaje' => 'imagen no cargada']);
            return;
        }else{
            $ruta_destino = $carpeta_destino . $nom_archivo;
            move_uploaded_file($ruta_temporal, $ruta_destino);
        }

        
        if($this->armasModel->addImg($ruta_destino,$id)){
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'mensaje' => 'el arma arma no existe']);       
            return;
        }
        
        header('Content-Type: application/json');
        echo json_encode(['success' => true, 'mensaje' => 'Arma agregada con éxito']);

    }

    function editEdited($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        $arma = $_POST['arma_edit'];
        $origen = $_POST['origen_edit'];
        $tipo = $_POST['tipo_edit'];
        $imagen = $_POST['vieja_imagen']; 
        
        if($this->armasModel->editEdited($arma,$origen,$tipo,$imagen,$id)) {
            header('Content-Type: application/json');
            echo json_encode(['success' => false, 'mensaje' => 'Arma no editada']);
            return;
        }
        
        header('Content-Type: application/json');
        echo json_encode(['success' => true, 'mensaje' => 'Arma editada con éxito']);

    }

    function buscarArma(){
        $buscar = $_POST['buscador'];

        $tipo = $_POST['tipo'] ?? '';
        $golpe = $_POST['golpe'] ?? '';
        $pais = $_POST['pais'] ?? '';
        $continente = $_POST['continente'] ?? '';

        $armas = $this->armasModel->buscarArma($buscar,$tipo,$golpe,$pais,$continente);

        $paises = $this->paisModel->getPaises();
        $cont = $this->contModel->getContinentes();
        $tipos = $this->tiposModel->getTipos(); 
        $golpes = $this->golpeModel->getGolpes();
        $payload = $this->authHelper->getToken();

        $this->view->home($armas,$paises,$cont,$tipos,$golpes,$payload);
    }

    function buscarArmaAJAX(){
        $buscar = $_POST['buscador'];

        $armas = $this->armasModel->buscarArmaAjax($buscar);

        header('Content-Type: application/json');

        if (empty($armas)) {
            echo 'no se encontraron armas';
            return;
        }

        echo json_encode($armas);
    }



    function addPais(){
        $this->authHelper->checkAdmin();
        $pais = $_POST['pais'];
        $cont = $_POST['continente'];
    
        $this->paisModel->addPais($pais,$cont);
        header("Location: " . BASE_URL);
    }
    
    function deletePais($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);
        
        $this->paisModel->deletePais($id);
        header("Location: " . BASE_URL); 
    }
    
    function showEditPais($params){
        $this->authHelper->checkAdmin();
    
        $id = $this->getID($params);
    
        $pais = $this->paisModel->getPaisesId($id);
        $cont = $this->contModel->getContinentes();
        $this->view->editPais($pais,$cont);    
    }
    
    function editPais($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        $pais = $_POST['pais_edit'];
        $cont = $_POST['cont_edit'];
    
        $this->paisModel->editPais($pais,$cont,$id);
        header("location:" . BASE_URL);
    }



    function addCont(){
        $this->authHelper->checkAdmin();

        $cont = $_POST['continente'];
    
        $this->contModel->addCont($cont);
        header("Location: " . BASE_URL);
    }
    
    function deleteCont($params){
        $this->authHelper->checkAdmin();
    
        $id = $this->getID($params);
    
        $this->contModel->deleteCont($id);
        header("Location: " . BASE_URL); 
        ob_end_flush();
    }
    
    function showEditCont($params){
        $this->authHelper->checkAdmin();
    
        $id = $this->getID($params);
    
        $this->view->editCont($this->contModel->getContId($id));    
    }
    
    function editCont($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);
        $cont = $_POST['cont_edit'];
    
        $this->contModel->editCont($cont,$id);
        header("location:" . BASE_URL);
    }



    function addTipo(){
        $this->authHelper->checkAdmin();

        $tipo = $_POST['tipo'];
        $golpe = $_POST['golpe'];
    
        $this->tiposModel->addTipo($tipo,$golpe);
        header("Location: " . BASE_URL);
    }

    function deleteTipo($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        $this->tiposModel->deleteTipo($id);
        header("Location: " . BASE_URL); 
        ob_end_flush();
    }

    function showEditTipo($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        $tipo = $this->tiposModel->getTipoId($id);
        $golpes = $this->golpeModel->getGolpes();
        $this->view->editTipo($tipo,$golpes);    
    }

    function editTipo($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);
        $tipo = $_POST['tipo_edit'];
        $golpe = $_POST['golpe_edit'];
    
        $this->tiposModel->editTipo($tipo,$golpe,$id);
        header("location:" . BASE_URL);
    }



    function addGolpe(){
        $this->authHelper->checkAdmin();

        $golpe = $_POST['golpe'];

        $this->golpeModel->addGolpe($golpe);
        header("location:" . BASE_URL);
    }

    function deleteGolpe($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        $this->golpeModel->deleteGolpe($id);
        header("location:" . BASE_URL);
    }

    function showEditGolpe($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);

        $this->view->editGolpe($this->golpeModel->getGolpeId($id));
    }

    function editGolpe($params){
        $this->authHelper->checkAdmin();

        $id = $this->getID($params);
        $golpe = $_POST['golpe_edit'];

        $this->golpeModel->editGolpe($golpe,$id);
        header("location:" . BASE_URL);
    }

}

?>