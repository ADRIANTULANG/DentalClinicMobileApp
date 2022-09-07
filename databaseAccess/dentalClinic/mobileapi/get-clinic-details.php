<?php
include 'conn.php'; 
$result=array();
try {
$clinicID = $_POST['clinicID'];


$queryResult=$connect->query("SELECT * FROM `tbl_clinic` WHERE clinic_id = '$clinicID'");

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
