

const  saveClient = async _ => {
        
        console.clear();
        console.log(data.datosCliente);
        console.log($("#frmNuevoCliente").serializeObject());
        let guardado= await fetch(server+"guardar.php",{
            method:"POST",
            body:JSON.stringify($("#frmNuevoCliente").serializeObject()),
            headers:{
                "Content-Type":"application/json"
            },
            mode:"cors"
        });
        let mensajeGuardado = await guardado.json();
        console.log(mensajeGuardado);
        if (mensajeGuardado.Mensaje=="ok"){
            $("#frmNuevoCliente")[0].reset();
            Swal.fire({
                title: 'Cliente Guardado',
                icon:'success',
                showClass: {
                  popup: 'animate__animated animate__bounceInLeft'
                },
                hideClass: {
                  popup: 'animate__animated animate__bounceOut'
                }
              })
        }
        else{
        Swal.fire({
            title: 'El cliente ya existe',
            icon:'error',
            showClass: {
              popup: 'animate__animated animate__bounceInLeft'
            },
            hideClass: {
              popup: 'animate__animated animate__bounceOut'
            }
          }) 
        }    
    }

 


var dialogActions = [
    {
        caption: "Guardar",
        cls: "js-dialog-close alert",
        onclick: saveClient,
    },
    {
        caption: "Cerrar",
        cls: "js-dialog-close",
        onclick: async _ => {

            let dialog = $("#newClient");
            await dialog.removeClass('animate__bounce').addClass('animate__bounceOutLeft');;

            Metro.dialog.close($("#newClient"));
        }
    }
];


