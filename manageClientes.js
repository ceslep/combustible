var clientes = [];
var selCliente;
const getClientes = (async identificacion => {
    let response = await fetch(server+"getClientes.php");
    clientes = await response.json();
    let html = "<option value='0' disabled selected></option>";
    clientes.forEach(cliente => {
        html += `
				<option value="${cliente.identificacion}">${cliente.identificacion}-${cliente.nombres}</option>
		`;
    });
    let select = $("#docIdent");
    select.html(html);
    selCliente = Metro.makePlugin(select, "select");
   
})();

const getClienteLocal = identificacion => {
    return clientes.filter(cliente => { return cliente.identificacion == identificacion });
}


$("#docIdent").change(e => {
    e.preventDefault();
    let identificacion = $("#docIdent option:selected").val();
    let cliente = getClienteLocal(identificacion)[0];
    if (cliente != undefined) {
        data.venta.nombresCliente = cliente.nombres;
        data.venta.emailCliente = cliente.email;
        data.venta.placaCliente = cliente.placa;
    }

});

