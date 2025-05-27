<?php
// header("Content-Type: application/json");

include("../config.php");

$access_key = '03201232927';
// $role_id = $_GET['role_id'];
$id = $_GET['id'];
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

    $sql = "SELECT 
    po.*,
    -- Names from related tables
    cp.name AS contracting_party_name,
    roles.name AS contracting_party_role,
    shipper.name AS shipper_name,
    forwarder.name AS freight_forwarder_name,
    broker.name AS broker_name,
    comm.name AS commodity_name,
    pickup.name AS pickup_city,
    delivery.name AS delivery_city

FROM purchase_orders po

-- Join related tables
LEFT JOIN users cp ON po.contracting_party_id = cp.id
LEFT JOIN roles ON po.contracting_party_role_id = roles.id
LEFT JOIN users shipper ON po.shipper_id = shipper.id
LEFT JOIN users forwarder ON po.freight_forwarder_id = forwarder.id
LEFT JOIN users broker ON po.broker_id = broker.id
LEFT JOIN commodities comm ON po.commodity_id = comm.id
LEFT JOIN cities pickup ON po.pickup_location_id = pickup.id
LEFT JOIN cities delivery ON po.delivery_location_id = delivery.id
where po.id = $id;";
    $result = $db->query($sql);

    if ($result->num_rows > 0) {
        $users = $result->fetch_all(MYSQLI_ASSOC);
        http_response_code(200); // OK
        echo json_encode(["status" => "success", "message" => " Purchase Orders  fetched successfully", "data" => $users]);
    } else {
        http_response_code(404); // Not Found
        echo json_encode(["status" => "error", "message" => "No  Purchase Orders  found"]);
    }

?>