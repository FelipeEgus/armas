{include file="head.tpl"}
<form method="post" action="addArmas" enctype="multipart/form-data" >
    {for $i=1 to 20}
        <input type="text" class="x" name="arma{$i}" >
        <select name="origen{$i}">
            {foreach from=$paises item=$pais}
                <option value="{$pais->id}">{$pais->pais}</option>
            {{/foreach}}
        </select>
        <select name="tipo{$i}">
            {foreach from=$tipos item=$tipo}
                <option value="{$tipo->id}">{$tipo->tipo}</option>
            {{/foreach}}
        </select>
        <input type="file" name="imagen{$i}"></input>
    {/for}
    <input type="submit">
</form> 
<a href="{BASE_URL}">volver</a>

{include file="foot.html"}