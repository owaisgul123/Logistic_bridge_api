<?php
// header("Content-Type: application/json");

include("../config.php");

$access_key = '03201232927';
// $role_id = $_GET['role_id'];
$user_id = $_GET['user_id'];
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

// Fetch users
if ($user_id ==  1) {

    $sql = "SELECT o.* FROM job_orders o";
    $result = $db->query($sql);

    if ($result->num_rows > 0) {
        $users = $result->fetch_all(MYSQLI_ASSOC);
        http_response_code(200); // OK
        echo json_encode(["status" => "success", "message" => "Users fetched successfully", "data" => $users]);
    } else {
        http_response_code(404); // Not Found
        echo json_encode(["status" => "error", "message" => "No users found"]);
    }
} else {
    $sql = "SELECT o.* FROM job_orders o where o.created_by = ?";
    $stmt = $db->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result->num_rows > 0) {
        $users = $result->fetch_all(MYSQLI_ASSOC);
        http_response_code(200); // OK
        echo json_encode(["status" => "success", "message" => "Users fetched successfully", "data" => $users]);
    } else {
        http_response_code(404); // Not Found
        echo json_encode(["status" => "error", "message" => "No users found"]);
    }
    $stmt->close();
}
