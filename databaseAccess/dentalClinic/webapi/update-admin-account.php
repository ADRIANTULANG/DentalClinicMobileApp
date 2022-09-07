<?php
include 'conn.php'; 

	try {

	$name = $_POST['name'];
	$username = $_POST['username'];
	$password = $_POST['password'];
	$empID = $_POST['empID'];
	
	$queryResult=$connect->query("UPDATE `tbl_employee` SET 
								`emp_name`='$name',
								`emp_username`='$username',
								`emp_pass`='$password' 
								WHERE emp_id = '$empID'");


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