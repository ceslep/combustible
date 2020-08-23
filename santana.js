var precios = [];

const getPrecios = (async tipo => {
    let response = await fetch(server+"getpreciosCombustibles.php");
    precios = await response.json();
    let html = '<option value="0" disabled selected></option>';
    precios.forEach(precio => {
        html += `
            <option value="${precio.tipo}" data-template="<span class='mif-gas-station  mif-2x fg-black icon'></span> $1"> ${precio.combustible}</option>
    `;
    });
    let select = $("#surtidor");
    select.html(html);
    Metro.makePlugin(select, "select");

})();

$(document).ready(function () { // comienzo jquery



    data = Bind({
        venta: {

            venta: 0,
            galones: 0,
            precio: 0,
            combustible: "",
            strprecio: "0",
            identificacion: "",
            nombresCliente: "",
            emailCliente: "",
            placaCliente: "",

        },
        datosCliente: {
            identificacion: "",
            nombres: "",
            email: "",
            telefono: "",
            direccion: "",
            placa: ""
        },
    }, {
        venta: {
            callback: function () {

                //  console.log(this.__export());

            },
        },




        'venta.venta': {
            dom: '.venta',
            transform: function (v) {

                if (!isNaN(v)) return v;

            }
        },
        'venta.galones': {
            dom: ".galones",
            transform: function (v) {

                if (("" + v).indexOf(".") > 0) {
                    if (!isNaN(v)) return parseFloat(v).toFixed(3);
                }
                else return v;

            }
        },
        'venta.precio': {
            dom: ".precioGalon",
            transform: function (v) {

                if (!isNaN(v))
                    return parseFloat(v).toLocaleString('es-CO', { style: 'currency', currency: 'COP', maximumFractionDigits: 0, minimumFractionDigits: 0 });

            }
        },
        'venta.strprecio': {
            dom: ".strprecio",
            transform: function (v) {

                if (!isNaN(v))
                    return parseFloat(v).toLocaleString('es-CO', { style: 'currency', currency: 'COP', maximumFractionDigits: 0, minimumFractionDigits: 0 });

            }
        },
        'venta.identificacion': {
            dom: ".identificacion",

        },
        'venta.nombresCliente': {
            dom: "#nombresCliente",

        },
        'venta.emailCliente': {
            dom: "#emailCliente",

        },
        'venta.placaCliente': {
            dom: "#placaCliente",

        },
        'venta.combustible': {
            dom: ".combustible",

        },

        datosCliente: {
            callback: function () {

                //    console.log(this.__export());

            },
        },
        'datosCliente.identificacion': {
            dom: '#c_identificacion',
        },
        'datosCliente.nombres': {
            dom: '#c_nombres',
        },
        'datosCliente.email': {
            dom: '#c_email',
        },
        'datosCliente.telefono': {
            dom: '#c_telefono',
        },
        'datosCliente.placa': {
            dom: '#c_placa',
        },
        'datosCliente.direccion': {
            dom: '#c_direccion',
        }



    });

    console.log("funcionando");


    let fecha = new Date().toDateInputValue();
    let hora = new Date().toTimeInputValue();
    $("#fechaVenta").text(fecha);
    $("#horaVenta").text(hora);
    
    precioGal = "";
    nGalones = "";
    venta = "";




    const getPrecioLocal = tipo => {


        return precios.filter(precio => { return precio.tipo == tipo });


    }

    $("#surtidor").on("change", e => {
        let select = $("#surtidor option:selected").val();
        if (select == "0") return;
        let precioLocal = getPrecioLocal(select)[0];
        data.venta.precio = precioLocal.valor;
        data.venta.combustible = precioLocal.combustible;
        $("#divcombustible").removeClass().addClass("h-100 cell-12 cell-md-6 cell-lg-6 d-flex flex-justify-center flex-align-center flex-self-center").addClass(precioLocal.classBg).addClass(precioLocal.classFg);

        $("#venta").focus();

    });



    $(".ipt").on("input", e => {
        e.preventDefault();
        let campo = $(e.currentTarget).attr("id");
        console.log(campo);
        if (data.venta.precio === 0)
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Debes escoger el número de surtidor',
                footer: '',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__backOutDown'
                }
            });

        switch (campo) {
            case 'venta': data.venta.galones = data.venta.venta / data.venta.precio; break;
            case 'nGalones': data.venta.venta = data.venta.galones * data.venta.precio; break;
        }
        data.venta.strprecio = data.venta.venta;

    });

    $(".ipt").focus(e => {
        e.preventDefault();

        $(e.currentTarget).val("");
    });

    $("#cprecios").click(e => {
        e.preventDefault();
        Swal.fire({
            title: '<strong>Cambio de precios</strong>',
            icon: 'info',
            html: `
		<form>
			<label>Contraseña</label>
			<input type="password">
		</form>
  `,

            showCloseButton: true,
            showCancelButton: true,
            focusConfirm: false,
            confirmButtonText:
                '<i class="fa fa-thumbs-up"></i> Aceptar!',
            confirmButtonAriaLabel: 'Aceptar',
            cancelButtonText:
                '<i class="fa fa-thumbs-down"></i>Cerrar',
            cancelButtonAriaLabel: 'Cerrar'
        })
    });



    $("#bnewClient").click(e => {
        e.preventDefault();
        let dialog = $("#newClient");

        // dialog.removeClass('animate__animated').removeClass('animate__bounce');	 
        dialog.removeClass("no-visible").addClass('animate__animated').addClass('animate__bounce').removeClass('animate__bounceOutLeft');;


        Metro.dialog.open('#newClient');
    });


    $("#docIdent").focus(e => {
        console.clear();
        $(document).scroll();
    });




    getVentas();// from tableVentas.js


    $(document).on("click", ".vcliente", e => {
        e.preventDefault();
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Aún No está disponible!',
            footer: '<a href>Proximamente.........</a>',
            showClass: {
                popup: 'animate__animated animate__fadeInDownBig'
            },
            hideClass: {
                popup: 'animate__animated animate__bounceOutDown'
            }
        })
    });



    $("#cargaVentas").click(async e => {
        e.preventDefault();
        await getVentas();
        return false;
       
        return false;
        let dataPrint = {

            Factura:0,
            Placa:$("#placaCliente").val(),
            Identificacion:$("#docIdent option:selected").val(),
            Nombres:$("#nombresCliente").val(),
            Valor:$("#venta").val(),
            Fecha:$("#fechaVenta").text(),
            Hora:$("#horaVenta").text(),
            Kilometraje:$("#kms").val(),
            Galones:$("#nGalones").val(),
            claseCombustible:$(".combustible").text().substring(0,$(".combustible").text().length-2),
            

        }
        await fetch("http://127.0.0.1:3000/printer",{
            method:"POST",
            body:JSON.stringify(dataPrint),
            headers:{
                    "Content-Type":"application/json",
            },
            mode:"cors"

        });
        await fetch("http://127.0.0.1:3000/save",{
            method:"POST",
            body:JSON.stringify($("#frmDatos").serializeObject()),
            headers:{
                    "Content-Type":"application/json",
            },
            mode:"cors"

        });
    });
     setInterval(getVentas,5000);
});

