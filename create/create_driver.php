<?php

include("../config.php");

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

// Extract driver info
$name = $_POST["name"];
$blood_group = $_POST["blood_group"];
$employee_number = $_POST["employee_no"];
$passport_number = $_POST["passport_no"];
$national_id_number = $_POST["national_id"];
$email = $_POST["email"];
$cell_1 = $_POST["cell_1"];
$cell_2 = $_POST["cell_2"] ?? null;
$cell_3 = $_POST["cell_3"] ?? null;
$cell_4 = $_POST["cell_4"] ?? null;
$parent_id = $_POST["parent_id"] ?? null;

// Handle passport scan upload
$passport_scan = null;
if (isset($_FILES['passport_scan']) && $_FILES['passport_scan']['error'] === UPLOAD_ERR_OK) {
    $passport_scan = rand(1000, 100000) . "-" . $_FILES['passport_scan']['name'];
    move_uploaded_file($_FILES['passport_scan']['tmp_name'], "../uploads/drivers/" . $passport_scan);
}

// Handle national ID scan upload
$national_id_scan = null;
if (isset($_FILES['national_id_scan']) && $_FILES['national_id_scan']['error'] === UPLOAD_ERR_OK) {
    $national_id_scan = rand(1000, 100000) . "-" . $_FILES['national_id_scan']['name'];
    move_uploaded_file($_FILES['national_id_scan']['tmp_name'], "../uploads/drivers/" . $national_id_scan);
}
// driver_license
$driver_license = null;
if (isset($_FILES['driver_license']) && $_FILES['driver_license']['error'] === UPLOAD_ERR_OK) {
    $driver_license = rand(1000, 100000) . "-" . $_FILES['driver_license']['name'];
    move_uploaded_file($_FILES['driver_license']['tmp_name'], "../uploads/drivers/" . $driver_license);
}
// handle group insurance scan upload
$group_insurance_scan = null;
// $national_id_scan = null;
if (isset($_FILES['group_ins']) && $_FILES['group_ins']['error'] === UPLOAD_ERR_OK) {
    $group_insurance_scan = rand(1000, 100000) . "-" . $_FILES['group_ins']['name'];
    move_uploaded_file($_FILES['group_ins']['tmp_name'], "../uploads/drivers/" . $group_insurance_scan);
}

// secuarity clearence
$security_clearance_scan = null;   
if (isset($_FILES['sec_clearence']) && $_FILES['sec_clearence']['error'] === UPLOAD_ERR_OK) {
    $security_clearance_scan = rand(1000, 100000) . "-" . $_FILES['sec_clearence']['name'];
    move_uploaded_file($_FILES['sec_clearence']['tmp_name'], "../uploads/drivers/" . $security_clearance_scan);
}

// Insert into `drivers` table

$stmt = $db->prepare("INSERT INTO drivers (name, employee_number, blood_group, passport_number, passport_scan, national_id_number, national_id_scan, group_ins_card, sec_clearence_cert, driver_license, cell_1, cell_2, cell_3, cell_4, email, parent_id, created_at, updated_at)
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");
$stmt->bind_param("sssssssssssssssi", $name, $employee_number, $blood_group, $passport_number, $passport_scan, $national_id_number, $national_id_scan, $group_insurance_scan, $security_clearance_scan, $driver_license,$cell_1, $cell_2, $cell_3, $cell_4, $email, $parent_id);

if ($stmt->execute()) {
    $driver_id = $stmt->insert_id; // Get last inserted driver ID
    http_response_code(201);
    echo json_encode(["status" => "success", "message" => "Driver created successfully", "driver_id" => $driver_id]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to create driver"]);
}
// $stmt->close();
$stmt->close();
?>