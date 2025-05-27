<?php

include("../config.php");

// Check request method
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

// Extract vehicle data from POST request
$prime_mover_reg_no = $_POST["prime_mover_reg_no"] ?? null;
$trailer_reg_no = $_POST["trailer_reg_no"];
$chasis_no = $_POST["chasis_no"];
$country_of_registration = $_POST["country_of_registration"] ?? null;
// $registration_document = $_POST["registration_document"];
// $picture = $_POST["picture"];
$make = $_POST["make"] ?? null;
$model = $_POST["model"] ?? null;
$load_compartment_type = $_POST["load_compartment_type"] ?? null;
$cooling_capacity = $_POST["cooling_capacity"] ?? null;
$carrying_capacity = $_POST["carrying_capacity"] ?? null;
$volume = $_POST["volume"] ?? null;
$no_of_axles = $_POST["no_of_axles"] ?? null;
$owned_by = $_POST["owned_by"];
$created_by = $_POST["created_by"];

$file1 = null;

// if (isset($_FILES['picture']) && $_FILES['picture']['error'] === UPLOAD_ERR_OK) {
//     $file1 = rand(1000, 100000) . "-" . $_FILES['picture']['name'];
//     $file_loc1 = $_FILES['picture']['tmp_name'];
//     $folder1 = "../uploads/vehicles/";   

//     move_uploaded_file($file_loc1, $folder1 . $file1);
// }








$file = null;
// if (isset($_FILES['registration_document']) && $_FILES['registration_document']['error'] === UPLOAD_ERR_OK) {
//     $file = rand(1000, 100000) . "-" . $_FILES['registration_document']['name'];
//     $file_loc = $_FILES['registration_document']['tmp_name'];
//     $file_size = $_FILES['registration_document']['size'];
//     $file_type = $_FILES['registration_document']['type'];
//     $folder = "../uploads/vehicles/";
//     move_uploaded_file($file_loc, $folder . $file);
// }


// Insert vehicle into `vehicles` table
$stmt = $db->prepare("INSERT INTO vehicles (prime_mover_reg_no, trailer_reg_no, country_of_registration, registration_document, picture, make, model, chasis_no, load_compartment_type, cooling_capacity, carrying_capacity, volume, no_of_axles, owned_by, created_by, created_at, updated_at) 
                      VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");

$stmt->bind_param("ssssssssssdiiii", $prime_mover_reg_no, $trailer_reg_no, $country_of_registration, $file, $file1, $make, $model, $chasis_no,$load_compartment_type, $cooling_capacity, $carrying_capacity, $volume, $no_of_axles, $owned_by, $created_by);

if ($stmt->execute()) {
    http_response_code(201);
    echo json_encode(["status" => "success", "message" => "Vehicle created successfully", "vehicle_id" => $stmt->insert_id]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to insert vehicle"]);
}   

?>
