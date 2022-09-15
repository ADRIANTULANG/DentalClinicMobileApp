<?php
include 'conn.php'; 

	try {


	$clinic_id = $_POST['clinic_id'];
	$clinic_img_document = $_POST['clinic_img_document'];
	$clinic_doc_description = $_POST['clinic_doc_description'];
	
	
	$queryResultnew=$connect->query("INSERT INTO `tbl_clinic_documents`( `clinic_id`, `clinic_img_document`,
									 `clinic_doc_description`) VALUES ('$clinic_id','$clinic_img_document','$clinic_doc_description')");


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