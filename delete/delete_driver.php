<?php
include("../config.php");

if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

$driver_id = $_GET['id'] ?? null;

if (!$driver_id) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Driver ID is required."]);
    exit;
}

$stmt = $db->prepare("DELETE FROM drivers WHERE id = ?");
$stmt->bind_param("i", $driver_id);

if ($stmt->execute()) {
    http_response_code(200);
    echo json_encode(["status" => "success", "message" => "Driver deleted successfully."]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to delete driver."]);
}
?>
