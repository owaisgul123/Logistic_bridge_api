<?php

include("../config.php");

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use GET."]);
    exit;
}

// Get key and user_id
$key = $_GET['key'];
$user_id = $_GET['user_id'];

if ($key !== "03201232927") {
    http_response_code(403);
    echo json_encode(["status" => "error", "message" => "Unauthorized access key"]);
    exit;
}


if ($user_id == 1) {
    $query = "SELECT * FROM drivers ORDER BY id DESC";
    $stmt = $db->prepare($query);
} else {
    $query = "SELECT * FROM drivers WHERE parent_id = ? ORDER BY id DESC";
    $stmt = $db->prepare($query);
    $stmt->bind_param("i", $user_id);
}

$stmt->execute();
$result = $stmt->get_result();
$drivers = [];

while ($row = $result->fetch_assoc()) {
    $drivers[] = $row;
}

echo json_encode(["status" => "success", "data" => $drivers]);
