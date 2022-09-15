<?php
include 'conn.php'; 

	try {

	$clinicID = $_POST['clinicID'];

	$username = $_POST['username'];
	$password = $_POST['password'];

	
	$queryResult=$connect->query("UPDATE `tbl_clinic` SET `clinic_username`='$username',`clinic_password`='$password' WHERE clinic_id = '$clinicID'");

	$queryResultnew=$connect->query("UPDATE `tbl_useraccount` SET `username`='$username',`password`='$password' WHERE user_id = '$clinicID'");


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