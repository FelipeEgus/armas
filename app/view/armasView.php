<?php

include_once "libs/smarty/libs/Smarty.class.php";

class armasView{

    protected $smarty;

    public function __CONSTRUCT(){
        $this->smarty = new Smarty;
    }

    function home($armas,$paises,$cont,$tipos,$golpes,$payload,$cantTotal = null,$cantArmas = null,$cantGolpe = null,$sinImg = null){
        $this->smarty->assign('armas',$armas);
        $this->smarty->assign('paises',$paises);
        $this->smarty->assign('continentes',$cont);
        $this->smarty->assign('tipos',$tipos);
        $this->smarty->assign('golpes',$golpes);
        $this->smarty->assign('payload', (array) $payload);
        if(isset($cantTotal,$cantArmas,$cantGolpe,$sinImg)){
            $this->smarty->assign('cantTotal',$cantTotal);
            $this->smarty->assign('cantArmas',$cantArmas);
            $this->smarty->assign('cantGolpe',$cantGolpe);
            $this->smarty->assign('sinImg',$sinImg);
        }
        $this->smarty->display('templates/index.tpl');
    }

    function armasAlteradas($borradas,$editadas,$payload){
        $this->smarty->assign('borradas',$borradas);
        $this->smarty->assign('editadas',$editadas);
        $this->smarty->assign('payload', (array) $payload);
        $this->smarty->display('templates/armasAlteradas.tpl');
    }

    function unico($arma,$paises,$cont,$tipos,$golpes,$payload){
        $this->smarty->assign('arma',$arma);
        $this->smarty->assign('paises',$paises);
        $this->smarty->assign('continentes',$cont);
        $this->smarty->assign('tipos',$tipos);
        $this->smarty->assign('golpes',$golpes);
        $this->smarty->assign('payload', (array) $payload);
        $this->smarty->display('templates/solo.tpl');
    }

    function showDatos($paises,$cont,$tipos,$golpes){
        $this->smarty->assign('paises',$paises);
        $this->smarty->assign('continentes',$cont);
        $this->smarty->assign('tipos',$tipos);
        $this->smarty->assign('golpes',$golpes);
        $this->smarty->display('templates/TablaDatos.tpl');
    }

    function formArmas($armas,$paises,$tipos){
        $this->smarty->assign('armas',$armas);
        $this->smarty->assign('paises',$paises);
        $this->smarty->assign('tipos',$tipos);
        $this->smarty->display('templates/formArmas.tpl');
    }

    function editArma($arma,$paises,$tipos){
        $this->smarty->assign('arma',$arma);
        $this->smarty->assign('paises',$paises);
        $this->smarty->assign('tipos',$tipos);
        $this->smarty->display('templates/editarArma.tpl');
    }

    function editArmas($arma,$paises,$tipos,$offset){
        $this->smarty->assign('arma',$arma);
        $this->smarty->assign('paises',$paises);
        $this->smarty->assign('tipos',$tipos);
        $this->smarty->assign('off',$offset);
        $this->smarty->display('templates/editarArmas.tpl');
    }

    function editPais($pais,$conts){
        $this->smarty->assign('pais',$pais);
        $this->smarty->assign('conts',$conts);
        $this->smarty->display('templates/editarPais.tpl');
    }

    function editCont($cont){
        $this->smarty->assign('cont',$cont);
        $this->smarty->display('templates/editarCont.tpl');
    }

    function editTipo($tipo,$golpes){
        $this->smarty->assign('tipo',$tipo);
        $this->smarty->assign('golpes',$golpes);
        $this->smarty->display('templates/editarTipo.tpl');
    }

    function editGolpe($golpe){
        $this->smarty->assign('golpe',$golpe);
        $this->smarty->display('templates/editarGolpe.tpl');   
    }

}

?>