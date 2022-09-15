<?php
include 'conn.php'; 
$result=array();
try {

define('API_ACCESS_KEY','AAAA2HRuCLs:APA91bGiVjiUtEs5nIFoaAqEAR2uKeTsgtFKo7hvmB2v_rYK8iL4g1mpw4tZoCmE92128uIhFT6OFORzBU4JB2gTJtNeCMkMlbsuZg8J-OhoaZ6VoVDPz6B6gfMo6Lod5MRB6W7jSXfF');

$fcmUrl = 'https://fcm.googleapis.com/fcm/send';

$token = $_POST["fcmtoken"];
$body = $_POST["body"];
$title = $_POST["title"];

        $notification = [
            'title' => $title,
            'body' => $body ,
            'icon' => 'myIcon',
            'sound' => 'mySound'
        ];

        $extraNotificationData = ["message" => $notification, "moredata"=> 'dd'];

        $fcmNotification = [
            'to' => $token,
            'notification' => $notification ,
            'data' => $extraNotificationData
           
        ];

        $headers = [
            'Authorization: key=' .API_ACCESS_KEY,
            'Content-Type: Application/json'
        ];

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $fcmUrl);
        curl_setopt($ch, CURLOPT_POST, true);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($fcmNotification));

        $res = curl_exec($ch);
        curl_close($ch);


     
        $data = array(

            'success' => true, 'data'=> $res, 'message' => 'Success'

        );
} catch (Exception $e) {
        $data = array(

            'success' => false, 'message' => 'Error. Please try again. ' . $e

        );
    }
echo json_encode($data);
?>