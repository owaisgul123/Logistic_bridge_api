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

// Insert into `drivers` table
$stmt = $db->prepare("INSERT INTO drivers (name, employee_number, passport_number, passport_scan, national_id_number, national_id_scan, cell_1, cell_2, cell_3, cell_4, email, parent_id, created_at, updated_at)
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");
$stmt->bind_param("sssssssssssi", $name, $employee_number, $passport_number, $passport_scan, $national_id_number, $national_id_scan, $cell_1, $cell_2, $cell_3, $cell_4, $email, $parent_id);

if ($stmt->execute()) {
    $driver_id = $stmt->insert_id;

    // Visa details
    $visa_country = $_POST["visa_country"];
    $visa_number = $_POST["visa_number"];
    $visa_expiry = $_POST["visa_expiry"];

    // Visa scan upload
    $visa_scan = null;
    if (isset($_FILES['visa_scan']) && $_FILES['visa_scan']['error'] === UPLOAD_ERR_OK) {
        $visa_scan = rand(1000, 100000) . "-" . $_FILES['visa_scan']['name'];
        move_uploaded_file($_FILES['visa_scan']['tmp_name'], "../uploads/visas/" . $visa_scan);
    }

    // Insert into `driver_visas` table
    $stmt2 = $db->prepare("INSERT INTO driver_visas (driver_id, country, visa_number, expiry_date, visa_scan, created_at, updated_at)
                           VALUES (?, ?, ?, ?, ?, NOW(), NOW())");
    $stmt2->bind_param("issss", $driver_id, $visa_country, $visa_number, $visa_expiry, $visa_scan);

    if ($stmt2->execute()) {
        http_response_code(201);
        echo json_encode(["status" => "success", "message" => "Driver and visa created successfully", "driver_id" => $driver_id]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Driver created, but failed to save visa"]);
    }
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to create driver"]);
}

?>
