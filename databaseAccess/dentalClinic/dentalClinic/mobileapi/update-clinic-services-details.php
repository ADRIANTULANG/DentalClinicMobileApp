<?php
include 'conn.php'; 

	try {

	$services_clinic_id = $_POST['services_clinic_id'];
	$services_price = $_POST['services_price'];
	$services_name = $_POST['services_name'];
	$services_description = $_POST['services_description'];
	$services_id = $_POST['services_id'];

	
	$queryResult=$connect->query("UPDATE `tbl_clinic_services` SET `services_name`='$services_name',`services_price`='$services_price',`services_description`='$services_description' WHERE services_id = '$services_id'");


	$data = array(
	
		'success' => true, 'message' => 'Success'
	
	);
	} catch (Exception $e) {
		$data = array(
	
			'success' => false, 'message' => 'Error. Please try again. ' . $e
	
		);
	}
	echo json_encode($data);
?>