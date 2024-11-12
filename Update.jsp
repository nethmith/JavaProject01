<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <!-- Linking Tailwind CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Linking Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Linking Bootstrap CSS for additional styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Styles for the overall layout */
        html, body {
            height: 100%;
            margin: 0;
            background-image: url(https://wallpapers.com/images/hd/hotel-pictures-o9d1lk0gt8hdf0ws.jpg); 
            background-size: cover; /
            background-position: center; 
            background-attachment: fixed; 
            display: flex;
            flex-direction: column; 
        }
        body {
            display: flex;
            flex-direction: column; 
            color: white; 
            min-height: 100vh; 
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
        footer {
            background-color: #1e3a8a; 
            color: white; 
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="bg-blue-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a class="text-white text-lg font-bold" href="#">Admin Dashboard</a>
            <div class="space-x-4">
                <!-- Navigation links -->
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="index.jsp">Home</a>
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container mt-5 flex-grow">
        <h1 class="text-center mb-4">Room Management System</h1>
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">Update Room</h2>
                    </div>
                    <div class="card-body">
                        <!-- Form for updating room details -->
                        <form action="UpdateServlet" method="post">
                            <input type="hidden" name="action" value="update"> <!-- Hidden field to specify action -->

                            <!-- Room ID Field (Read only for updates) -->
                            <div class="mb-3">
                                <label for="updateId" class="form-label">Room ID:</label>
                                <input type="number" class="form-control" id="updateId" name="id" 
                                    value="<%= request.getParameter("id") != null ? request.getParameter("id") : "" %>" 
                                    readonly required> <!-- Room ID input, read-only -->
                            </div>

                            <!-- Room Type Drop down -->
                            <div class="mb-3">
                                <label for="updateRoomType" class="form-label">Room Type:</label>
                                <select class="form-select" id="updateRoomType" name="roomType" required>
                                    <option value="" disabled>Choose a room type</option>
                                    <!-- Options for room types with selected condition -->
                                    <option value="Single" <%= "Single".equals(request.getParameter("roomType")) ? "selected" : "" %>>Single</option>
                                    <option value="Double" <%= "Double".equals(request.getParameter("roomType")) ? "selected" : "" %>>Double</option>
                                    <option value="Family" <%= "Family".equals(request.getParameter("roomType")) ? "selected" : "" %>>Family</option>
                                    <option value="Suite" <%= "Suite".equals(request.getParameter("roomType")) ? "selected" : "" %>>Suite</option>
                                    <option value="Twin" <%= "Twin".equals(request.getParameter("roomType")) ? "selected" : "" %>>Twin</option>
                                    <option value="Penthouse" <%= "Penthouse".equals(request.getParameter("roomType")) ? "selected" : "" %>>Penthouse</option>
                                </select>
                            </div>

                            <!-- Price Field -->
                            <div class="mb-3">
                                <label for="price" class="form-label">Price:</label>
                                <!-- Price input with validation -->
                                <input type="number" class="form-control" id="price" name="price" step="0.01" required
                                       oninput="if(this.value < 0) this.value = 0;"> 
                            </div>

                            <!-- Capacity Field -->
                            <div class="mb-3">
                                <label for="capacity" class="form-label">Capacity (max 10):</label>
                                <!-- Capacity input with validation -->
                                <input type="number" class="form-control" id="capacity" name="capacity" required
                                       max="10" oninput="if(this.value < 0) this.value = 0; if(this.value > 10) this.value = 10;"> 
                            </div>

                            <!-- Submit Button -->
                            <div class="text-center">
                            <!-- Button to submit the form -->
                                <button type="submit" class="btn btn-primary">Update Room</button> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
	
    <!-- Footer -->
    <footer class="bg-blue-800 text-white text-center py-3">
        <p class="mb-0">© 2024 Admin Dashboard. All rights reserved.</p>
    </footer>

    <!-- Linking Bootstrap JS for interactivity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
