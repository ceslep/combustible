$("#btnNet").click(async e=>{
    e.preventDefault();
    Swal.mixin({
        input: 'text',
        confirmButtonText: 'Guardar &rarr;',
        cancelButtonText:'Cancelar',
        showCancelButton: true,
        progressSteps: ['']
      }).queue([
        {
          title: 'Ingrese la dirección y puerto del servidor de Impresión',
          text: 'Es un servicio local'
        },
        
      ]).then(result=>{
        if (result.value) {
            console.log(result.value[0]);
          }
      });
      
      });
