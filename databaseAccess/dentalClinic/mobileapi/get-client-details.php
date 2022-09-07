<?php
include 'conn.php'; 
$result=array();
try {
$clientID = $_POST['clientID'];


$queryResult=$connect->query("SELECT * FROM `tbl_clients` WHERE client_id = '$clientID'");

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
