"use strict"

document.querySelector('#formLogin').addEventListener('submit', async function (e) {

  e.preventDefault(); // Evitar que el form recargue la página

  const mail = document.querySelector('#usuario').value;
  const password = document.querySelector('#contraseña').value;

  try {
    console.log('entrando al try');

    const res = await fetch('/armas/validar', {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ mail, password })
    });

    if (res.ok) {
      window.location.href = '/armas/home';
    } else {
      alert('Login fallido');
    }

  }catch(e){
    console.log('hay un error');
    alert('Error en la petición');
  }
  
});
