{include file="head.tpl"}

<form method="post" action="editTipo/{$tipo[0]->id}">
    <input type="text" name="tipo_edit" value='{$tipo[0]->tipo}'>
    <select name="golpe_edit">
        <option value="{$tipo[0]->id_golpe}">{$tipo[0]->golpe}</option>
        {foreach from=$golpes item=$golpe}
            <option value="{$golpe->id}">{$golpe->golpe}</option>
        {{/foreach}}
    </select>
    <input type="submit">
</form>    

{include file="foot.html"}