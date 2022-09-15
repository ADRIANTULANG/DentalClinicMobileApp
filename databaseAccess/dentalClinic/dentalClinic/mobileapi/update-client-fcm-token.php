<?php
include 'conn.php'; 

	try {

	$clientID = $_POST['clientID'];
	$fcmToken = $_POST['fcmToken'];
	
	
	$queryResult=$connect->query("UPDATE `tbl_clients` SET `fcmToken`='$fcmToken' WHERE client_id = '$clientID'");


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