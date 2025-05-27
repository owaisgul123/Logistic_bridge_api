<?php
include("../config.php");

$access_key = '03201232927';
$user_id = $_GET['user_id'];
// $freight_forwarder_id = intval($_GET['freight_forwarder_id']);

if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    exit;
}

if (!isset($_GET['key']) || $_GET['key'] !== $access_key) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Invalid access or missing parameters."]);
    exit;
}
if ($user_id == 1) {
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
LEFT JOIN countries pickup ON po.pickup_location_id = pickup.id
LEFT JOIN countries delivery ON po.delivery_location_id = delivery.id
where is_signed = 1";
    $stmt = $db->prepare($sql);
    $stmt->execute();
    $result = $stmt->get_result();

    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }

    http_response_code(200);
    echo json_encode(["status" => "success", "data" => $data]);
    exit;
}
else{
    
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
where is_signed = 1 AND freight_forwarder_id = ?;";
    $stmt = $db->prepare($sql);
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $result = $stmt->get_result();
    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = $row;
    }
    
    http_response_code(200);
    echo json_encode(["status" => "success", "data" => $data]);

}

?>
