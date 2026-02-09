{include file="head.tpl"}

<header class="header" id="subir">
    <div class="arriba" id="arriba">
        <div class="mobile" id="mobile">
            <button id="abrirMenu" class="btn-menu">☰</button>
            <nav id="menuLateral" class="menu-lateral">
                <button id="cerrarMenu" class="cerrar-menu">✖</button>
                <div class="inico">
                    <a href="">inicio</a>
                </div>
                <div class="contenedor-mobile">
                    <div class="buscador">
                        <form id="buscador-mobile" method="post" action="buscarArma" enctype="multipart/form-data">
                            <input id="arma-mobile" type="text" name="buscador" placeholder="buscar" autocomplete="off">
                            <button type="submit">bus</button>
                            <input type="checkbox" class="toggle-filtros" id="toggle-filtros-mobile" hidden>
                            <label for="toggle-filtros-mobile" class="btn-filtros">⏷</label>
                            <div class="filtros-buscador">
                                <div><h3>filtros</h3></div>
                                <div class="filtros">
                                    <select name="tipo">
                                        <option value="">Todos los tipos</option>
                                        {foreach from=$tipos item=$tipo}
                                            <option value="{$tipo->id}">{$tipo->tipo}</option>
                                        {/foreach}
                                    </select>
                                    <select name="golpe">
                                        <option value="">Todos los golpes</option>
                                        {foreach from=$golpes item=$golpe}
                                            <option value="{$golpe->id}">{$golpe->golpe}</option>
                                        {/foreach}
                                    </select>
                                    <select name="pais">
                                        <option value="">Todos los países</option>
                                        {foreach from=$paises item=$pais}
                                            <option value="{$pais->id}">{$pais->pais}</option>
                                        {/foreach}
                                    </select>
                                    
                                    <select name="continente">
                                        <option value="">Todos los continentes</option>
                                        {foreach from=$continentes item=$cont}
                                            <option value="{$cont->id}">{$cont->continente}</option>
                                        {/foreach}
                                    </select>
                                </div>
                            </div>
                            <ul id="lista-buscador-mobile" style="display: none;"></ul>
                        </form>
                    </div>
                </div>
            </nav>
            <div class="log_usuario">
                {if !isset($payload.ID_USER)}
                    <a href="login" class="btn-login">Iniciar sesión</a>
                {else}
                    <div class="usuario-dropdown">
                        <button class="btn-usuario" id="toggleUsuarioMobile">👤 {$payload.USUARIO}</button>
                        <div class="menu-usuario" id="menuUsuarioMobile">
                            <button class="cerrar-usuario" id="cerrarUsuarioMobile">✕</button>
                            <a href="#bajar">Bajar</a>
                            <a href="logout">Cerrar sesión</a>
                        </div>
                    </div>
                    <div class="fondo-usuario" id="fondoUsuarioMobile"></div>
                {/if}
            </div>
            <div id="fondoMenu" class="fondo-menu"></div>
        </div>

        <div class="computadora">
            <div class="inico">
                <a href="">inicio</a>
            </div>
            <div class="buscador">
                <form id="buscador" method="post" action="buscarArma" enctype="multipart/form-data">
                    <input type="checkbox" class="toggle-filtros" id="toggle-filtros" hidden>
                    <label for="toggle-filtros" class="btn-filtros">⏷</label>
                    <input id="arma" type="text" name="buscador" placeholder="buscar" autocomplete="off"></input>
                    <button type="submit">buscar</button>
                    <div class="filtros-buscador">
                        <div>
                            <h3>filtros</h3>
                        </div>
                        <div class="filtros">
                            <select name="tipo">
                                <option value="">Todos los tipos</option>
                                {foreach from=$tipos item=$tipo}
                                    <option value="{$tipo->id}">{$tipo->tipo}</option>
                                {/foreach}
                            </select>
                            <select name="pais">
                                <option value="">Todos los países</option>
                                {foreach from=$paises item=$pais}
                                    <option value="{$pais->id}">{$pais->pais}</option>
                                {/foreach}
                            </select>
                            <select name="golpe">
                                <option value="">Todos los golpe</option>
                                {foreach from=$golpes item=$golpe}
                                    <option value="{$golpe->id}">{$golpe->golpe}</option>
                                {{/foreach}}
                            </select>
                            <select name="continente">
                                <option value="">Todos los continentes</option>
                                {foreach from=$continentes item=$cont}
                                    <option value="{$cont->id}">{$cont->continente}</option>
                                {/foreach}
                            </select>
                        </div>
                    </div>
                </form>
                <ul id="lista-buscador" style="display: none;"></ul>
            </div>
            <div class="log_usuario">
                {if !isset($payload.ID_USER)}
                    <a href="login" class="btn-login"> Iniciar sesión</a>
                {else}
                    <div class="usuario-dropdown">
                        <button class="btn-usuario" id="toggleUsuario">👤 {$payload.USUARIO}</button>
                        <div class="menu-usuario" id="menuUsuario">
                            <a href="#bajar">Bajar</a>
                            <a href="logout">Cerrar sesión</a>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
    <nav class="navegador">
        {if isset($tipos) or isset($golpes) or isset($paises) or isset($continentes)}
        <ul>
            <li><a href="#">armas</a>
                <ul class="menu-lista">
                    <div>
                    {foreach from=$tipos item=$tipo}
                        <a href="arma/tipo/{$tipo->id}"><li><div>{$tipo->tipo}</div></li></a>
                    {/foreach}
                    </div>
                </ul>
            </li>
            <li><a href="#">daño</a>
                <ul class="menu-lista">
                    <div>
                    {foreach from=$golpes item=$golpe}
                        <a href="arma/golpe/{$golpe->id}"><li><div> Armas {$golpe->golpe}</div></li></a>
                    {/foreach}
                    </div>
                </ul>
            </li>
            <li><a href="#">pais</a>
                <ul class="menu-lista">
                    <div>
                    {foreach from=$paises item=$pais}
                        <a href="arma/origen/{$pais->id}"><li><div> Armas de {$pais->pais}</div></li></a>
                    {/foreach}
                    </div>
                </ul>
            </li>
            <li><a href="#">continente</a>
                <ul class="menu-lista">
                    <div>
                    {foreach from=$continentes item=$cont}
                        <a href="arma/continente/{$cont->id}"><li><div> Armas de {$cont->continente}</div></li></a>
                    {/foreach}
                    </div>
                </ul>
            </li>
        </ul>
        {/if}
    </nav>
</header> 