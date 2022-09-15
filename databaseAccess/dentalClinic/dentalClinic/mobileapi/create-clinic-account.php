<?php
include 'conn.php'; 

	try {


	$clinic_name = $_POST['clinic_name'];
	$clinic_username = $_POST['clinic_username'];
	$clinic_password = $_POST['clinic_password'];
	$clinic_address = $_POST['clinic_address'];
	$clinic_lat = $_POST['clinic_lat'];
	$clinic_long = $_POST['clinic_long'];
	$clinic_image = $_POST['clinic_image'];
	$clinic_dentist_name = $_POST['clinic_dentist_name'];
	$clinic_email = $_POST['clinic_email'];
	$clinic_contact_no = $_POST['clinic_contact_no'];
	$fcmToken = $_POST['fcmToken'];
	
	$queryResult=$connect->query("INSERT INTO `tbl_clinic`( `clinic_name`, `clinic_username`, `clinic_password`, 
								`clinic_address`, `clinic_lat`, `clinic_long`, `clinic_image`, `clinic_dentist_name`,
								 `clinic_email`, `clinic_contact_no`,`fcmToken`, `clinic_status`) VALUES ('$clinic_name','$clinic_username',
								 '$clinic_password','$clinic_address','$clinic_lat','$clinic_long','$clinic_image','$clinic_dentist_name','$clinic_email',
								 '$clinic_contact_no','$fcmToken','Pending')");
	
	$last_id =$connect->insert_id;

	$queryResultnew=$connect->query("INSERT INTO `tbl_useraccount`( `username`, 
									`password`, `user_id`, `user_type`) 
									VALUES ('$clinic_username','$clinic_password',
									'$last_id','Clinic')");


	$data = array(
	
		'success' => true, 'message' => 'Success', 'clinicID' => $last_id
	
	);
	} catch (Exception $e) {
		$data = array(
	
			'success' => false, 'message' => 'Error. Please try again. ' . $e
	
		);
	}
	echo json_encode($data);
?>