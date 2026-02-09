"use strict"

document.querySelectorAll('#delete-deleted').forEach(el => {
    el.addEventListener('click', async function (e) {
    e.preventDefault(); 

    const form = e.target;

    const id = this.dataset.id;

    console.log("ID del arma:", id);
    try {
        
        const response = await fetch(`/armas/borradosDelete/${id}`, {
            method: 'GET',
        });

        const result = await response.json();

        if (result.success) {
            console.log('Arma añadida:', result.mensaje);
            let borradaDiv = document.getElementById(`deleted-${id}`);
            if (borradaDiv) borradaDiv.remove();
        }

    } catch (error) {
        console.error('Error al enviar el formulario:', error);
    }
});
});

document.querySelectorAll('#form-agregar').forEach(el => {
    el.addEventListener('submit', async function (e) {
    e.preventDefault(); 

    const form = e.target;
    const Data = new FormData(form);

    const id = this.dataset.id;
    console.log("ID del arma:", id);
    try {
        
        const response = await fetch('/armas/addArmaBorrada', {
            method: 'POST',
            body: Data
        });

        const result = await response.json();

        if (result.success) {
            console.log('Arma añadida:', result.mensaje);
            let borradaDiv = document.getElementById(`arma-${id}`);
            if (borradaDiv) borradaDiv.remove();
        }

    } catch (error) {
        console.error('Error al enviar el formulario:', error);
    }
});
});

/*-------------------------------------------------------------------------------------------------------------------*/

document.querySelectorAll('#delete-edited').forEach(el => {
    el.addEventListener('click', async function (e) {

    e.preventDefault(); 

    const form = e.target;

    const id = this.dataset.id;

    try {
        
        const response = await fetch(`/armas/editadosDelete/${id}`, {
            method: 'GET',
        });

        const result = await response.json();

        if (result.success) {
            console.log('Arma añadida:', result.mensaje);
            let editedDiv = document.getElementById(`edited-${id}`);
            if (editedDiv) editedDiv.remove();
        }

    } catch (error) {
        console.error('Error al enviar el formulario:', error);
    }
});
});

document.querySelectorAll('#form-editar').forEach(el => {
    el.addEventListener('submit', async function (e) {

    e.preventDefault(); 

    const edtiForm = e.target;
    const editedData = new FormData(edtiForm);

    const id = this.dataset.id;
    console.log("ID del arma:", id);

    try {
   
        const response = await fetch(`/armas/editadosEdit/${id}`, {
            method: 'POST',
            body: editedData
        });

        const result = await response.json();

        if (result.success) {
            console.log('Arma añadida:', result.mensaje);
            let editedDivEdit = document.getElementById(`edited-${id}`);
            if (editedDivEdit) editedDivEdit.remove();
        }

    } catch (error) {
        console.error('Error al enviar el formulario:', error);
    }
});
});