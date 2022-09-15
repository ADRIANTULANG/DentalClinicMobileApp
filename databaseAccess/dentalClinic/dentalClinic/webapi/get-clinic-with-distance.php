<?php
include 'conn.php'; 
$result=array();
try {
$lat = $_POST['lat'];
$long = $_POST['long'];
  
$queryResult=$connect->query("SELECT getDistance($lat, $long,`clinic_lat`,`clinic_long`) as distance,
                                `clinic_id`, `clinic_name`, `clinic_username`, `clinic_password`, `clinic_address`, `clinic_lat`,
                                 `clinic_long`, `clinic_image`, `clinic_dentist_name`, `clinic_email`, 
                                 `clinic_contact_no`, `clinic_status` FROM `tbl_clinic` 
                                 WHERE `clinic_status` = 'Approved' ORDER BY distance DESC");

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
