<?php
$servername = "localhost";
$username = "root";
$password = "";
$database = "zarodoga";

$conn = new mysqli($servername, $username, $password, $database);
if($conn->connect_error)
	die("Nem sikerült csatlakozni az adatbázishoz!" . $conn->connect_error);
?>