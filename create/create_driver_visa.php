<?php
include("../config.php");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

// echo var_dump($_POST);
// echo var_dump($_FILES);
// exit;

$driver_id = $_POST["driver_id"] ?? null;
if (!$driver_id) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Driver ID is required."]);
    exit;
}

// TRY-CATCH ONLY FOR DELETE QUERY (as requested)
try {
    $stmt_delete = $db->prepare("DELETE FROM driver_visas WHERE driver_id = ?");
    $stmt_delete->bind_param("i", $driver_id);
    $stmt_delete->execute() or die(json_encode(["status" => "error", "message" => "Failed to delete existing visas: " . $stmt_delete->error]));
    $stmt_delete->close();
} catch (Exception $e) {
    // http_response_code(500);
    $output =  json_encode(["status" => "error", "message" => "Delete operation failed: " . $e->getMessage()]);
    // exit;
}

// REST OF YOUR ORIGINAL CODE (unchanged)
$visa_countries = $_POST["visa_country"];
$visa_numbers = $_POST["visa_number"];
$visa_expiries = $_POST["visa_expiry"];
$visa_scans = $_FILES["visa_scan"];

for ($i = 0; $i < count($visa_countries); $i++) {
    $visa_country = $visa_countries[$i];
    $visa_number = $visa_numbers[$i];
    $visa_expiry = $visa_expiries[$i];

    $visa_scan = null;
    if (isset($visa_scans['name'][$i]) && $visa_scans['error'][$i] === UPLOAD_ERR_OK) {
        $visa_scan = rand(1000, 100000) . "-" . $visa_scans['name'][$i];
        move_uploaded_file($visa_scans['tmp_name'][$i], "../uploads/visas/" . $visa_scan);
    }
    else {
        $visa_scan = $_POST['file_hidden'][$i];
    }

    $stmt = $db->prepare("INSERT INTO driver_visas (driver_id, country, visa_number, expiry_date, visa_scan, created_at, updated_at) 
                         VALUES (?, ?, ?, ?, ?, NOW(), NOW())");
    $stmt->bind_param("issss", $driver_id, $visa_country, $visa_number, $visa_expiry, $visa_scan);
    $stmt->execute() or die(json_encode(["status" => "error", "message" => "Failed to insert visa: " . $stmt->error]));
}

http_response_code(201);
echo json_encode(["status" => "success", "message" => "Visa's inserted successfully"]);
?>