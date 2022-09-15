<?php

$connect = new mysqli("localhost","root","","dentalclinic");

if($connect){
	$result=array();
    try {
    $image = $_FILES['image']['name'];
    $name = $_POST['name'];
    $imagePath = 'dentalClinic/images/'.$image;
    $tmp_name = $_FILES['image']['tmp_name'];
    
    move_uploaded_file($tmp_name,$imagePath);
    
    $result = array(
    
    	'success' => true, 'message' => 'Success'
    
    );
    } catch (Exception $e) {
    	$result = array(
    
            'success' => false, 'message' => 'Error. Please try again. ' . $e
    
        );
    }
    echo json_encode($result);
}else{
	
	echo "connection failed";
	exit();
}

