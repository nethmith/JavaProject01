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
            color: white; 
        }
        .flex-grow {
            flex: 1; 
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

    <div class="container mt-5 flex-grow">
        <h1 class="text-center mb-4">Room Management System</h1>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card mb-4">
                    <div class="card-header">
                        <h2 class="text-center">Add New Room</h2> <!-- Card header title -->
                    </div>
                    <div class="card-body">
                        <!-- Form to add a new room -->
                        <form action="CreateServlet" method="post">
                            <div class="mb-3">
                                <label for="roomType" class="form-label">Room Type:</label>
                                <select class="form-select" id="roomType" name="roomType" required>
                                    <option value="" selected disabled>Choose a room type</option>
                                    <!-- Options for room types -->
                                    <option value="Single">Single</option>
                                    <option value="Double">Double</option>
                                    <option value="Family">Family</option>
                                    <option value="Deluxe">Deluxe</option>
                                    <option value="Economy">Economy</option>
                                    <option value="Penthouse">Penthouse</option>
                                    <option value="Suite">Suite</option>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="price" class="form-label">Price: $</label>
                                <!-- Price input with validation -->
                                <input type="number" class="form-control" id="price" name="price" step="0.01" required
                                       oninput="if(this.value < 0) this.value = 0;"> 
                            </div>
                            <div class="mb-3">
                                <label for="capacity" class="form-label">Capacity (max 10):</label>
                                <!-- Capacity input with validation -->
                                <input type="number" class="form-control" id="capacity" name="capacity" required
                                       max="10" oninput="if(this.value < 0) this.value = 0; if(this.value > 10) this.value = 10;"> 
                            </div>
                            <div class="text-center">
                            <!-- Submit button to add room -->
                                <button type="submit" class="btn btn-primary">Add Room</button> 
                            </div>
                        </form>
                        <div class="card-body">
                            <!-- Form to go back to the view all rooms page -->
                            <form action="viewAll.jsp" method="post">
                                <div class="text-center">
                                <!-- Button to go back -->
                                    <button type="submit" class="btn btn-secondary">Go Back</button> 
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-blue-800 text-white text-center py-3">
        <p class="mb-0">© 2024 Admin Dashboard. All rights reserved.</p> <!-- Footer content -->
    </footer>

    <!-- Including Bootstrap JS for interactivity -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
