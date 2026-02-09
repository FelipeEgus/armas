{include file="header.tpl"}

{* <pre>
{$payload|@print_r}
</pre> *}

<h1>Administración de Armas Borradas</h1>
{if !empty($borradas)}
<table class="borradosTable"> 
    <tbody id="">
    {foreach from=$borradas item=$arma}
        <tr id='deleted-{$arma->id}'>
            <td>{$arma->arma}</td>
            <td>{$arma->pais}</td>
            <td>{$arma->tipo}</td>
            <td>{$arma->imagen}</td>
            {if isset($payload) and $payload.ROLE == 4}
            <td><a href="#" class="delete" data-id="{$arma->id}" id="delete-deleted"><button>Eliminar</button></a></td>
            <td>
                <form id="form-agregar" method="post" action="#" data-id="{$arma->id}">
                    <input type="hidden" name="arma" value="{$arma->arma}">
                    <input type="hidden" name="origen" value="{$arma->fk_pais}">
                    <input type="hidden" name="tipo" value="{$arma->fk_tipo}">
                    <input type="hidden" name="imagen" value="{$arma->imagen}">
                    <button type="submit" class="agregar-arma"> agregar </button>
                </form>
            </td>
            {/if}
        </tr>
    {/foreach}
    </tbody>
</table>
{else} 
    <h3> no hay armas borradas </h3>
{/if}

<h1>Administración de Armas Editadas</h1>
{if !empty($editadas)}
<table class="editadasTable"> 
    <tbody id="">
    {foreach from=$editadas item=$arma}
        <tr id='edited-{$arma->id}'>
            <td>{$arma->arma}</td>
            <td>{$arma->pais}</td>
            <td>{$arma->tipo}</td>
            <td>{$arma->imagen}</td>
            {if isset($payload) and $payload.ROLE == 4}
            <td><a href="#" class="edit" data-id="{$arma->id}" id="delete-edited"><button>Eliminar</button></a></td>
            <td>
                <form id="form-editar" method="post" data-id="{$arma->id_original}">
                    <input type="hidden" name="arma_edit" value="{$arma->arma}">
                    <input type="hidden" name="origen_edit" value="{$arma->fk_pais}">
                    <input type="hidden" name="tipo_edit" value="{$arma->fk_tipo}">
                    <input type="hidden" name="vieja_imagen" value="{$arma->imagen}">
                    <button type="submit" class="agregar-arma"> cambiar </button>
                </form>
            </td>
            {/if}
        </tr>
    {/foreach}
    </tbody>
</table>
{else} 
    <h3> no hay armas editadas </h3>
{/if}

<script src="http://localhost/ARmAS/js/armasAlteradas.js"></script>
<script src="http://localhost/ARmAS/js/buscador.js"></script>

{include file="foot.html"}