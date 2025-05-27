<?php

include("../config.php");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

$jo_id = $_POST['row_id'] ?? null;
$transporter_id = $_POST['transporter_id'] ?? null;
// $checkbox = $_POST['checkbox'] ?? null;
// $remarks = $_POST['remarks'] ?? null;
if (!$jo_id) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Missing po_number."]);
    exit;
}

$query = "UPDATE job_orders SET transporter_id = $transporter_id WHERE id = $jo_id";
// echo $query;
// exit;

if (mysqli_query($db, $query)) {

    http_response_code(200);
    echo json_encode(["status" => "success", "message" => "Job Order Transporter assigned successfully."]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Purchase Order not found."]);
}
