<?php
include 'conn.php'; 
$result=array();
try {
$clinicID = $_POST['clinicID'];
// $password = $_POST['password'];

$queryResult=$connect->query("SELECT a.*,b.clinic_name FROM `tbl_clinic_subscription_record` a  LEFT JOIN tbl_clinic b ON a.subs_clinic_id = b.clinic_id
WHERE a.subs_clinic_id = '$clinicID'");

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
