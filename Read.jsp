<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
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
<body>
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

    <!-- Main Content Wrapper -->
    <div class="container flex-grow-1">
        <h1 class="text-center mt-4">Room Management System</h1>
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2 class="text-center">Room List</h2>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Room Type</th>
                                    <th>Price</th>
                                    <th>Capacity</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="room" items="${rooms}">
                                    <tr>
                                        <td>${room.id}</td>
                                        <td>${room.roomType}</td>
                                        <td>${room.price}</td>
                                        <td>${room.capacity}</td>
                                        <td>
                                            <!-- Edit Button -->
                                            <a href="Update.jsp?id=${room.id}&roomType=${room.roomType}&price=${room.price}&capacity=${room.capacity}" class="btn btn-primary">Edit</a>

                                            <!-- Delete Form -->
                                            <form action="DeleteServlet" method="post" style="display:inline;">
                                                <input type="hidden" name="id" value="${room.id}" />
                                                <button type="submit" class="btn btn-danger">Delete</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="card-body">
                        <form action="viewAll.jsp" method="post">
                            <div class="text-center">
                                <button type="submit" class="btn btn-secondary">Go Back</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-blue-800 text-white text-center py-3 mt-auto">
        <p class="mb-0">© 2024 Admin Dashboard. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
