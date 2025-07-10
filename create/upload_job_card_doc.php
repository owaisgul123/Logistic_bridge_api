<?php

include("../config.php");

// var_dump($_POST);
// var_dump($_FILES);
// exit;

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    exit;
}

$jc_id = $_POST["job_card_id"] ?? null;
$uploaded_by = $_POST["uploaded_by"] ?? null;
$remarks = null;
$docs = [
    "tir" => null,
    "cmr" => null,
    "gd"  => null,
];

foreach ($docs as $type => &$filename) {
    if (isset($_FILES[$type])) {
        foreach ($_FILES[$type]['error'] as $index => $error) {
            if ($error === UPLOAD_ERR_OK) {
                $remarks = $_POST[$type . "_remarks"][$index] ?? null; // Get remarks for the specific document type
                $filename = rand(1000, 100000) . "-" . $_FILES[$type]['name'][$index];
                move_uploaded_file($_FILES[$type]['tmp_name'][$index], "../uploads/jobcards/" . $filename);

                // Insert record into job_card_documents table  
                $stmt = $db->prepare("INSERT INTO job_card_documents (job_card_id, doc_type, file_name, remarks,uploaded_by, created_at)
                              VALUES (?, ?, ?,?, ?, NOW())");
                $stmt->bind_param("isssi", $jc_id, $type, $filename, $remarks,$uploaded_by);
                $stmt->execute() or die(json_encode(["status" => "error", "message" => "Failed to insert document: " . $stmt->error]));
                $stmt->close();
            }
        }
    }
}

http_response_code(201);
echo json_encode(["status" => "success", "message" => "Documents uploaded successfully"]);
