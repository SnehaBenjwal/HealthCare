<?php
session_start();
require 'db.php';

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $first_name = trim($_POST['first_name']);
    $email = trim($_POST['email']);
    $password = trim($_POST['password']);

    // Check if all fields are filled
    if (empty($first_name) || empty($email) || empty($password)) {
        echo "<script>alert('All fields are required!'); window.location.href='register.html';</script>";
        exit();
    }

    // Check if user already exists
    $stmt = $conn->prepare("SELECT id FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        echo "<script>alert('User already exists! Try logging in.'); window.location.href='register.html';</script>";
        exit();
    }

    // Hash password
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Insert new user
    $stmt = $conn->prepare("INSERT INTO users (first_name, email, password) VALUES (?, ?, ?)");
    $stmt->bind_param("sss", $first_name, $email, $hashed_password);

    if ($stmt->execute()) {
        echo "<script>alert('Account created successfully! Please log in.'); window.location.href='../src/login.html';</script>";
        exit();
    } else {
        echo "<script>alert('Registration failed. Please try again.'); window.location.href='../src/register.html';</script>";
        exit();
    }

    $stmt->close();
    $conn->close();
}
?>
