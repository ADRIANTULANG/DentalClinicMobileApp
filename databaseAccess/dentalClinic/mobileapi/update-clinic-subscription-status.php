<?php
include 'conn.php'; 

	try {

	$clinicID = $_POST['clinicID'];

	
	$queryResult=$connect->query("UPDATE `tbl_clinic` SET `subscription_status`= 'Paid',`subscription_amount`='1500' WHERE clinic_id = '$clinicID'");


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