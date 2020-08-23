$(document).ready(function() {  
   

    $("#frmDatos").submit(async e=>{
        e.preventDefault();
     /*   var valid=false;
        console.clear();
        $("#frmDatos input[required]").each((i,k)=>{
            console.log(k);
            console.log(k.value); 
            console.log("Valido->",k.checkValidity());
            if (k.checkValidity()){
                console.log("Not Valid")
                valid=false;
                return false;
            }
        });
        console.log(valid);
        if (!valid) return false;*/
        let nombres=$("#nombresCliente").val();
        console.log(nombres);
        let surtidor=$("#surtidor option:selected").val();
        console.log(surtidor);

        if((nombres=="")||(nombres==undefined)){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'Debes escoger el cliente',
                footer: '',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__backOutDown'
                }
            });
            return false;   
        }
      if (surtidor=="0"){
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
        return false;
        }
  
        else {
           
            let response=await fetch(server+"guardar.php",{
                method:"POST",
                body:JSON.stringify($("#frmDatos").serializeObject()),
                headers:{"content":"application/json"}
            });
            let data=await response.json();
            console.log(data.Mensaje);
            if (data.Mensaje=="ok") {
              console.log("BIEN");
              Swal.fire({
                title: 'venta almacenada',
                showClass: {
                  popup: 'animate__animated animate__zoomInUp'
                },
                hideClass: {
                  popup: 'animate__animated animate__zoomOutLeft'
                }

              })
            
             
              let el=Metro.getPlugin("#surtidor","select");
              console.log(el);
              el.reset(true);
              el=Metro.getPlugin("#docIdent","select");
              console.log(el);
              el.reset(true);
              $("#frmDatos")[0].reset();  
              getVentas();
            }

            else{

              console.log(data);

              Swal.fire("el cliente no existe");

              $(".infomsj").text("Error");

            }

	}



    });

  });