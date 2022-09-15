<?php
include 'conn.php'; 
$result=array();
try {
$clinicID = $_POST['clinicID'];


$queryResult=$connect->query("SELECT a.*, (SELECT COUNT(*) FROM tbl_reservations b WHERE b.res_clinic_id = '$clinicID' AND b.res_service_name = a.services_name AND b.res_status = 'Approved') as numberOftransactServices FROM tbl_clinic_services a WHERE a.services_clinic_id = '$clinicID' ORDER BY numberOftransactServices DESC");

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
