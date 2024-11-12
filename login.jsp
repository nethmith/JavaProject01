<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Include Tail wind CSS for styling -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        /* Styles for HTML and body */
        html, body {
            height: 100%;
            margin: 0;
            background-image: url(https://wallpapers.com/images/hd/hotel-pictures-o9d1lk0gt8hdf0ws.jpg); 
            background-size: cover; /* Cover the entire background */
            background-position: center; /* Center the background image */
            background-attachment: fixed; /* Fixed background attachment */
        }
        a {
            text-decoration: none; /* Remove underline from links */
        }
    </style>
</head>
<body class="bg-blue-50">
    <!-- Navigation Bar -->
    <nav class="bg-blue-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a class="text-white text-lg font-bold" href="#">LECKIE LUXURY STAYS</a>
            <div class="space-x-4">
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="index.jsp">Home</a>
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="signup.jsp">Signup</a>
            </div>
        </div>
    </nav>

    <!-- Main Login Form Section -->
    <div class="flex items-center justify-center min-h-screen">
        <div class="w-full max-w-md bg-white shadow-lg rounded-lg p-8">
            <h2 class="text-3xl font-bold text-center text-blue-600 mb-6">Login</h2>

            <form action="login" method="post" class="space-y-6">
                <div>
                    <label for="username" class="block text-sm font-medium text-gray-700 mb-2">Username</label>
                    <input type="text" id="username" name="username" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm">
                </div>

                <div>
                    <label for="password" class="block text-sm font-medium text-gray-700 mb-2">Password</label>
                    <input type="password" id="password" name="password" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-2 focus:ring-blue-500 focus:outline-none text-sm">
                </div>

                <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 transition duration-150 ease-in-out">
                    Login
                </button>
            </form>

            <!-- Display error message if present -->
            <c:if test="${not empty message}">
                <p class="text-red-600 text-center mt-4 text-sm font-medium">${message}</p>
            </c:if>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-blue-800 text-white text-center py-3 mt-10">
        <p class="mb-0">© 2024 LECKIE LUXURY STAYS. All rights reserved.</p>
    </footer>
</body>
</html>
