<?php
	   require("datosConexion.php");
	   require("headers.php");
	$mysqli=new mysqli($host,$user,$pass,$database);
	
    $sql="select id as Factura,replace(format(venta,0),',','.') as Venta,replace(round(nGalones,2),'.',',') as Galones,surtidor as Surtidor,credCont as TipoVenta,nombreApellido as Cliente,date_format(fecha,'%m-%d') as Fecha,time_format(fecha,'%H:%i') as Hora from pedidos";
    $sql.=" where to_days(fecha)=to_days(now())";
    $sql.=" order by fecha desc";
	
	$result=$mysqli->query($sql);
	$fieldinfo = mysqli_fetch_fields($result);
	  
	$fields=[];
	foreach ($fieldinfo as $val){
	$sortDir="";
	if ($val->name=="Hora") 
	$sortDir="desc";
	$name=$val->name;
	$favcolor = "red";
    $format="";		

	
	switch ($name) {
		case "Factura":
		 
		  $clsColumn="bg-lime fg-black text-center";
		  break;
		case "Venta":
		  $clsColumn="bg-green fg-white text-right";
		  $format="money";
		  break;
	   
		default:
		
		$clsColumn="text-left";
	  }
	
	$fields[]=array("name"=>$val->name,"format"=>$format,"title"=>$val->name,"sortable"=>true,"sortDir"=>$sortDir,"clsColumn"=>$clsColumn);	
	   
	}
	
	$datos=array("header"=>$fields);
	$datas=[];
	while($dato=$result->fetch_array(MYSQLI_NUM)) {
		//$dato[5]=sprintf("<button class='button primary'>%s</button>",$dato[5]);
		
		$dato[5]="<button class='button drop-shadow w-100 primary square mini vcliente'>$dato[5]</button>";
		$datas[]=$dato;
	}
	$datos=array("header"=>$fields,"data"=>($datas),"footer"=>array());
	if (file_exists("table.json")) unlink("table.json");
	$archivo = fopen("table.json","w+b");
	fwrite($archivo, json_encode($datos));
	fclose($archivo);
	echo json_encode($datos);
	$result->free();
	$mysqli->close();
?>