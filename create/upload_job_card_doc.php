<?php

include("../config.php");

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

$jc_id = $_POST["job_card_id"] ?? null;
// Handle passport scaan upload
$tir = null;
if (isset($_FILES['tir']) && $_FILES['tir']['error'] === UPLOAD_ERR_OK) {
    $tir = rand(1000, 100000) . "-" . $_FILES['tir']['name'];
    move_uploaded_file($_FILES['tir']['tmp_name'], "../uploads/jobcards/" . $tir);
}

// Handle national ID scan upload
$cmr = null;
if (isset($_FILES['cmr']) && $_FILES['cmr']['error'] === UPLOAD_ERR_OK) {
    $cmr = rand(1000, 100000) . "-" . $_FILES['cmr']['name'];
    move_uploaded_file($_FILES['cmr']['tmp_name'], "../uploads/jobcards/" . $cmr);
}
// handle group insurance scan upload
$gd_doc = null;
// $national_id_scan = null;
if (isset($_FILES['gd']) && $_FILES['gd']['error'] === UPLOAD_ERR_OK) {
    $gd_doc = rand(1000, 100000) . "-" . $_FILES['gd']['name'];
    move_uploaded_file($_FILES['gd']['tmp_name'], "../uploads/jobcards/" . $gd_doc);
}


// secuarity clearence
// test
// 

// Insert into `drivers` table

$stmt = $db->prepare("UPDATE job_cards 
                      SET tir = ?, 
                          gd = ?, 
                          cmr = ?,
                          updated_at = NOW()
                      WHERE id = ?");  

$stmt->bind_param("sssi", $tir, $gd_doc, $cmr, $jc_id);

if ($stmt->execute()) {
    // $driver_id = $stmt->insert_id; // Get last inserted driver ID
    http_response_code(201);
    echo json_encode(["status" => "success", "message" => "Documents Uploaded successfully"]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to create driver"]);
}
// $stmt->close();
$stmt->close();
?>