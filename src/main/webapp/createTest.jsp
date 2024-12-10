<%@ page import="java.util.Objects" %><%--
  Created by IntelliJ IDEA.
  User: SaRDoR
  Date: 12/10/2024
  Time: 2:44 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create a Test</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f8f9fa;
            color: #343a40;
        }

        .container {
            background: white;
            border-radius: 10px;
            padding: 30px;
            margin-top: 50px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .form-label {
            font-weight: 500;
        }

        textarea, select, input[type="text"], input[type="file"] {
            border-radius: 5px;
            border: 1px solid #ced4da;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        textarea:focus, select:focus, input[type="text"]:focus, input[type="file"]:focus {
            border-color: #80bdff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .btn-modern {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 30px;
            transition: all 0.3s ease-in-out;
        }

        .btn-add {
            margin-top: 10px;
            background-color: #28a745;
            color: white;
        }

        .btn-add:hover {

            background-color: #138496;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .btn-finish {
            background-color: red;
            color: white;
        }

        .btn-finish:hover {
            background-color: #5a6268;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        .button-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }

        h1 {
            font-weight: 500;
            color: #495057;
        }

        .mb-3 label {
            color: #495057;
        }

        .d-flex input[type="text"] {
            margin-left: 10px;
        }
        input[type="radio"] {
            transform: scale(1.5); /* Make radio buttons larger */
            margin-right: 10px; /* Add some spacing */
        }
    </style>
</head>
<body>
<div class="container">
    <h1 class="text-center mb-4">Create a Test</h1>
    <form method="post" action="createTest" enctype="multipart/form-data">
        <!-- Test Question -->
        <div class="mb-3">
            <label for="question" class="form-label">Enter the Question:</label>
            <textarea class="form-control" id="question" name="question" rows="2" placeholder="Type your question here..." required></textarea>
        </div>

        <!-- Question Level -->
        <div class="mb-3">
            <label for="difficulty" class="form-label">Select Difficulty:</label>
            <select class="form-select" id="difficulty" name="difficulty" required>
                <option value="easy">Easy</option>
                <option value="medium">Medium</option>
                <option value="hard">Hard</option>
            </select>
        </div>

        <!-- Audio Attachment -->
        <div class="mb-3">
            <label for="audio" class="form-label">Attach Audio (Optional):</label>
            <input type="file" class="form-control" id="audio" name="audio" accept="audio/*">
        </div>

        <!-- Test Options -->
        <div id="options-container" class="mb-3">
            <form action="">
                <label class="form-label">Enter Options:</label>
                <%
                    for (int i = 1; i <= 4; i++) {
                %>
                <div class="d-flex align-items-center mb-2">
                    <label style="font-size: small; width: fit-content" class="form-check-label me-2" for="correctAnswer<%=i%>">Mark as correct answer:</label>
                    <input type="radio" id="correctAnswer<%=i%>" name="correctAnswer" value="<%=i%>" required>
                    <input type="text" class="form-control" name="options<%=i%>" placeholder="Option <%=i%>" required>
                </div>
                <%
                    }
                %>
                <button type="submit" class="btn btn-modern btn-add">Add Question</button>
            </form>
        </div>

        <!-- Submit Button -->
        <div class="button-container">
            <a href="index.jsp" class="btn btn-modern btn-finish">Finish</a>
        </div>

    </form>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
