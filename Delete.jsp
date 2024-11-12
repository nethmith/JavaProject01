<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <!-- Including Tail wind CSS for utility-first styling -->
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <!-- Including Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <!-- Including Bootstrap for responsive layout and components -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Style for the entire HTML and body elements */
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
            font-size: 16px; /* Button text size */
            padding: 10px 20px; /* Padding inside buttons */
        }
        a {
            text-decoration: none; /* Remove underline from links */
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="bg-blue-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a class="text-white text-lg font-bold" href="#">Admin Dashboard</a>
            <div class="space-x-4">
                <!-- Home link -->
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="index.jsp">Home</a>
                <!-- Logout link -->
                <a class="text-white bg-blue-900 hover:bg-blue-700 rounded px-3 py-2" href="logout.jsp">Logout</a>
            </div>
        </div>
    </nav>

    <!-- Main Content Wrapper -->
    <div class="flex-grow-1">
        <div class="container mt-5">
            <h1 class="text-center mb-4">Room Management System</h1>
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h2 class="text-center">Delete Room</h2> <!-- Card header title -->
                        </div>
                        <div class="card-body">
                            <!-- Form to delete a room -->
                            <form action="DeleteServlet" method="post">
                                <input type="hidden" name="action" value="delete"> <!-- Hidden input to specify the action -->
                                <div class="mb-3">
                                    <label for="deleteId" class="form-label">Room ID:</label>
                                    <!-- Capacity input with validation -->
                                <input type="number" class="form-control" id="deleteId" name="id" required
                                       oninput="if(this.value < 0) this.value = 0;"> 
                            </div>
                                <div class="text-center">
                                    <button type="submit" class="btn btn-danger">Delete Room</button> <!-- Submit button to delete the room -->
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-blue-800 text-white text-center py-3">
        <p class="mb-0">© 2024 Admin Dashboard. All rights reserved.</p> 
    </footer>

    <!-- Including Bootstrap JS for interactivity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
