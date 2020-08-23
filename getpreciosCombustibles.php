<?php
	   require("datosConexion.php");
	   require("headers.php");
	$mysqli=new mysqli($host,$user,$pass,$database);
	
	$sql="select * from precios_combustibles";
	
	$result=$mysqli->query($sql);
	while($dato=$result->fetch_assoc()) $datos[]=$dato;
	echo json_encode($datos);
	$result->free();
	$mysqli->close();
	
?>