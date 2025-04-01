<?php
include("../config.php");

// header('Content-Type: application/json');
$access_key = '03201232927';
// $role_id = $_GET['role_id'];
$user_id = $_GET['id'];
// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'DELETE') {
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

// $user_id = $_POST['user_id'] ?? null;

if (!$user_id) {
    echo json_encode(['error' => 'User ID is required']);
    http_response_code(400);
    exit;
}

$db->begin_transaction();
 
try {
    $stmt1 = $db->prepare("DELETE FROM user_info WHERE user_id = ?");
    $stmt1->bind_param("i", $user_id);
    $stmt1->execute();

    $stmt2 = $db->prepare("DELETE FROM users WHERE id = ?");
    $stmt2->bind_param("i", $user_id);
    $stmt2->execute();

    $db->commit();
    echo json_encode(['success' => 'User deleted successfully']);
    http_response_code(200);
} catch (Exception $e) {
    $db->rollback();
    echo json_encode(['error' => 'Deletion failed']);
    http_response_code(500);
}
