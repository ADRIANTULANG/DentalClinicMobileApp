<?php
include 'conn.php'; 

	try {

	$clinicID = $_POST['clinicID'];
	$fcmToken = $_POST['fcmToken'];
	
	
	$queryResult=$connect->query("UPDATE `tbl_clinic` SET `fcmToken`='$fcmToken' WHERE clinic_id = '$clinicID'");


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