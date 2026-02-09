{include file="head.tpl"}

<div class="formularios">
    <div class="home">
        <div class="formulario">
            <div class="form-head">
                <h1>inicio Sesion</h1>
            </div>
            <div class="form-body">
                <form id="formLogin" method="post">
                    <div class="form-group">
                        <label for="mail">mail</label>
                        <input type="mail" required name="mail" aria-describedby="mailHelp" id="usuario">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" required name="password" id="contraseña">
                    </div>

                    {if $error} 
                        <div>
                            {$error}
                        </div>
                    {/if}
                    <button type="submit">Entrar</button>
                </form>
            </div>
        </div>
    </div>
    <div class="home">
        <div class="formulario">
            <div class="form-head">
                <h1>registrar</h1>
            </div>
            <div class="form-body">
                <form method="POST" action="registrar">
                    <div class="form-group">
                        <label for="mail">mail</label>
                        <input type="mail" required name="mail" aria-describedby="mailHelp">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" required name="password">
                    </div>
                    <button type="submit">Registrar</button>
                </form>
            </div>
        </div>
    </div>
</div>

<a href="{BASE_URL}">volver</a>

<script src="http://localhost/ARMAS/js/login.js"></script>

{include file="foot.html"}