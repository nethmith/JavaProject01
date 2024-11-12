<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Signup</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css">
    <style>
        /* Ensure the entire HTML and body elements take full height */
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
           	background-image: url("${pageContext.request.contextPath}/images/hotel.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }

        /* Make sure that content takes up the remaining space */
        .content {
            flex-grow: 1; /* This allows the content to grow and push the footer down */
        }

        a {
            text-decoration: none; /* Remove underline from links */
        }
    </style>
    
    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const confirmPassword = document.getElementById("confirm-password").value;

            if (password !== confirmPassword) {
                alert("Passwords do not match!");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="bg-blue-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a class="text-white text-lg font-bold" href="#">LECKIE LUXURY STAYS</a>
            <div class="space-x-4">
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="index.jsp">Home</a>
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="login.jsp">Login</a>
            </div>
        </div>
    </nav>

    <!-- Main Content Section (pushes footer down if needed) -->
    <div class="content">
        <div class="container mx-auto mt-10">
            <h1 class="text-3xl font-semibold text-center mb-6 text-blue-600">Signup</h1>
            <div class="bg-white shadow-lg rounded-lg p-6 max-w-sm mx-auto">
                <form action="SignupServlet" method="post" onsubmit="return validateForm()">
                    <div class="mb-4">
                        <label for="username" class="block text-gray-700 font-medium mb-2">Username</label>
                        <input type="text" id="username" name="username" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="fname" class="block text-gray-700 font-medium mb-2">First Name</label>
                        <input type="text" id="fname" name="fname" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="lname" class="block text-gray-700 font-medium mb-2">Last Name</label>
                        <input type="text" id="lname" name="lname" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="password" class="block text-gray-700 font-medium mb-2">Password</label>
                        <input type="password" id="password" name="password" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    <div class="mb-4">
                        <label for="confirm-password" class="block text-gray-700 font-medium mb-2">Confirm Password</label>
                        <input type="password" id="confirm-password" name="confirm-password" required class="w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500">
                    </div>
                    
                    <button type="submit" class="w-full bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 rounded-md transition duration-200">Signup</button>
                </form>
                <c:if test="${not empty message}">
                    <p class="text-red-600 text-center mt-4 text-sm font-medium">${message}</p>
                </c:if>
            </div>
        </div>
    </div>

    <!-- Footer (fixed at the bottom of the page) -->
    <footer class="bg-blue-800 text-white text-center py-3">
        <p class="mb-0">© 2024 Admin Dashboard. All rights reserved.</p> 
    </footer>
</body>
</html>
