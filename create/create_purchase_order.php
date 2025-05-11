<?php

include("../config.php");


if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method. Use POST."]);
    exit;
}

// var_dump($_FILES);
// exit;

// Extract fields
// $po_number = $_POST['po_number'];
$contracting_party_id = $_POST['contracting_party_id'];
$contracting_party_role_id = $_POST['contracting_party_role_id'];
$shipper_id = $_POST['shipper_id'];
$freight_forwarder_id = $_POST['freight_forwarder_id'];
$broker_id = $_POST['broker_id'];
$pickup_location_id = $_POST['pickup_location_id'];
$delivery_location_id = $_POST['delivery_location_id'];
$commodity_id = $_POST['commodity_id'];
$total_quantity = $_POST['total_quantity'];
$truck_count = $_POST['truck_count'];
$contract_type = $_POST['contract_type'];
// $contract_file = $_POST['contract_file'] ?? null;
$route_description = $_POST['route_description'] ?? null;
$estimated_transit_days = $_POST['estimated_transit_days'];
$created_by = $_POST['created_by'];

$contract_file = null;
if (isset($_FILES['contract_file']) && $_FILES['contract_file']['error'] === UPLOAD_ERR_OK) {
    $contract_file = rand(1000, 100000) . "-" . $_FILES['contract_file']['name'];
    move_uploaded_file($_FILES['contract_file']['tmp_name'], "../uploads/purchase_orders/" . $contract_file);
}

// echo $contract_file;

// exit;
$result = $db->query("SELECT MAX(id) AS last_id FROM purchase_orders");
$row = $result->fetch_assoc();
$next_id = $row['last_id'] + 1;

// contract document upload



// Step 2: Format as 3-digit code
$po_number = "PO-". str_pad($next_id, 3, '0', STR_PAD_LEFT); // e.g., 001, 002


$stmt = $db->prepare("INSERT INTO purchase_orders (
    po_number, contracting_party_id, contracting_party_role_id, shipper_id, 
    freight_forwarder_id, broker_id, pickup_location_id, delivery_location_id, 
    commodity_id, total_quantity, truck_count, contract_type, contract_file, 
    route_description, estimated_transit_days, created_by, created_at, updated_at
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), NOW())");

$stmt->bind_param(
    "siiiiiiiiiidssii",
    $po_number, $contracting_party_id, $contracting_party_role_id, $shipper_id,
    $freight_forwarder_id, $broker_id, $pickup_location_id, $delivery_location_id,
    $commodity_id, $total_quantity, $truck_count, $contract_type, $contract_file,
    $route_description, $estimated_transit_days, $created_by
);

if ($stmt->execute()) {
   $po_id = $stmt->insert_id;

    // Create job order number (e.g. JO-001/PO-001)
    $job_order_number = 'JO-' . str_pad($po_id, 3, '0', STR_PAD_LEFT) . '/' . $po_number;

    $stmt2 = $db->prepare("INSERT INTO job_orders (
        purchase_order_id, job_order_number, route, status, created_by, created_at, updated_at
    ) VALUES (?, ?, ?, 0, ?, NOW(), NOW())");

    $stmt2->bind_param("issi", $po_id, $job_order_number, $route_description, $created_by);

    if ($stmt2->execute()) {
        http_response_code(201);
        echo json_encode([
            "status" => "success",
            "message" => "Purchase Order and Job Order created successfully",
            "po_id" => $po_id,
            "job_order_id" => $stmt2->insert_id
        ]);
    } else {
        http_response_code(500);
        echo json_encode(["status" => "error", "message" => "Purchase Order created, but failed to create Job Order"]);
    }
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to create Purchase Order"]);
}

?>
