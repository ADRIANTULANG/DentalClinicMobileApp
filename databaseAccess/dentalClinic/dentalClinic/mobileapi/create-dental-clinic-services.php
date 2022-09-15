<?php
include 'conn.php'; 

	try {


	$services_clinic_id = $_POST['services_clinic_id'];
	$services_name = $_POST['services_name'];
	$services_price = $_POST['services_price'];
	$services_description = $_POST['services_description'];
	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_clinic_services`( `services_name`, `services_clinic_id`, `services_price`, `services_description`, `services_status`) 
									VALUES ('$services_name','$services_clinic_id','$services_price','$services_description','Active')");


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