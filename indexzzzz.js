

$(document).ready(function() {  
    
    $("#frmDatos").submit(async e=>{
      if ($("#venta").val()==0){
      alert("POR FAVOR SELECCIONE EL NÚMERO DE SURTIDOR");
    
      }else {
            e.preventDefault();

            
            let response=await fetch("guardar.php",{
                method:"POST",
                body:JSON.stringify($("#frmDatos").serializeObject()),
                headers:{"content":"application/json"}
            });
            let data=await response.json();
            console.log(data[0].Mensaje);
            if (data[0].Mensaje==="ok") {
              console.log("BIEN");
              Swal.fire({
                title: 'venta almacenada',
                showClass: {
                  popup: 'animate__animated animate__zoomInUp'
                },
                hideClass: {
                  popup: 'animate__animated animate__hinge'
                }
              });
              $("#frmDatos")[0].reset();
              data.venta.nombresCliente="";
              data.venta.emailCliente="";
            }
            else{
              console.log(data);
              Swal.fire("el cliente no existe");
              $(".infomsj").text("Error");
            }
          }

    });
  });