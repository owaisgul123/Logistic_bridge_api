<?php

include("../config.php");

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(["status" => "error", "message" => "Invalid request method."]);
    exit;
}


$job_card_id     = $_POST['job_card_id'];
$direction       = $_POST['direction'];
$country         = $_POST['country'];
$location        = $_POST['location'];
$description     = $_POST['description'];
// $exchange_rate   = $_POST['exchange_rate'];
$currency        = $_POST['currency'];
$local_expenses  = $_POST['local_expenses'];

$rate_stmt = $db->prepare("SELECT rate_to_usd, usd_to_pkr FROM exchange_rates WHERE currency_code = ?");
$rate_stmt->bind_param("s", $currency);
$rate_stmt->execute();
$rate_result = $rate_stmt->get_result();
$rate_row = $rate_result->fetch_assoc();


$rate_to_usd = $rate_row['rate_to_usd'];
$usd_to_pkr = $rate_row['usd_to_pkr'];

// Calculate
$converted_usd = $local_expenses / $rate_to_usd;
$converted_pkr = $converted_usd * $usd_to_pkr;
$exchange_rate   = $rate_to_usd;

$expense_type    = $_POST['expense_type'];
// $converted_usd   = $_POST['converted_usd'];
// $converted_pkr   = $_POST['converted_pkr'];
$created_by      = $_POST['created_by'];

$stmt = $db->prepare("INSERT INTO expenses (
    job_card_id, direction, country, location, description, exchange_rate, currency,
    local_expenses, expense_type, converted_usd, converted_pkr, created_at, created_by
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)");

$stmt->bind_param(
    "isiisssssssi",
    $job_card_id,
    $direction,
    $country,
    $location,
    $description,
    $exchange_rate,
    $currency,
    $local_expenses,
    $expense_type,
    $converted_usd,
    $converted_pkr,
    $created_by
);

if ($stmt->execute()) {
    http_response_code(201);
    echo json_encode(["status" => "success", "message" => "Expense logged successfully"]);
} else {
    http_response_code(500);
    echo json_encode(["status" => "error", "message" => "Failed to log expense"]);
}
?>
