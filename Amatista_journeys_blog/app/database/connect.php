<?php

$host = 'localhost';
$user = 'root';
$pass = 'anaconda';
$db_name = 'journeys';

$conn = new MySQLi($host, $user, $pass, $db_name);

if ($conn->connect_error) {
    die('Database connection error: ' . $conn->connect_error);
}