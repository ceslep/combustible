var tableVentas;
const getVentas = async _ => {
    $("#listadoLoadSpinner").removeClass("d-none");
    let response = await fetch(server+"getPedidos.php");
    
    ventas = await response.json();
    console.log(ventas);
    
    /*let html = "";
    let total = 0;
    if (ventas != null) {
        Object.keys(ventas[0]).forEach(key => {
            if (key != "Venta") {
                console.log("no venta");
                if ((key == "Fecha") || (key == "Hora"))
                    html += `
                            <th class="sortable-column sort-desc" data-format="date" data-cls-column="bg-yellow fg-black text-center">
                                ${key}
                            </th>
                            `;
                else if (key == "Factura")
                    html += `
                            <th class="sortable-column sort-desc" data-format="int" data-cls-column="bg-lime fg-black text-center">
                                ${key}
                            </th>
                            `;
                else
                    html += `
                <th class="sortable-column sort-asc" data-sortable="true">
                    ${key}
                </th>;
                
        ` ;

            }
            else
                html += `
                <th class="sortable-column sort-asc" data-format="number" data-cls-column="bg-green fg-white text-right">
                    ${key}
                </th>
        `;
        });
        $("#encVentas").empty().html(html);
        html = "";

        ventas.forEach(venta => {

            total += parseFloat(venta.Venta);
            html += "<tr>";
            Object.keys(venta).forEach(key => {

                if (key == "Venta")
                    html += `
                        <td>
                              ${parseFloat(venta[key]).toLocaleString('es-CO', { style: 'currency', currency: 'COP', maximumFractionDigits: 0, minimumFractionDigits: 0 })}
                         </td>
                    
            `;
                else if (key == "Cliente") {

                    html += `    
                <td>
                        <a href="#!" class="button drop-shadow w-100 primary square mini vcliente"><p class="text-ellipsis">${venta[key]}</p></a>
                </td>
            `
                }
                else
                    html += `
                          <td>
                             ${venta[key]}
                           </td>
            `;
            });
            html += "</tr>";
        });
        console.log(total);
        $("#totalventa").text(total);
        $("#tbodyVentas").empty().html(html);
        if (tableVentas!=undefined){
            tableVentas=Metro.getPlugin("#tlistadoVentas","table");
            tableVentas.clear();
            console.log(tableVentas);
            tableVentas.reload(true);
        }
        else
        tableVentas=Metro.makePlugin("#tlistadoVentas", "table");*/
        $('#tlistadoVentas').data('table').loadData('table.json');
        $("#listadoLoadSpinner").addClass("d-none");            
       
       return false;
    }
   
//}