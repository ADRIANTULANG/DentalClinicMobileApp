<?php
include 'conn.php'; 

	try {
	$status = $_POST['status'];
	$clinicID = $_POST['clinicID'];
	
	$queryResult=$connect->query("UPDATE `tbl_clinic` SET `clinic_status`='$status' WHERE clinic_id = '$clinicID'");

	
	// while($fetchData=$queryResult->fetch_assoc()){
	// $result[]=$fetchData;
	// }
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