<?php

ini_set('upload_max_filesize', '10M');
ini_set('post_max_size', '10M');
ini_set('max_execution_time', 300);

define('PATH', getPath());
session_start();
define(USR_ID, $_SESSION['id_user']);


$dir_subida =PATH."contenedor\\".USR_ID."\\";


echo "<br>".$dir_subida;

$archivo = (isset($_FILES['documentoFile'])) ? $_FILES['documentoFile'] : null;

if ($archivo) {
//if (isset($_FILES["documentoFile"]) && $_FILES["documentoFile"]["name"]) {

      	$extension = pathinfo($archivo['name'], PATHINFO_EXTENSION);
     	$extension = strtolower($extension);
      	$extension_correcta = ($extension == 'jpg' or $extension == 'jpeg' or $extension == 'gif' or $extension == 'png' or $extension == 'pdf' or $extension == 'doc' or $extension == 'docx');

      	if ($extension_correcta) {

                if (!file_exists(PATH."contenedor\\".USR_ID)) {
                       mkdir(PATH."contenedor\\".USR_ID, 0777, true);
                }

				$origen=$_FILES["documentoFile"]["tmp_name"];
				$destino=$dir_subida.$_FILES["documentoFile"]["name"];


                if (!file_exists($destino)) {

					# movemos el archivo
					if(move_uploaded_file($origen, $destino)){
							echo "<br>".$origen;
							echo "<br>".$destino;					   
/*					       $data = array(
					            'success' => true,
					            'msg'=>' '

					        );
					        header('Content-Type: application/json');
					        echo json_encode($data);
*/
					}else{
						echo '<script language="javascript">alert("No se pudo subir Archivo");</script>'; 
					}

				}
				else{
					echo '<script language="javascript">alert("Archivo ya existe");</script>'; 
				}

		}else {
			echo '<script language="javascript">alert("Extensión de archivo no permitido");</script>'; 
				
		}
					



} else {
	
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


