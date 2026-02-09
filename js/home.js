"use strict"

document.getElementById('add-arma').addEventListener('submit', async function (e) {
    e.preventDefault(); 

    const form = e.target;
    const Data = new FormData(form);
    
    try {
        
        const response = await fetch('/armas/addArma', {
            method: 'POST',
            body: Data
        });
        
        const result = await response.json();
        console.log('Respuesta del servidor:', result);

        if (result.success) {
            const arma = result.arma;
            const valorTipo = `#tipo-${arma[0].tipo.replace(/\s+/g, '_')}`;
            const grupoTipo = document.querySelector(valorTipo);
            const contenedor = grupoTipo?.querySelector('.grupo-armas');

            const div = document.createElement('div');
            div.classList.add('arma');
            div.id = `arma-${arma[0].id}`;

            div.innerHTML = `
                <div class="imagenArma">
                    <img src="./${arma[0].imagen}" />
                </div>
                <div class="textoArma">      
                    <div class="datos">
                        <table> 
                            <tr><td>Nombre: ${arma[0].arma}</td></tr>
                            <tr><td>Tipo: ${arma[0].tipo}</td></tr>
                            <tr><td>Origen: ${arma[0].pais}</td></tr>
                        </table>
                    </div>
                    <div class="btns">
                        <a href="arma/{$arma->id}"><div class="btnVer btn-arma" >ver</div></a>                    
                        <a href='armaEdit/{$arma->id}'><div class="btnEditar btn-arma">editar</div></a>
                        <a href="#" data-id='${arma[0].id}' id="delete-arma"><div class="btnEliminar btn-arma">borrar</div></a>
                    </div>
                </div>
            `;

            div.querySelector('#delete-arma').addEventListener('click', eliminarArma);

            contenedor.appendChild(div); // o prependChild si querés que se vea arriba

            form.reset();
        }

    } catch (error) {
        console.error('Error al enviar el formulario:', error);
    }
});

document.querySelectorAll('#delete-arma').forEach(el => {
    el.addEventListener('click', eliminarArma)
});

function eliminarArma(e) {
    e.preventDefault();

    const id = e.currentTarget.dataset.id;
    if (!id) return;

    fetch(`/armas/armaDelete/${id}`, { method: 'GET' })
        .then(response => response.text())
        .then(text => {
            const result = text ? JSON.parse(text) : null;

            if (result?.success) {
                console.log('Arma eliminada:', result.mensaje);
                const armaDiv = document.getElementById(`arma-${id}`);
                if (armaDiv) armaDiv.remove();
            } else {
                console.error('Error del servidor:', result?.mensaje || 'Respuesta vacía o inválida');
            }
        })
        .catch(error => {
            console.error('Error al eliminar el arma:', error);
        });
}

document.querySelectorAll('#addImg').forEach(el => {
    el.addEventListener('submit', async function (e) {

    e.preventDefault(); 

    const imgForm = e.target;
    const img = new FormData(imgForm);

    const id = this.dataset.id;
    console.log("ID del arma:", id);
    console.log("imagen:", img.entries);

    const obj = Object.fromEntries(img.entries());
    console.log(obj);

    try {
   
        const response = await fetch(`/armas/addImg/${id}`, {
            method: 'POST',
            body: img
        });

        const result = await response.json();

        if (result.success) {
            console.log('imagen añadida:', result.mensaje);
            var imgDiv = document.getElementById(`img-${id}`);
            if (imgDiv) imgDiv.remove();
        }

    } catch (error) {
        console.error('Error al enviar el formulario:', error);
    }
});
});
