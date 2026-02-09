{include file="header.tpl"}

<main class="arma-unica">
    <div class="imagenArma-unica">
        <img src="./{$arma[0]->imagen}" alt="{$arma[0]->arma}">
    </div>
    <table> 
        <tr><td>Nombre: {$arma[0]->arma}</td></tr>
        <tr><td>Tipo: {$arma[0]->tipo}</td></tr>
        <tr><td>Origen: {$arma[0]->pais}</td></tr>
    </table>
</main>

{include file="foot.html"}
