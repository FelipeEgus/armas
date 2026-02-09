{include file="header.tpl"}
{* <pre>
{$armas|@print_r}
</pre> *}
<main>
    {if empty($armas)}
        <h1>no se encontraron armas con esas caracteristicas</h1>
    {/if}
    <div class="armas">
    {assign var="ultimoTipo" value=""}
    {assign var="grupoAbierto" value=false}

    {foreach from=$armas item=$arma}
        {if $arma->tipo != $ultimoTipo}
            {if $grupoAbierto}
                    </div> 
                </div> 
            {/if}

            <div class="grupo-tipo" id="tipo-{$arma->tipo|replace:' ':'_'}">
            <input type="checkbox" id="toggle-{$arma->tipo}" class="toggle-tipo" hidden checked>
            <label for="toggle-{$arma->tipo}" class="btn-toggle">
                <span class="flecha">⏷</span>
                <h2 class="titulo-tipo">{$arma->tipo}</h2>
            </label>
            <div class="grupo-armas">
            {assign var="grupoAbierto" value=true}
            {assign var="ultimoTipo" value=$arma->tipo}
        {/if}

        <!-- Ahora sí: arma dentro del grupo -->
        <div class="arma" id="arma-{$arma->id}">
            <div class="imagenArma">
                <img src="./{$arma->imagen}"></img>
            </div>
            <div class=" textoArma">      
                <div class="datos">
                    <table> 
                        <tr>
                            <td>Nombre: {$arma->arma}</td>
                        </tr>
                        <tr>
                            <td>Tipo: {$arma->tipo}</td>
                        </tr>
                        <tr>
                            <td>Origen: {$arma->pais}</td>
                        </tr>
                    </table>
                </div>
                <div class="btns">
                        <a href="arma/{$arma->id}"><div class="btnVer btn-arma" >ver</div></a>                    
                        {if isset($payload.ROLE) and $payload.ROLE != '2' }
                                <a href='armaEdit/{$arma->id}'><div class="btnEditar btn-arma">editar</div></a>
                                <a href="#" data-id='{$arma->id}' id="delete-arma"><div class="btnEliminar btn-arma">borrar</div></a>
                        {/if}
                </div>
            </div>
        </div> 
        
    {/foreach}
    {if $grupoAbierto}
        </div> <!-- cerrar el último grupo-armas -->
    {/if}
    </div>
    <br id="bajar">
    {if isset($payload.ID_USER)}
        {if $payload.ROLE != '2'}
            <form id="add-arma" enctype="multipart/form-data">
                <input type="text" class="x" name="arma" >
                <select  name="origen">
                {foreach from=$paises item=$pais}
                    <option value="{$pais->id}">{$pais->pais}</option>
                {/foreach}
                </select>
                <select name="tipo">
                {foreach from=$tipos item=$tipo}
                    <option value="{$tipo->id}">{$tipo->tipo}</option>
                {/foreach}
                </select>
                <input type="file" name="imagen"></input>
                <input type="submit">
            </form>
            <div class="botones">
                <a href="#subir">
                    <div class="btn">subir</div> 
                </a>
                <br>
                <a href="formAddArmas">
                    <div class="btn">armas rapido</div>
                </a> 
                <br>
                <a href="DatosArmas">
                    <div class="btn">datos de las armas</div> 
                </a>
                <br>
                {if $payload.ROLE == '4'}
                    <a href="armasAlteradas">
                        <div class="btn">armas-alteradas</div> 
                    </a>
                {/if}
                <br>
                <a href="usuarios">
                    <div class="btn">usuarios</div> 
                </a>
                <br>
                <br>
            </div>
            {if !empty($sinImg)}
            <div class="sinImg">
                {foreach from=$sinImg item=$arma}
                <li id="img-{$arma->id}">
                    {$arma->arma} 
                    <form id="addImg" data-id="{$arma->id}" enctype="multipart/form-data">
                        <input type="file" name="addImg"></input>
                        <input type="submit">
                    </form>
                </li>    
                {/foreach}
            </div>
            {/if}
        {/if}
        <div class="cantidades">
            <table>
                <thead>
                    <tr>
                        <th>cant</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>{$cantTotal[0]->cant}</td>
                    </tr>
                </tbody>
            </table>
            <table>
                <thead>
                    <tr>
                        <th>daño</th>
                        <th>cant</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$cantGolpe item=$arma }
                        <tr>
                            <td>{$arma->golpe}</td>
                            <td>{$arma->cant}</td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
            <table>
                <thead>
                    <tr>
                        <th>arma</th>
                        <th>cant</th>
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$cantArmas item=$arma }
                        <tr>
                            <td>{$arma->tipo}</td>
                            <td>{$arma->cant}</td>
                        </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>      
    {/if}

</main>

<script src="http://localhost/ARmAS/js/home.js"></script>
<script src="http://localhost/ARMaS/js/buscador.js"></script>

{include file="foot.html"}
