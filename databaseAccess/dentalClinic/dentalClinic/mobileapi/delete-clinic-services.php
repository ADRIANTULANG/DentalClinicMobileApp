<?php
include 'conn.php'; 

	try {

	$services_clinic_id = $_POST['services_clinic_id'];
	$services_id = $_POST['services_id'];

	
	$queryResult=$connect->query("DELETE FROM `tbl_clinic_services` WHERE services_id = '$services_id' AND services_clinic_id = '$services_clinic_id'");


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