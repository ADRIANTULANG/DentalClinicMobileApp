<?php
include 'conn.php'; 

	try {

	$clinicID = $_POST['clinicID'];
	$amount = $_POST['amount'];
	$sub_expiration_date = $_POST['sub_expiration_date'];
	$sub_purchased_date = $_POST['sub_purchased_date'];
	

	
	$queryResult=$connect->query("UPDATE `tbl_clinic` SET `subscription_status`= 'Paid',`subscription_amount`='1500' WHERE clinic_id = '$clinicID'");
	
    $queryResultInsert=$connect->query("INSERT INTO `tbl_clinic_subscription_record`(`subs_clinic_id`, `subs_amount`, `subs_expiration_date`, `subs_purchased_date`) VALUES ('$clinicID','$amount','$sub_expiration_date','$sub_purchased_date')");
	

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