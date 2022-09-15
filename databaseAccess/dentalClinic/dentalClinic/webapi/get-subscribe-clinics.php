<?php
include 'conn.php'; 
$result=array();
try {
// $username = $_POST['username'];
// $password = $_POST['password'];

$queryResult=$connect->query("SELECT `clinic_id`, `clinic_name`, `clinic_username`, `clinic_password`, `clinic_address`, `clinic_lat`, `clinic_long`, `clinic_image`, `clinic_dentist_name`, `clinic_email`, `clinic_contact_no`, `fcmToken`, `clinic_status`, `subscription_status`,(SELECT SUM(c.subs_amount) FROM tbl_clinic_subscription_record c WHERE c.subs_clinic_id = a.clinic_id) as subscription_amount FROM `tbl_clinic` a RIGHT JOIN tbl_clinic_subscription_record b ON a.clinic_id = b.subs_clinic_id WHERE b.subs_id is not null GROUP BY a.clinic_id");

while($fetchData=$queryResult->fetch_assoc()){
$result[]=$fetchData;
}
$data = array(

	'success' => true, 'data'=> $result, 'message' => 'Success'

);
} catch (Exception $e) {
	$data = array(

        'success' => false, 'message' => 'Error. Please try again. ' . $e

    );
}
echo json_encode($data);
?>
