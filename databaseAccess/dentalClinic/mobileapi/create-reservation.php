<?php
include 'conn.php'; 
$result=array();
try {
    
    $res_service_name = $_POST['res_service_name'];
    $res_clinic_id = $_POST['res_clinic_id'];
    $res_service_price = $_POST['res_service_price'];
    $res_fee = $_POST['res_fee'];
    $res_total_amount = $_POST['res_total_amount'];
    $res_schedule = $_POST['res_schedule'];
    $res_payment_gateway = $_POST['res_payment_gateway'];
    $res_client_id = $_POST['res_client_id'];
    $res_status = 'Pending';


$queryResult=$connect->query("INSERT INTO `tbl_reservations`( `res_service_name`, `res_clinic_id`,
                             `res_service_price`, `res_fee`, `res_total_amount`,
                             `res_schedule`, `res_payment_gateway`, `res_client_id`, `res_status`, `res_remarks`) 
                            VALUES ('$res_service_name','$res_clinic_id','$res_service_price',
                            '$res_fee','$res_total_amount','$res_schedule','$res_payment_gateway','$res_client_id','$res_status','')");

// while($fetchData=$queryResult->fetch_assoc()){
// $result[]=$fetchData;
// }
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
