<?php
include 'conn.php'; 

	try {


	$name = $_POST['name'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$address = $_POST['address'];
	$contactno = $_POST['contactno'];
	$emailAdd = $_POST['emailAdd'];
	$fcmToken = $_POST['fcmToken'];
	
	$queryResult=$connect->query("INSERT INTO `tbl_clients`( `client_name`, `client_username`, 
								`client_password`, `client_address`, `client_contact_no`, `client_email`, `fcmToken`) 
								VALUES ('$name','$username','$password','$address','$contactno','$emailAdd','$fcmToken')");
	
	$last_id =$connect->insert_id;

	$queryResultnew=$connect->query("INSERT INTO `tbl_useraccount`( `username`, 
									`password`, `user_id`, `user_type`) 
									VALUES ('$username','$password',
									'$last_id','Client')");


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