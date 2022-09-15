<?php
include 'conn.php'; 

	try {


	$rating_clinic_id = $_POST['rating_clinic_id'];
	$rating_client_id = $_POST['rating_client_id'];
	$rating_comment = $_POST['rating_comment'];
	$rating_score = $_POST['rating_score'];
	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_clinic_rating`( `rating_clinic_id`, `rating_client_id`, `rating_comment`, `rating_score`) VALUES ('$rating_clinic_id','$rating_client_id','$rating_comment','$rating_score')");


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