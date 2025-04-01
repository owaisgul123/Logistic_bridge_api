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

$sql = "SELECT u.id, u.name, u.email, u.password, u.description, u.role_id, u.parent_id,  
       ui.address_ho, ui.address_1, ui.address_2, ui.address_3,  
       ui.ntn_no, ui.reg_no, ui.license_no, ui.validity, ui.nature_of_business,  
       ui.sub_role, ui.phone, ui.phone_2, ui.whatsapp_num, ui.telegram, ui.location  
FROM users u  
LEFT JOIN user_info ui ON u.id = ui.user_id  
WHERE u.id = $user_id;
";
$result = $db->query($sql);

if ($result->num_rows > 0) {
    $users = $result->fetch_all(MYSQLI_ASSOC);
    http_response_code(200); // OK
    echo json_encode(["status" => "success", "message" => "Users fetched successfully", "data" => $users]);
} else {
    http_response_code(404); // Not Found
    echo json_encode(["status" => "error", "message" => "No users found"]);
}
