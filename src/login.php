<?php
session_start();
require 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    if (empty($email) || empty($password)) {
        echo "<script>alert('All fields are required!'); window.location.href='login.html';</script>";
        exit();
    }

    // Fetch user from the database
    $stmt = $conn->prepare("SELECT id, first_name, password FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $first_name, $hashed_password);
        $stmt->fetch();

        // Verify password
        if (password_verify($password, $hashed_password)) {
            $_SESSION['user_id'] = $id;
            $_SESSION['user_name'] = $first_name;
            echo "<script>alert('Logged in successfully! Welcome, $first_name.'); window.location.href='../src/index123.html';</script>";
            exit();
        } else {
            echo "<script>alert('Invalid password!'); window.location.href='../src/login.html';</script>";
            exit();
        }
    } else {
        echo "<script>alert('User does not exist!'); window.location.href='../src/login.html';</script>";
        exit();
    }

    $stmt->close();
    $conn->close();
}
?>
