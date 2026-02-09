{include file="header.tpl"}

<h1>Administración de Usuarios</h1>

<table class="tablaUsuarios"> 
    <thead>
    <tr>
        <th>Mail</th>
        <th>Nombre</th>
        <th>Rol</th>
    </tr>
    </thead>
    <tbody id="userTableBody">
    {foreach from=$user item=$us}
        <tr>
            <td>{$us->mail}</td>
            <td>{$us->usuario}</td>
            <td>{$us->rol}</td>
            {* <td>
                <a class="edit">Editar</a>
                <a  href="" class="delete">Eliminar</a>
            </td> *}
        </tr>
    {/foreach}
    </tbody>
</table>

<script src="http://localhost/ARmAS/js/buscador.js"></script>

{include file="foot.html"}