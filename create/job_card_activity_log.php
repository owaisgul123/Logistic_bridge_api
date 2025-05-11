<?php

include("../config.php");


if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    exit;
}


$job_card_id = $_POST['job_card_id'];
$event_type = $_POST['event_type'];
$location_name = $_POST['location_name'];
$status = $_POST['status'];
$remarks = $_POST['remarks'] ?? null;

$stmt = $db->prepare("INSERT INTO job_card_logs (job_card_id, event_type, location_name, status, remarks, timestamp)
                      VALUES (?, ?, ?, ?, ?, NOW())");
$stmt->bind_param("issss", $job_card_id, $event_type, $location_name, $status, $remarks);

if ($stmt->execute()) {
    http_response_code(201);
    echo json_encode(["status" => "success", "message" => "Activity logged successfully"]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to log activity"]);
}
?>
