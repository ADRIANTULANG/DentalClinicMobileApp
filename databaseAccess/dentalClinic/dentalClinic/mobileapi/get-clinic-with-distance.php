

<?php
include 'conn.php'; 
$result=array();
try {
$long = $_POST['long'];
$lat = $_POST['lat'];
$distance = $_POST['distance'];

$queryResult=$connect->query("SELECT getDistance($lat, $long,`clinic_lat`,`clinic_long`) as distance,
                                `clinic_id`, `clinic_name`, `clinic_username`, `clinic_password`, `clinic_address`, `clinic_lat`,
                                 `clinic_long`, `clinic_image`, `clinic_dentist_name`, `clinic_email`, 
                                 `clinic_contact_no`, `clinic_status`,
                                 (SELECT AVG(b.rating_score) FROM tbl_clinic_rating b WHERE b.rating_clinic_id = a.clinic_id) as clinic_rating
                                 FROM `tbl_clinic` a 
                                 WHERE `clinic_status` = 'Approved' AND `subscription_status` = 'Paid'  AND getDistance($lat, $long,`clinic_lat`,`clinic_long`) <= $distance ORDER BY distance ASC");

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
