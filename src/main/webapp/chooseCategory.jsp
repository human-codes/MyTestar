<%@ page import="com.mytestar.entityrepo.CategoryRepo" %>
<%@ page import="com.mytestar.entity.Category" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="uz">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category</title>
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

        select, input, button {
            font-size: 16px;
            border-radius: 5px;
            padding: 10px;
            width: 100%;
        }

        button {
            background-color: #4A90E2;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 12px;
            font-size: 18px;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #357ABD;
        }

        .row {
            margin-top: 20px;
        }

        .col-md-6 {
            margin-bottom: 20px;
        }

        .form-control {
            background-color: #f0f8ff;
            border-color: #4A90E2;
        }

        .btn {
            font-weight: bold;
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
        <!-- Category Selection Section (Left) -->
        <div class="col-md-6 d-flex justify-content-center">
            <div class="section w-100">
                <h1>Choose category</h1>
                <div class="form-group">
                    <%
                        if (categories.isEmpty()) {
                    %>
                    <div class="alert alert-warning" role="alert">Categories are not exist yet</div>
                    <%
                    } else {
                    %>
                    <form action="createTest.jsp">
                        <label for="category">Category:</label>
                        <select id="category" name="categoryId"  class="form-control">
                            <%
                                for (Category category : categories) {
                            %>
                            <option value="<%=category.getId()%>"><%=category.getName()%></option>
                            <%
                                }
                            %>
                        </select>
                        <br>
                        <button class="btn btn-primary">Start</button>
                    </form>
                    <%
                    }
                    %>
                </div>

            </div>
        </div>

        <!-- Category Creation Section (Right) -->
        <div class="col-md-6 d-flex justify-content-center">
            <div class="section w-100">
                <form action="/AddCategoryServlet" method="post">
                    <h2>Create new category</h2>
                    <div class="form-group">
                        <label for="newCategory">Category name:</label>
                        <input name="categoryName" type="text" id="newCategory" class="form-control" placeholder="name of new category">
                        <br>
                        <input name="categoryDesc" type="text"  class="form-control" placeholder="add description of category">
                    </div>
                    <button class="btn btn-success">Create</button>
                </form>
            </div>
        </div>
    </div>
</div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
