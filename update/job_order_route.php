<?php
include("../config.php");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Check if the 'route' parameter exists in the POST request
    if (isset($_POST['route'])) {
        $route_json = $_POST['route'];
        $id = $_POST['id'];

        // Validate if the received data is a valid JSON string
        // Assuming you have a table named 'your_table' and a column named 'route'
        $sql = "UPDATE job_orders SET route = ? WHERE id = ?";
        $stmt = $db->prepare($sql);

        $stmt->bind_param("si", $route_json, $id);
        if ($stmt->execute()) {
            http_response_code(200); // OK
            echo json_encode(["status" => "success", "message" => "Route Updated successfully"]);
        } else {
            http_response_code(500); // Internal Server Error
            echo json_encode(["error" => "Failed to update route"]);
        }
        $stmt->close();
    } else {
        http_response_code(400); // Bad Request
        echo json_encode(["status" => "error", "message" => "Missing parmeters"]);
    }
} else {
    http_response_code(405); // Method Not Allowed
    echo json_encode(["status" => "error", "message" => "Method Not Allowed"]);
}

// Close the database connection (if applicable)
// $conn->close();