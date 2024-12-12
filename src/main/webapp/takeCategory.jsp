<%@ page import="com.mytestar.entityrepo.CategoryRepo" %>
<%@ page import="com.mytestar.entity.Category" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Take Category</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            max-width: 1200px;
        }

        .section {
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        h1, h2 {
            color: #4A90E2;
            margin-bottom: 20px;
        }

        .scrollable {
            max-height: 500px;  /* Adjust this height as needed */
            overflow-y: auto;
        }

        .card {
            margin-bottom: 20px;
        }

        .btn {
            font-weight: bold;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        /* Adjustments for responsiveness */
        @media (max-width: 768px) {
            .container {
                padding: 0 15px;
            }
        }
    </style>
</head>
<body>
<%
    CategoryRepo categoryRepo = new CategoryRepo();
    List<Category> categories = categoryRepo.findAll();
%>
<div class="container">
    <div class="row justify-content-center align-items-center" style="min-height: 100vh;">
        <!-- Category Selection Section -->
        <div class="col-md-12">
            <h1>Choose category</h1>
            <form action="mainPage.jsp">
                <button type="submit" class="btn btn-secondary mb-3">Go back</button>
            </form>
            <div class="scrollable">
                <div class="row">
                    <% if (categories.isEmpty()) { %>
                    <div class="alert alert-warning" role="alert">Categories are not exist yet</div>
                    <% } else { %>
                    <% for (Category category : categories) { %>
                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="card-title"><%=category.getName()%> (All tests:<%=category.getTestCount()%>)</h5>
                                <p class="card-text">Description:<br><%=category.getDescription()%></p>
                                <form action="testDetails.jsp">
                                    <input type="hidden" name="categoryId" value="<%=category.getId()%>">
                                    <button type="submit" class="btn btn-primary">Select</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
