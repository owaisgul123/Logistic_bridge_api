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
$name = $_POST["name"];
$employee_number = $_POST["employee_no"];
$passport_number = $_POST["passport_no"];
$national_id_number = $_POST["national_id"];
$email = $_POST["email"];
$cell_1 = $_POST["cell_1"];
$cell_2 = $_POST["cell_2"] ?? null;
$cell_3 = $_POST["cell_3"] ?? null;
$cell_4 = $_POST["cell_4"] ?? null;
$parent_id = $_POST["parent_id"] ?? null;
$visa_country = $_POST["visa_country"];
$visa_number = $_POST["visa_number"];
$visa_expiry = $_POST["visa_expiry"];
$id = $_POST["row_id"];
//
// Insert user into `users` table
$stmt = $db->prepare("UPDATE drivers SET name = ?, employee_number = ?, passport_number = ?, national_id_number = ?, email = ?, cell_1 = ?, cell_2 = ?, cell_3 = ?, cell_4 = ?, parent_id = ?, updated_at = NOW() WHERE id = ?");
$stmt->bind_param("ssssssssiii", $name, $employee_number, $passport_number, $national_id_number, $email, $cell_1, $cell_2, $cell_3, $cell_4, $parent_id, $id);

if ($stmt->execute()) {
    $stmt = $db->prepare("UPDATE driver_visas SET country = ?, visa_number = ?, expiry_date = ? WHERE driver_id = ?");
    $stmt->bind_param("sssi", $visa_country, $visa_number, $visa_expiry, $id);
    if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode(["status" => "success", "message" => "Driver Info Updated successfully"]);
    }
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to Update user"]);
}
?>
