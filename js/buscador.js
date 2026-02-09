"use strict"

// const input = document.getElementById("arma");
// const lista = document.getElementById("lista-buscador");
// const checkbox = document.getElementById("toggle-filtros");
// let currentFocus = -1;

// // 👇 Manejo de navegación con teclado
// document.getElementById("buscador").addEventListener("keydown", function (e) {
//     const items = lista.querySelectorAll("li");

//     switch (e.key) {
//         case "ArrowDown":
//             currentFocus++;
//             if (currentFocus >= items.length) currentFocus = 0;
//             setActive(items, currentFocus);
//             e.preventDefault();
//             return;

//         case "ArrowUp":
//             currentFocus--;
//             if (currentFocus < 0) currentFocus = items.length - 1;
//             setActive(items, currentFocus);
//             e.preventDefault();
//             return;

//         case "Enter":
//             if (currentFocus > -1 && items.length > 0) {
//                 e.preventDefault();
//                 items[currentFocus].click();
//             }
//             return;
//     }
// });

// input.addEventListener("input", async function () {
//     const arma = input.value.trim();
//     currentFocus = -1;

//     if (arma.length === 0) {
//         lista.innerHTML = '';
//         lista.style.display = 'none';
//         return;
//     }

//     const formData = new FormData();
//     formData.append("buscador", arma);

//     try {
//         const response = await fetch("/armas/buscarAJAX", {
//             method: "POST",
//             body: formData
//         });

//         const data = await response.json();
//         lista.innerHTML = '';

//         if (data.length > 0) {
//             if(!checkbox.checked){
//                 data.forEach(arma => {
//                     const li = document.createElement('li');
//                     li.textContent = arma.arma;
//                     li.style.padding = '5px';
//                     li.style.cursor = 'pointer';

//                     li.addEventListener('mouseover', () => {
//                         input.value = arma.arma;
//                     });

//                     li.addEventListener('click', () => {
//                         input.value = arma.arma;
//                         lista.innerHTML = '';
//                         lista.style.display = 'none';
//                     });

//                     lista.appendChild(li);
//                 });

//                 lista.style.display = 'block';
//             }
//         } else {
//             lista.innerHTML = '<li>No se encontraron resultados</li>';
//             lista.style.display = 'block';
//         }
//     } catch (error) {
//         console.error("Error:", error);
//         lista.innerHTML = '';
//         lista.style.display = 'none';
//     }
// });

// function setActive(items, index) {
//     if (!items || items.length === 0) return;

//     items.forEach(item => item.classList.remove("active"));

//     if (items[index]) {
//         items[index].classList.add("active");
//         items[index].scrollIntoView({ block: "nearest" });
//     }
// }

// document.querySelector('#buscador').addEventListener('submit', async function (e) {

//     e.pr    

// });

function setupBuscador(inputElement, listaElement, filtroCheckbox = null) {
    let currentFocus = -1;

    inputElement.addEventListener("keydown", function (e) {
        const items = listaElement.querySelectorAll("li");

        switch (e.key) {
            case "ArrowDown":
                currentFocus++;
                if (currentFocus >= items.length) currentFocus = 0;
                setActive(items, currentFocus);
                e.preventDefault();
                break;

            case "ArrowUp":
                currentFocus--;
                if (currentFocus < 0) currentFocus = items.length - 1;
                setActive(items, currentFocus);
                e.preventDefault();
                break;

            case "Enter":
                if (currentFocus > -1 && items.length > 0) {
                    e.preventDefault();
                    items[currentFocus].click();
                }
                break;
        }
    });

    inputElement.addEventListener("input", async function () {
        const texto = inputElement.value.trim();
        currentFocus = -1;

        if (texto.length === 0) {
            listaElement.innerHTML = '';
            listaElement.style.display = 'none';
            return;
        }

        const formData = new FormData();
        formData.append("buscador", texto);

        try {
            const response = await fetch("/armas/buscarAJAX", {
                method: "POST",
                body: formData
            });

            const data = await response.json();
            listaElement.innerHTML = '';

            if (data.length > 0) {
                if(!filtroCheckbox.checked){
                    data.forEach(arma => {
                        const li = document.createElement('li');
                        li.textContent = arma.arma;
                        li.style.padding = '5px';
                        li.style.cursor = 'pointer';

                        li.addEventListener('mouseover', () => {
                            inputElement.value = arma.arma;
                        });

                        li.addEventListener('click', () => {
                            inputElement.value = arma.arma;
                            listaElement.innerHTML = '';
                            listaElement.style.display = 'none';
                        });

                        listaElement.appendChild(li);
                    });

                    listaElement.style.display = 'block';
                }
            } else {
                listaElement.innerHTML = '<li>No se encontraron resultados</li>';
                listaElement.style.display = 'block';
            }
        } catch (error) {
            console.error("Error en autocompletado:", error);
        }
    });
}

function setActive(items, index) {
    if (!items || items.length === 0) return;

    items.forEach(item => item.classList.remove("active"));

    if (items[index]) {
        items[index].classList.add("active");
        items[index].scrollIntoView({ block: "nearest" });
    }
}

document.addEventListener("DOMContentLoaded", () => {
    const armaDesktop = document.getElementById("arma");
    const listaDesktop = document.getElementById("lista-buscador");
    const filtroDesktop = document.getElementById("toggle-filtros");

    const armaMobile = document.getElementById("arma-mobile");
    const listaMobile = document.getElementById("lista-buscador-mobile");
    const filtroMobile = document.getElementById("toggle-filtros-mobile");

    if (armaDesktop && listaDesktop)
        setupBuscador(armaDesktop, listaDesktop, filtroDesktop);

    if (armaMobile && listaMobile)
        setupBuscador(armaMobile, listaMobile, filtroMobile);
});






const abrirMenu = document.getElementById('abrirMenu');
const cerrarMenu = document.getElementById('cerrarMenu');
const menuLateral = document.getElementById('menuLateral');
const fondoMenu = document.getElementById('fondoMenu');
const mobile = document.getElementById('mobile');

abrirMenu.addEventListener('click', () => {
    menuLateral.classList.add('abierto');
    fondoMenu.classList.add('visible');
});

cerrarMenu.addEventListener('click', () => {
    menuLateral.classList.remove('abierto');
    fondoMenu.classList.remove('visible');
});

fondoMenu.addEventListener('click', () => {
    menuLateral.classList.remove('abierto');
    fondoMenu.classList.remove('visible');
});

document.getElementById("toggleUsuario")?.addEventListener("click", function () {
    const menu = document.getElementById("menuUsuario");
    menu.style.display = (menu.style.display === "block") ? "none" : "block";
});

document.addEventListener("click", function (e) {
    const toggle = document.getElementById("toggleUsuario");
    const menu = document.getElementById("menuUsuario");
    if (!toggle || !menu) return;

    if (!toggle.contains(e.target) && !menu.contains(e.target)) {
        menu.style.display = "none";
    }
});

const toggleUsuarioMobile = document.getElementById("toggleUsuarioMobile");
const menuUsuarioMobile = document.getElementById("menuUsuarioMobile");
const fondoUsuarioMobile = document.getElementById("fondoUsuarioMobile");
const cerrarUsuarioMobile = document.getElementById("cerrarUsuarioMobile");

toggleUsuarioMobile?.addEventListener("click", () => {
    menuUsuarioMobile?.classList.add("abierto");
    fondoUsuarioMobile?.classList.add("visible");
});

cerrarUsuarioMobile?.addEventListener("click", () => {
    menuUsuarioMobile?.classList.remove("abierto");
    fondoUsuarioMobile?.classList.remove("visible");
});

fondoUsuarioMobile?.addEventListener("click", () => {
    menuUsuarioMobile?.classList.remove("abierto");
    fondoUsuarioMobile?.classList.remove("visible");
});