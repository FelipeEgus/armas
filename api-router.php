<?php
require_once './libs/Router.php';
require_once './app/controller/armasController.php';
require_once './app/controller/userController.php';
require_once './app/controller/authController.php';

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/'."home");

$router = new Router();

$router->addRoute("home", "GET", "armasController", "showHome");
$router->addRoute("arma/:ID", "GET", "armasController", "showArma");
$router->addRoute("arma/tipo/:ID", "GET", "armasController", "showTipo");
$router->addRoute("arma/origen/:ID", "GET", "armasController", "showOrigen");
$router->addRoute("arma/golpe/:ID", "GET", "armasController", "showGolpe");
$router->addRoute("arma/continente/:ID", "GET", "armasController", "showCont");
$router->addRoute("addArma", "POST", "armasController", "addArma");
$router->addRoute("formAddArmas", "GET", "armasController", "showAddArmas");
$router->addRoute("addArmas", "POST", "armasController", "addArmas");
$router->addRoute("armaDelete/:ID", "GET", "armasController", "deleteArma");
$router->addRoute("armaEdit/:ID", "GET", "armasController", "showEditArma");
$router->addRoute("editArma/:ID", "POST", "armasController", "editArma");
$router->addRoute("addImg/:ID", "POST", "armasController", "editArmaImg");
$router->addRoute("buscarArma", "POST", "armasController", "buscarArma");
$router->addRoute("buscarAJAX", "POST", "armasController", "buscarArmaAJAX");
$router->addRoute("DatosArmas","GET","armasController","showDatos");

$router->addRoute("armasAlteradas","GET","armasController","getArmasAlteradas");
$router->addRoute("addArmaBorrada","POST","armasController","addArmaBorrada");
$router->addRoute("borradosDelete/:ID","GET","armasController","deleteDeleted");
$router->addRoute("editadosEdit/:ID","POST","armasController","editEdited");
$router->addRoute("editadosDelete/:ID","GET","armasController","deleteEdited");

$router->addRoute("addPais", "POST", "armasController", "addPais");
$router->addRoute("paisDelete/:ID","GET","armasController","deletePais");
$router->addRoute("paisEdit/:ID", "GET", "armasController", "showEditPais");
$router->addRoute("editPais/:ID", "POST", "armasController", "editPais");

$router->addRoute("addContinente", "POST", "armasController", "addCont");
$router->addRoute("contDelete/:ID","GET","armasController","deleteCont");
$router->addRoute("contEdit/:ID", "GET", "armasController", "showEditCont");
$router->addRoute("editCont/:ID", "POST", "armasController", "editCont");

$router->addRoute("addTipo", "POST", "armasController", "addTipo");
$router->addRoute("tipoDelete/:ID","GET","armasController","deleteTipo");
$router->addRoute("tipoEdit/:ID", "GET", "armasController", "showEditTipo");
$router->addRoute("editTipo/:ID", "POST", "armasController", "editTipo");

$router->addRoute("addGolpe", "POST", "armasController", "addGolpe");
$router->addRoute("golpeDelete/:ID", "GET", "armasController", "deleteGolpe");
$router->addRoute("golpeEdit/:ID", "GET", "armasController", "showEditGolpe");
$router->addRoute("editGolpe/:ID", "POST", "armasController", "editGolpe");

$router->addRoute("login", "GET", "userController","showLogin");
$router->addRoute("logout", "GET", "userController","logout");
$router->addRoute("registrar","POST","userController","registerUser");
$router->addRoute("usuarios","GET","userController","showUsers");
$router->addRoute("validar","POST","authController","getToken");

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);

?>