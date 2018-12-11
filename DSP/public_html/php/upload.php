<?php

ini_set('upload_max_filesize', '10M');
ini_set('post_max_size', '10M');
ini_set('max_execution_time', 300);

define('PATH', getPath());
session_start();
define(USR_ID, $_SESSION['id_user']);


$dir_subida =PATH."contenedor\\".USR_ID."\\";

//$idr_upload = pathinfo(upload.php);
echo "<br>".$dir_subida;



if (isset($_FILES["documentoFile"]) && $_FILES["documentoFile"]["name"]) {

		$origen=$_FILES["documentoFile"]["tmp_name"];
		$destino=$dir_subida.$_FILES["documentoFile"]["name"];
		echo "<br>".$origen;
		echo "<br>".$destino;
		# movemos el archivo
			if(move_uploaded_file($origen, $destino))
			{
				//alert("Debe Seleccionar un Estudiante"); 
			}else{
				
			}


} else {
				//alert("No hay"); 
}

function getPath() {
    $ruta = realpath(dirname(__FILE__));
    if ( strtoupper(substr(PHP_OS, 0, 3)) === 'WIN' )
        $separator = '\\';
    else
        $separator = '/';
    $aRuta = explode($separator,$ruta);
    $ruta = '';
    foreach($aRuta as $index => $value)
        if ( $index < count($aRuta) - 1 ) $ruta .= $value.$separator;
    return $ruta;
}



?>


