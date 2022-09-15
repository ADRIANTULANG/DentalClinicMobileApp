<?php
include 'conn.php'; 
$result=array();
try {
$clientID = $_POST['clientID'];


$queryResult=$connect->query("SELECT a.*,b.clinic_name,b.clinic_dentist_name,b.clinic_image,b.clinic_contact_no,b.clinic_email FROM `tbl_reservations` a 
LEFT JOIN tbl_clinic b ON a.res_clinic_id = b.clinic_id
WHERE a.res_client_id = '$clientID'");

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
