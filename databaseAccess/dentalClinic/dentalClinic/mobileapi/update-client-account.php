<?php
include 'conn.php'; 

	try {

	$clientID = $_POST['clientID'];
	$name = $_POST['name'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$address = $_POST['address'];
	$contactno = $_POST['contactno'];
	$emailAdd = $_POST['emailAdd'];
	
	$queryResult=$connect->query("UPDATE `tbl_clients` SET `client_name`='$name',`client_username`='$username',
								`client_password`='$password',`client_address`='$address',
								`client_contact_no`='$contactno',`client_email`='$emailAdd' WHERE client_id = '$clientID'");

	$queryResultnew=$connect->query("UPDATE `tbl_useraccount` SET `username`='$username',`password`='$password' WHERE user_id = '$clientID'");


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