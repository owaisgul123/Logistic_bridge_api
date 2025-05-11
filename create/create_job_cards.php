<?php

include("../config.php");

$access_key = '03201232927';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    exit;
}

    

$purchase_order_id = $_POST['purchase_order_id'];
$job_order_id = $_POST['job_order_id'];
$created_by = $_POST['created_by'];
$route = $_POST['route'];

$trucks = $_POST['trucks'];
$drivers = $_POST['drivers'];

if (count($trucks) !== count($drivers)) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Trucks and Drivers count mismatch."]);
    exit;
}

$inserted = [];

for ($i = 0; $i < count($trucks); $i++) {
    $truck_id = $trucks[$i];
    $driver_id = $drivers[$i];

    $seq = str_pad($i + 1, 3, '0', STR_PAD_LEFT);
    $job_card_number = "$seq/PO-$purchase_order_id";

    // Handle file uploads
    $tir = uploadFile("tir_$i");
    $cmr = uploadFile("cmr_$i");
    $gd = uploadFile("gd_$i");

    $stmt = $db->prepare("INSERT INTO job_cards (
        purchase_order_id, job_order_id, job_card_number, truck_id, driver_id, `route`, tir, cmr, gd, created_by, created_at, updated_at
    ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");

    $stmt->bind_param("iisiissssi", $purchase_order_id, $job_order_id, $job_card_number, $truck_id, $driver_id, $route, $tir, $cmr, $gd, $created_by);

    if ($stmt->execute()) {
        $inserted[] = $stmt->insert_id;
    }
}

http_response_code(201);
echo json_encode([
    "status" => "success",
    "message" => "Job cards with documents created successfully",
    "inserted_ids" => $inserted
]);

// Upload helper
function uploadFile($field) {
    if (!isset($_FILES[$field]) || $_FILES[$field]['error'] !== UPLOAD_ERR_OK) {
        return null;
    }
    $filename = rand(1000, 9999) . '-' . basename($_FILES[$field]['name']);
    $target = "../uploads/jobcards/" . $filename;
    move_uploaded_file($_FILES[$field]['tmp_name'], $target);
    return $filename;
}

?>
