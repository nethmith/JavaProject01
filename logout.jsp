<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Logout</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        /* Ensure the entire HTML and body elements take full height */
        html, body {
            height: 100%;
            margin: 0;
            background-image: url(https://wallpapers.com/images/hd/hotel-pictures-o9d1lk0gt8hdf0ws.jpg); 
            background-size: cover; /* Cover the entire background */
            background-position: center; /* Center the background image */
            background-attachment: fixed; /* Fixed background attachment */
            display: flex;
            flex-direction: column; /* Arrange in column: header, content, footer */
        }

        /* Keep the header fixed to the top */
        nav {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
        }

        /* Flex-grow ensures the content fills the space between header and footer */
        .content {
            flex-grow: 1;
            display: flex;
            align-items: center; /* Vertically center the content */
            justify-content: center; /* Horizontally center the content */
            padding-top: 80px; /* Give space for the fixed header */
            padding-bottom: 60px; /* Give space for the fixed footer */
        }

        /* Keep the footer fixed to the bottom */
        footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            z-index: 1000;
        }

        a {
            text-decoration: none; /* Remove underline from links */
        }
    </style>
</head>
<body>

    <!-- Navigation Bar (fixed at the top) -->
    <nav class="bg-blue-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a class="text-white text-lg font-bold" href="#">LECKIE LUXURY STAYS</a>
            <div class="space-x-4">
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="index.jsp">Home</a>
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="signup.jsp">Signup</a>
            </div>
        </div>
    </nav>

    <!-- Main Content Section (centered between header and footer) -->
    <div class="content">
        <div class="w-full max-w-md bg-white shadow-lg rounded-lg p-8">
            <h2 class="text-3xl font-bold text-center text-blue-600 mb-6">You have logged out successfully!</h2>
            <div class="text-center">
                <a href="login.jsp" class="text-blue-500 hover:underline">Go to Login Page</a>
            </div>
        </div>
    </div>

    <!-- Footer (fixed at the bottom) -->
    <footer class="bg-blue-800 text-white text-center py-3">
        <p class="mb-0">© 2024 LECKIE LUXURY STAYS. All rights reserved.</p>
    </footer>

</body>
</html>
