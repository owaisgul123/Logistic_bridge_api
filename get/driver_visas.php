<?php
// header("Content-Type: application/json");

include("../config.php");

$access_key = '03201232927';
// $role_id = $_GET['role_id'];
$driver_id = $_GET['driver_id'];
// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405); // Method Not Allowed
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use GET."]);
    exit;
}

// Validate access key
if (!isset($_GET["key"]) || $_GET["key"] !== $access_key) {
    http_response_code(401); // Unauthorized
    echo json_encode(["status" => "error", "message" => "Invalid access key."]);
    exit;
}

// Fetch drivers

$sql = "SELECT v.* FROM driver_visas v   
WHERE v.driver_id = $driver_id ORDER BY DATE(expiry_date) ASC;
";
$result = $db->query($sql);

if ($result->num_rows > 0) {
    $users = $result->fetch_all(MYSQLI_ASSOC);
    http_response_code(200); // OK
    echo json_encode(["status" => "success", "message" => "Visa's fetched successfully", "data" => $users]);
} else {
    http_response_code(404); // Not Found
    echo json_encode(["status" => "error", "message" => "No Visa's found"]);
}
