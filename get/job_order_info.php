<?php
include("../config.php");

$access_key = '03201232927';

if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    exit;
}

if (!isset($_GET['key']) || $_GET['key'] !== $access_key || !isset($_GET['id'])) {
    http_response_code(400);
    echo json_encode(["status" => "error", "message" => "Invalid key or missing ID."]);
    exit;
}

$id = intval($_GET['id']);

$sql = "SELECT o.*, u.name FROM job_orders o LEFT JOIN users u ON o.transporter_id = u.id WHERE o.id = ?";
$stmt = $db->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();

$data = $result->fetch_assoc();

if ($data) {
    http_response_code(200);
    echo json_encode(["status" => "success", "data" => $data]);
} else {
    http_response_code(404);
    echo json_encode(["status" => "error", "message" => "Job order not found."]);
}
?>
