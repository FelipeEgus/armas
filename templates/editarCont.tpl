{include file="head.tpl"}

<form method="post" action="editCont/{$cont[0]->id}">
    <input type="text" name="cont_edit" value='{$cont[0]->continente}'>
    <input type="submit">
</form>    

{include file="foot.html"}