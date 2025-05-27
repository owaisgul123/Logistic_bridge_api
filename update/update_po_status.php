<?php

include("../config.php");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

$po_number = $_POST['po_id'] ?? null;
$checkbox = $_POST['checkbox'] ?? null;
$user_id = $_POST['user_id'] ?? null;
$remarks = $_POST['remarks'] ?? null;
if (!$po_number) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Missing po_number."]);
    exit;
}

$query = "UPDATE purchase_orders SET is_signed = $checkbox WHERE id = $po_number";
// echo $query;
// exit;

if (mysqli_query($db, $query)) {
    $act = $checkbox == 1 ? 'approved' : 'disapproved';
    $query= "INSERT INTO purchase_order_logs (purchase_order_id, `action`, changed_by, remarks) VALUES ('$po_number', '$act', '$user_id', '$remarks')";
    if (mysqli_query($db, $query)) {
        http_response_code(200);
        echo json_encode(["status" => "success", "message" => "Purchase Order status updated successfully."]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Failed to log the action."]);
    }
} else {
    http_response_code(404);
    echo json_encode(["status" => "error", "message" => "Purchase Order not found."]);
}
?>
