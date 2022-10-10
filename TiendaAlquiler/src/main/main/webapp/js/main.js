var username = new URL(location.href).searchParams.get("username");
var user;

$(document).ready(function () {

    $(function () {
        $('[data-toggle="tooltip"]').tooltip();
    });

    getUsuario().then(function () {
        
        $("#mi-perfil-btn").attr("href","profile.html?username=" + username);
        
        $("#user-saldo").html(user.saldo.toFixed(2) + "$");

        getHerramientas(false, "ASC");

        $("#ordenar-producto").click(ordenarHerramientas);
    });
});


async function getUsuario() {

    await $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioPedir",
        data: $.param({
            username: username
        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                user = parsedResult;
            } else {
                console.log("Error recuperando los datos del usuario");
            }
        }
    });

}
function getHerramientas(ordenar, orden) {

    $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletHerramientaListar",
        data: $.param({
            ordenar: ordenar,
            orden: orden
        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                mostrarHerramientas(parsedResult);
            } else {
                console.log("Error recuperando los datos de las herramientas");
            }
        }
    });
}
function mostrarHerramientas(herramientas) {

    let contenido = "";

    $.each(herramientas, function (index, herramienta) {

        herramienta = JSON.parse(herramienta);
        let precio;

        if (herramienta.cantidad > 0) {

            

            contenido += '<tr><th scope="row" fout=>' + herramienta.id + '</th>' +
                    '<td>' + herramienta.producto + '</td>' +
                    '<td>' + herramienta.descripcion + '</td>' +
                    '<td>' + herramienta.precio + '</td>' +
                    '<td>' + herramienta.cantidad + '</td>'+
                    '<td><button onclick="alquilarHerramienta(' + herramienta.id + ',' + precio + ');" class="btn btn-success" '+
                    '>Reservar</button></td></tr>';     
            
        }
    });
    $("#herramienta-tbody").html(contenido)
}

function ordenarHerramientas() {

    if ($("#icono-ordenar").hasClass("fa-sort")) {
        getHerramienta(true, "ASC");
        $("#icono-ordenar").removeClass("fa-sort");
        $("#icono-ordenar").addClass("fa-sort-down");
    } else if ($("#icono-ordenar").hasClass("fa-sort-down")) {
        getherramienta(true, "DESC");
        $("#icono-ordenar").removeClass("fa-sort-down");
        $("#icono-ordenar").addClass("fa-sort-up");
    } else if ($("#icono-ordenar").hasClass("fa-sort-up")) {
        getHerramienta(false, "ASC");
        $("#icono-ordenar").removeClass("fa-sort-up");
        $("#icono-ordenar").addClass("fa-sort");
    }
}
function alquilarHerramienta(id, precio) {

    $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletHerramientaAlquilar",
        data: $.param({
            id: id,
            username: username

        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                restarDinero(precio).then(function () {
                    location.reload();
                })
            } else {
                console.log("Error en la reserva de la herramienta");
            }
        }
    });
}


async function restarDinero(precio){

    await $.ajax({
        type: "GET",
        dataType: "html",
        url: "./ServletUsuarioRestarDinero",
        data: $.param({
            username: username,
            saldo: parseFloat(user.saldo - precio)

        }),
        success: function (result) {
            let parsedResult = JSON.parse(result);

            if (parsedResult != false) {
                console.log("Saldo actualizado");
            } else {
                console.log("Error en el proceso de pago");
            }
        }
    });
}