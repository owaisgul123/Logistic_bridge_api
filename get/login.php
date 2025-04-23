<?php
// header("Content-Type: application/json");

include("../config.php");

$access_key = '03201232927';

// Check if request method is POST
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

// Validate input fields
if (!isset($_GET['username']) || !isset($_GET['password'])) {
    http_response_code(400); // Bad Request
    echo json_encode(["status" => "error", "message" => "Username and password are required."]);
    exit;
}

$myusername = $_GET['username'];
$mypassword = $_GET['password'];    

// Use prepared statement to prevent SQL injection
$stmt = $db->prepare("SELECT id, name, email, role_id, parent_id FROM users WHERE email = ? AND `description` = ?");
$stmt->bind_param("ss", $myusername, $mypassword);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $user = $result->fetch_assoc();
    http_response_code(200); // OK
    echo json_encode(["status" => "success", "message" => "Login successful", "data" => $user]);
} else {
    http_response_code(401); // Unauthorized
    echo json_encode(["status" => "error", "message" => "Invalid username or password"]);
}

$stmt->close();
$db->close();   
