{include file="head.tpl"}

<form method="post" action="editGolpe/{$golpe[0]->id}">
    <input type="text" name="golpe_edit" value='{$golpe[0]->golpe}'>
    <input type="submit">
</form>    

{include file="foot.html"}