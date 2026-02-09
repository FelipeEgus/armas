{include file="head.tpl"}

    <form id="edit-arma" data-id='{$arma[0]->id}' enctype="multipart/form-data">
        <input type="text" name="arma_edit" value='{$arma[0]->arma}'>
        <select name="origen_edit">
            <option value="{$arma[0]->fk_pais}">{$arma[0]->pais}</option>
            {foreach from=$paises item=$pais}
                <option value="{$pais->id}">{$pais->pais}</option>
            {{/foreach}}
        </select>
        <select name="tipo_edit">
            <option value="{$arma[0]->fk_tipo}">{$arma[0]->tipo}</option>
            {foreach from=$tipos item=$tipo}
                <option value="{$tipo->id}">{$tipo->tipo}</option>
            {{/foreach}}
        </select>
        <input type="hidden" name="vieja_imagen" value="{$arma[0]->imagen}">
        <input type="file" name="nueva_imagen">subir imagen</input>
        <input type="submit">
    </form>    

<script src="http://localhost/ARmAS/js/edit.js"></script>

{include file="foot.html"}
