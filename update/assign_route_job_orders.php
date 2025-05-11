<?php

include("../config.php");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

$route = $_POST['route'] ?? null;
$id = $_POST['id'] ?? null;


$query = "UPDATE job_orders SET `route` = '$route' WHERE id = $id";
// echo $query;
// exit;

    if (mysqli_query($db, $query)) {
        http_response_code(200);
        echo json_encode(["status" => "success", "message" => "JOB Order Route updated successfully."]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Failed Route update."]);
    }

?>