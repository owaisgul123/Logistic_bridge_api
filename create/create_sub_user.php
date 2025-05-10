<?php

include("../config.php");

$access_key = '03201232927';

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

// Validate access key
// $_POST = json_decode(file_get_contents("php://input"), true);


// Extract user _POST$_POST
$name = $_POST["name"];
$email = $_POST["email"];
$password = md5($_POST["password"]); // Hash password
$description = $_POST["password"];
$role_id = $_POST["role_id"];
$parent_id = $_POST["parent_id"] ?? null;



// Insert user into `users` table
$stmt = $db->prepare("INSERT INTO users (name, email, password, description, role_id, parent_id, created_at, updated_at) 
                      VALUES (?, ?, ?, ?, ?, ?, NOW(), NOW())");
$stmt->bind_param("ssssii", $name, $email, $password, $description, $role_id, $parent_id);

if ($stmt->execute()) {
    $user_id = $stmt->insert_id; // Get last inserted user ID

    // Extract user_info _POST$_POST
    $name = $_POST["name"];
    // $address_ho = $_POST["address_ho"];
    // $address_1 = $_POST["address_1"];
    // $address_2 = $_POST["address_2"];
    // $address_3 = $_POST["address_3"];
    // $ntn_no = $_POST["ntn_no"];
    // $reg_no = $_POST["reg_no"];
    // $license_no = $_POST["license_no"];
    // $validity = $_POST["validity"];
    // $nature_of_business = $_POST["nature_of_business"];
    // $sub_role = $_POST["sub_role"];
    $email = $_POST["email"];
    $phone = $_POST["phone"];
    $phone_2 = $_POST["phone_2"];
    $whatsapp_num = $_POST["whatsapp_num"];
    $telegram = $_POST["telegram"];
    $location = $_POST["location"];

    // Insert into `user_info` table
    $stmt2 = $db->prepare("INSERT INTO user_info (user_id, name, address_ho, address_1, address_2, address_3, ntn_no, reg_no, license_no, validity, nature_of_business, sub_role, email, phone, phone_2, whatsapp_num, telegram, location, created_at, updated_at) 
                           VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");
    $stmt2->bind_param("isssssssssssssssss", $user_id, $name, $address_ho, $address_1, $address_2, $address_3, $ntn_no, $reg_no, $license_no, $validity, $nature_of_business, $sub_role, $email, $phone, $phone_2, $whatsapp_num, $telegram, $location);

    if ($stmt2->execute()) {
        http_response_code(201);
        echo json_encode(["status" => "success", "message" => "User and User Info created successfully", "user_id" => $user_id]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Failed to insert user_info"]);
    }
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to insert user"]);
}
?>
