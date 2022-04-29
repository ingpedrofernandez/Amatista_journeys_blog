<?php
$servername = "localhost";
$username = "root";
$password = "anaconda";
$dbname = "journeys";

  try {
  $cpdo = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
  // set the PDO error mode to exception
  $cpdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    } catch(PDOException $e) {
    echo "Error: " . $e->getMessage();
    }
?>