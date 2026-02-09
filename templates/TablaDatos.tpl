{include file="head.tpl"}

<main>
    <div class="tablas">
        <div>
            <table>
                <thead>
                    <tr>
                        <th>pais</th>
                        <th>continente</th>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$paises item=$pais }
                    <tr>
                        <td>{$pais->pais}</td>
                        <td>{$pais->continente}</td>
                        <td><div class="btnEditar"><a href='paisEdit/{$pais->id}'>editar</a></div></td>
                        <td><div class="btnEliminar"><a href='paisDelete/{$pais->id}'>borrar</a></div></td>
                    </tr>
                {/foreach}
                </tbody>
            </table>   
            <form method="post" action="addPais">   
                <input type="text" name="pais">
                <select name="continente">
                    {foreach from=$continentes item=$cont}
                        <option value="{$cont->id}">{$cont->continente}</option>
                    {{/foreach}}
                </select>
                <input type="submit">
            </form>
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>continente</th>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$continentes item=$cont }
                    <tr>
                        <td>{$cont->continente}</td>
                        <td><div class="btnEditar"><a href='contEdit/{$cont->id}'>editar</a></div></td>
                        <td><div class="btnEliminar"><a href='contDelete/{$cont->id}'>borrar</a></div></td>
                    </tr>
                {/foreach}
                </tbody>
            </table>   
            <form method="post" action="addContinente">
                <input type="text" name="continente">
                <input type="submit">
            </form>
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th>tipo de arma</th>
                        <th>golpe</th>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$tipos item=$tipo }
                    <tr>
                        <td>{$tipo->tipo}</td>
                        <td>{$tipo->golpe}</td>
                        <td><div class="btnEditar"><a href='tipoEdit/{$tipo->id}'>editar</a></div></td>
                        <td><div class="btnEliminar"><a href='tipoDelete/{$tipo->id}'>borrar</a></div></td>
                    </tr>
                {/foreach}
                </tbody>
            </table> 
            <form method="post" action="addTipo">
                <input type="text" name="tipo">
                <select name="golpe">
                    {foreach from=$golpes item=$golpe}
                        <option value="{$golpe->id}">{$golpe->golpe}</option>
                    {{/foreach}}
                </select>
                <input type="submit">
            </form>
        </div>    
        <div>
            <table>
                <thead>
                    <tr>   
                        <th>tipo de golpe</th>
                    </tr>
                </thead>
                <tbody>
                {foreach from=$golpes item=$golpe}
                    <tr>    
                        <td>{$golpe->golpe}</td>
                        <td><div class="btnEditar"><a href='golpeEdit/{$golpe->id}'>editar</a></div></td>
                        <td><div class="btnEliminar"><a href='golpeDelete/{$golpe->id}'>borrar</a></div></td> 
                    </tr>
                {/foreach}
                </tbody>
            </table> 
            <form method="post" action="addGolpe">
                <input type="text" name="golpe">
                <input type="submit">
            </form>
        </div>
    </div>
</main>
<a href="{BASE_URL}">volver</a>

{include file="foot.html"}