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
// all vehicles admin 
    $sql = "SELECT * FROM `vehicles`;";
    $result = $db->query($sql);

    if ($result->num_rows > 0) {
        $users = $result->fetch_all(MYSQLI_ASSOC);
        http_response_code(200); // OK
        echo json_encode(["status" => "success", "message" => "vehicles fetched successfully", "data" => $users]);
        exit;
    } else {
        http_response_code(404); // Not Found
        echo json_encode(["status" => "error", "message" => "No vehicles found"]);
        exit;
    }
}
else {
    // all vehicles admin 
        $sql = "SELECT * FROM `vehicles` v where v.owned_by = $user_id;";
        $result = $db->query($sql);
    
        if ($result->num_rows > 0) {
            $users = $result->fetch_all(MYSQLI_ASSOC);
            http_response_code(200); // OK
            echo json_encode(["status" => "success", "message" => "vehicles fetched successfully", "data" => $users]);
            exit;
        } else {
            http_response_code(404); // Not Found
            echo json_encode(["status" => "error", "message" => "No vehicles found"]);
            exit;
        }
    }
    