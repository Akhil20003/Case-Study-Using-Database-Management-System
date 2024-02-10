<?php
// Establish a connection to the MySQL database
$servername = "your_database_host";
$username = "your_database_username";
$password = "your_database_password";
$dbname = "your_database_name";

$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Handle form submission
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Process the form data or perform any other backend tasks

    // Example: Insert data into a table
    $passengerName = $_POST["passenger_name"];
    $contactNumber = $_POST["contact_number"];
    $address = $_POST["address"];

    $sql = "INSERT INTO Passenger (Name, Contact_Number, Address) VALUES ('$passengerName', '$contactNumber', '$address')";

    if ($conn->query($sql) === TRUE) {
        echo "Record created successfully";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}

// Close the database connection
$conn->close();
?>
