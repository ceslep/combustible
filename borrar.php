<?php
$variablex = 5*10;
?>
<html>
	<body>
		<input type="button" value="Enviar variable" id="send"/>
	</body>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
    <script type="text/javascript">

    $(document).ready(function () {
		var variable= 1000;
      console.log ("Funcionando") ;
	 // console.log(xx);   

	$('#send').click( function() {
	console.log(variable);
	
		$.ajax(
				{
                  //  url: 'get_var.php?var=<?php //echo $variablex; ?>',
					//url: 'get_var.php?var=<?php// echo $variablex; ?>',
					method:"POST",
					url:"get_var.php",
					data: {"variable":variable},
					success: function( data ) {
						alert( 'El servidor devolvio "' + data + '"' );
					}
				}
			)
		}
    );
});
	</script>
</html>