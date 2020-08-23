<?php
            require("datosConexion.php");
            require("headers.php");
            $mysqli=new mysqli($host,$user,$pass,$database);      
            $datos=json_decode(file_get_contents("php://input"));
            

            if ($datos->indice=="")

            $sql="INSERT INTO $datos->tabla (%s) values (%s)";

            else

            $sql="UPDATE $datos->tabla SET %s where %s";

            $values="";

            $campos="";

            foreach($datos as $dato=>$valor){

                  if (($dato!="tabla")&&($dato!="indice")&&($datos->indice=="")){

                  $campos.="$dato,";

                  $values.="'$valor',";

                  }

                  else 

                  if (($dato!="tabla")&&($dato!="indice")){

                  

                        $campos.="$dato='$valor',";

                        $values="id=$datos->indice,";

                  }

            }     

            $campos=substr($campos,0,-1);

            $values=substr($values,0,-1);

            $sql=sprintf($sql,$campos,$values);

            $datos=[];

            if($mysqli->query($sql))

            $datos=array("Mensaje"=>"ok","info"=>"Se ha guardado un Registro","sql"=>$sql);

            else

            $datos=array("Mensaje"=>"error","info"=>"Error en la consulta ".$mysqli->error,"sql"=>$sql);

            echo json_encode($datos);

            $mysqli->close();
?>