<?php

include("../config.php");

$access_key = '03201232927';

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

// Validate access key
// $_POST = json_decode(file_get_contents("php://input"), true);


// Extract user _POST$_POST
$reg_no = $_POST["trailer_reg_no"];
$id = $_POST["row_id"];


// Insert user into `users` table
$stmt = $db->prepare("UPDATE vehicles SET trailer_reg_no = ? where id = ?");
$stmt->bind_param("si", $reg_no, $id);

if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode(["status" => "success", "message" => "Vehicle Info Updated successfully"]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to Update user"]);
}
?>
