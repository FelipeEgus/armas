"use strict"

console.log("cargado");

document.getElementById('edit-arma').addEventListener('submit', async function (e) {
    e.preventDefault(); // Evita que se recargue la página
    
    console.log("adentro");
    
    const form = e.target;
    const Data = new FormData(form);

    const id = this.dataset.id;
        
    if (!id) return;
    
    try {
                
        const response = await fetch(`/armas/editArma/${id}`, {
            method: 'POST',
            body: Data
        });

        const result = await response.json();
        console.log('Respuesta del servidor:', result);
        window.location.href = '/armas/home';

    } catch (error) {
        console.error('Error al enviar el formulario:', error);
    }
});