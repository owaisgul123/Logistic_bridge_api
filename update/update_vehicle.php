<?php

include("../config.php");

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

// Required field
if (!isset($_POST["vehicle_id"])) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Vehicle ID is required."]);
    exit;
}

// Get data
$vehicle_id = $_POST["vehicle_id"];
$prime_mover_reg_no = $_POST["prime_mover_reg_no"];
$trailer_reg_no = $_POST["trailer_reg_no"];
$country_of_registration = $_POST["country_of_registration"];
$make = $_POST["make"];
$model = $_POST["model"];
$load_compartment_type = $_POST["load_compartment_type"];
$cooling_capacity = $_POST["cooling_capacity"];
$carrying_capacity = $_POST["carrying_capacity"];
$volume = $_POST["volume"];
$no_of_axles = $_POST["no_of_axles"];
$owned_by = $_POST["owned_by"];
$created_by = $_POST["created_by"];

// File handling (optional)
$registration_document = "";
if (isset($_FILES['registration_document']) && $_FILES['registration_document']['error'] === UPLOAD_ERR_OK) {
    $registration_document = rand(1000, 100000) . "-" . $_FILES['registration_document']['name'];
    move_uploaded_file($_FILES['registration_document']['tmp_name'], "../uploads/vehicles/" . $registration_document);
}

$picture = "";
if (isset($_FILES['picture']) && $_FILES['picture']['error'] === UPLOAD_ERR_OK) {
    $picture = rand(1000, 100000) . "-" . $_FILES['picture']['name'];
    move_uploaded_file($_FILES['picture']['tmp_name'], "../uploads/vehicles/" . $picture);
}

// Update query
$sql = "UPDATE vehicles SET 
            prime_mover_reg_no = ?, 
            trailer_reg_no = ?, 
            country_of_registration = ?, 
            registration_document = ?, 
            picture = ?, 
            make = ?, 
            model = ?, 
            load_compartment_type = ?, 
            cooling_capacity = ?, 
            carrying_capacity = ?, 
            volume = ?, 
            no_of_axles = ?, 
            owned_by = ?, 
            created_by = ?, 
            updated_at = NOW() 
        WHERE id = ?";

$stmt = $db->prepare($sql);
$stmt->bind_param("sssssssssdiiiii", 
    $prime_mover_reg_no,
    $trailer_reg_no,
    $country_of_registration,
    $registration_document,
    $picture,
    $make,
    $model,
    $load_compartment_type,
    $cooling_capacity,
    $carrying_capacity,
    $volume,
    $no_of_axles,
    $owned_by,
    $created_by,
    $vehicle_id
);

// Execute
if ($stmt->execute()) {
    if ($stmt->affected_rows > 0) {
        http_response_code(200);
        echo json_encode(["status" => "success", "message" => "Vehicle updated successfully."]);
    } else {
        http_response_code(404);
        echo json_encode(["status" => "error", "message" => "Vehicle not found or no changes made."]);
    }
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to update vehicle."]);
}

?>
