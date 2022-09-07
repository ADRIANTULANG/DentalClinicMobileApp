

<?php
include 'conn.php'; 
$result=array();
try {
$long = $_POST['long'];
$lat = $_POST['lat'];

$queryResult=$connect->query("SELECT getDistance($lat, $long,`clinic_lat`,`clinic_long`) as distance,
                                `clinic_id`, `clinic_name`, `clinic_username`, `clinic_password`, `clinic_address`, `clinic_lat`,
                                 `clinic_long`, `clinic_image`, `clinic_dentist_name`, `clinic_email`, 
                                 `clinic_contact_no`, `clinic_status` FROM `tbl_clinic` 
                                 WHERE `clinic_status` = 'Approved' AND `subscription_status` = 'Paid' ORDER BY distance ASC");

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
