<?php
$servername = "mysql-service";
$username = "dait-atm";
$password = "password";
$dbname = "wordpress";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT ID, user_login, user_pass FROM wp_users";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "id: " . $row["ID"]. " - user: " . $row["user_login"]. " : " . $row["user_pass"]. "<br>";
  }
} else {
  echo "0 results";
}
$conn->close();
?> 