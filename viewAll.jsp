<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="user.model.User"%>
<%
    // Retrieve the user object from the session
    User user = (User) session.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <!-- Include Tail wind CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Include Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Include Bootstrap for responsive design -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            background-image: url("${pageContext.request.contextPath}/images/hotel.jpg");
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        }
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            color: white;
        }
        .flex-grow-1 {
            flex-grow: 1;
        }
        .card {
            background-color: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            color: #333;
            padding: 20px;
        }
        .card-header h2 {
            font-size: 24px;
            color: #333;
        }
        .form-label {
            font-size: 16px;
            color: #333;
        }
        .form-control, .form-select {
            font-size: 16px;
            padding: 10px;
        }
        button {
            font-size: 16px;
            padding: 10px 20px;
        }
        a {
            text-decoration: none;
        }
    </style>
</head>
<body class="bg-blue-50 flex flex-col min-h-screen">
    <!-- Navigation Bar -->
    <nav class="bg-blue-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a class="text-white text-lg font-bold" href="#">Admin Dashboard</a>
            <div class="space-x-4">
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="index.jsp">Home</a>
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Content Area -->
    <div class="container mx-auto mt-10 bg-white rounded-lg shadow-lg p-6 flex-1">
        <h1 class="text-3xl font-bold text-center text-blue-600 mb-6">Room Admin Dashboard</h1>

        <h3 class="text-lg text-center mb-4">
            <% if (user != null) { %>
                Welcome, <%= user.getFname() %> <%= user.getLname() %>! <!-- Display user's first and last name -->
            <% } else { %>
                Welcome, Guest! <!-- Fallback if user is null -->
            <% } %>
        </h3>

        <div class="flex flex-col items-center mb-8">
            <!-- Button to navigate to the Add New Room page -->
            <form action="Create.jsp" method="post" class="inline">
                <input type="hidden" name="action" value="list">
                <button type="submit" class="flex items-center bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg mb-3 w-full max-w-xs justify-center">
                    <i class="fas fa-list mr-2"></i> Add New Room
                </button>
            </form>

            <!-- Button to view all rooms -->
            <form action="ReadServlet" method="post" class="inline">
                <input type="hidden" name="action" value="list">
                <button type="submit" class="flex items-center bg-blue-600 hover:bg-blue-700 text-white font-semibold py-2 px-4 rounded-lg mb-3 w-full max-w-xs justify-center">
                    <i class="fas fa-list mr-2"></i> View All Rooms
                </button>
            </form>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-blue-800 text-white text-center py-3">
        <p class="mb-0">© 2024 Admin Dashboard. All rights reserved.</p>
    </footer>

    <!-- Include Bootstrap JS for interactivity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
