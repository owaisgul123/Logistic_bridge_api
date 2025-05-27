<?php
include("../config.php");

$access_key = '03201232927';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    exit;
}


$id = intval($_POST['row_id']);
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
$route_description = null;
$estimated_transit_days = $_POST['estimated_transit_days'];

// Handle contract_file upload (optional)
$contract_file = null;
if (isset($_FILES['contract_file']) && $_FILES['contract_file']['error'] === UPLOAD_ERR_OK) {
    $contract_file = rand(1000, 9999) . "-" . $_FILES['contract_file']['name'];
    move_uploaded_file($_FILES['contract_file']['tmp_name'], "../uploads/purchase_orders/" . $contract_file);
} else {
    // Keep existing file if not replaced
    $contract_file = $_POST['contract_file_hidden'] ?? null;
    
}

$stmt = $db->prepare("UPDATE purchase_orders SET
    contracting_party_id = ?, contracting_party_role_id = ?, shipper_id = ?,
    freight_forwarder_id = ?, broker_id = ?, pickup_location_id = ?, delivery_location_id = ?,
    commodity_id = ?, total_quantity = ?, truck_count = ?, contract_type = ?,
    contract_file = ?, route_description = ?, estimated_transit_days = ?, updated_at = NOW()
    WHERE id = ?");

$stmt->bind_param(
    "iiiiiiiidssssii",
    $contracting_party_id, $contracting_party_role_id, $shipper_id,
    $freight_forwarder_id, $broker_id, $pickup_location_id, $delivery_location_id,
    $commodity_id, $total_quantity, $truck_count, $contract_type,
    $contract_file, $route_description, $estimated_transit_days, $id
);

if ($stmt->execute()) {
    http_response_code(200);
    echo json_encode(["status" => "success", "message" => "Purchase order updated successfully."]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to update purchase order."]);
}
?>
