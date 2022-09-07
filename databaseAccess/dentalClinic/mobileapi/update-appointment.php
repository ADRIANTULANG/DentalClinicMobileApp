<?php
include 'conn.php'; 

	try {

	$resID = $_POST['resID'];
	$remarks = $_POST['remarks'];
	$status = $_POST['status'];
	
	$queryResult=$connect->query("UPDATE `tbl_reservations` SET `res_status`= '$status',`res_remarks`='$remarks' WHERE res_id = '$resID'");


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