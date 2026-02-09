{include file="head.tpl"}

<form method="post" action="editPais/{$pais[0]->id}">
    <input type="text" name="pais_edit" value='{$pais[0]->pais}'>
    <select name="cont_edit">
        <option value="{$pais[0]->id_continente}">{$pais[0]->continente}</option>
        {foreach from=$conts item=$cont}
            <option value="{$cont->id}">{$cont->continente}</option>
        {{/foreach}}
    </select>
    <input type="submit">
</form>    

{include file="foot.html"}