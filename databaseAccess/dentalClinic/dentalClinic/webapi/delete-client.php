<?php
include 'conn.php'; 

	try {

	$clientID = $_POST['clientID'];
	
	$queryResult=$connect->query("DELETE FROM `tbl_clients` WHERE client_id = '$clientID'");

	
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