<?php

include 'conn.php'; 

// POSTMAN TEST
// $data = json_decode(file_get_contents('php://input'), true);

$response = array();

$ch = curl_init();

$url = "https://fcm.googleapis.com/fcm/send";

$headers = array(
    "Content-Type: application/json",
    "Authorization: key=AAAA2HRuCLs:APA91bGiVjiUtEs5nIFoaAqEAR2uKeTsgtFKo7hvmB2v_rYK8iL4g1mpw4tZoCmE92128uIhFT6OFORzBU4JB2gTJtNeCMkMlbsuZg8J-OhoaZ6VoVDPz6B6gfMo6Lod5MRB6W7jSXfF"
);

$dataj =
    [
        'to' => $_POST['fcmtoken'],
        'notification' => [
            'title' => $_POST['title'],
            'body' => $_POST['body'],
        ],
    ];


// POSTMAN TEST
// $dataj =
//     [
//         'to' => $data['fcmtoken'],
//         'notification' => [
//             'title' => $data['title'],
//             'body' => $data['body'],
//         ],
//     ];


curl_setopt($ch, CURLOPT_URL, $url);
curl_setopt($ch, CURLOPT_POST, true);
curl_setopt($ch, CURLOPT_HTTPHEADER, $headers);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($dataj));
curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$resp = curl_exec($ch);


if ($e = curl_error($ch)) {

    $response = array(

        'success' => false, 'data' => null, 'message' => 'Error. Please try again. ' . $e
        
    );

} else {

    $response = array(

        'success' => true, 'data' => $resp, 'message' => 'Success'


    );

}

curl_close($ch);

echo json_encode($response);
