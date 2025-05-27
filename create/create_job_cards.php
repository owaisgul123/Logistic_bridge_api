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
$route = null;

$trucks = $_POST['trucks'];
$drivers = $_POST['drivers'];

if (count($trucks) !== count($drivers)) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Trucks and Drivers count mismatch."]);
    exit;
}

$inserted = [];
// Get the current maximum sequence number for this PO
$stmt = $db->prepare("SELECT MAX(CAST(SUBSTRING_INDEX(job_card_number, '/', 1) AS UNSIGNED)) 
                      FROM job_cards 
                      WHERE purchase_order_id = ?");
$stmt->bind_param("i", $purchase_order_id);
$stmt->execute();
$result = $stmt->get_result();
$max_seq = $result->fetch_row()[0] ?? 0; // Default to 0 if no records exist
$stmt->close();

for ($i = 0; $i < count($trucks); $i++) {
    $truck_id = $trucks[$i];
    $driver_id = $drivers[$i];

    // Generate sequential job card number
    $seq = str_pad($max_seq + $i + 1, 3, '0', STR_PAD_LEFT); // Increment from max_seq
    $job_card_number = "$seq/PO-$purchase_order_id";

    // Rest of your code (file uploads, insert, etc.)
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
