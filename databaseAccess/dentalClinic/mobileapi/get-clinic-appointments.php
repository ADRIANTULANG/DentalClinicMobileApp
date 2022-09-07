<?php
include 'conn.php'; 
$result=array();
try {
$clinicID = $_POST['clinicID'];


$queryResult=$connect->query("SELECT a.*,b.client_name FROM tbl_reservations a LEFT JOIN tbl_clients b ON 
a.res_client_id = b.client_id WHERE a.res_status NOT IN ('Rejected') AND a.res_clinic_id = '$clinicID'");

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
