<%@ page import="java.util.Objects" %>
<%@ page import="com.mytestar.entity.Category" %>
<%@ page import="com.mytestar.entityrepo.CategoryRepo" %>
<%@ page import="jakarta.persistence.criteria.CriteriaBuilder" %><%--
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
    <title>Create Test Question</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input, select, textarea, button {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        button {
            background-color: #007bff;
            color: white;
            font-weight: bold;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h1>Create Test Question</h1>
<form action="/addQuestion" method="POST" enctype="multipart/form-data">
    <div class="form-group">
        <label for="question-text">Question Text</label>
        <textarea id="question-text" name="questionText" rows="3" required></textarea>
    </div>

    <div class="form-group">
        <label for="audio-file">Optional Audio</label>
        <input type="file" id="audio-file" name="audio" accept="audio/*">
    </div>

    <div class="form-group">
        <label for="difficulty">Difficulty Level</label>
        <select id="difficulty" name="degree" required>
            <option value="EASY">Easy</option>
            <option value="MEDIUM">Medium</option>
            <option value="HARD">Hard</option>
        </select>
    </div>

    <div class="form-group">
        <label>Options</label>
        <input type="text" name="option1" placeholder="Option 1" required>
        <input type="text" name="option2" placeholder="Option 2" required>
        <input type="text" name="option3" placeholder="Option 3" required>
        <input type="text" name="option4" placeholder="Option 4" required>
    </div>

    <div class="form-group">
        <label for="correct-answer">Correct Answer</label>
        <select id="correct-answer" name="correctAnswer" required>
            <option value="1">Option 1</option>
            <option value="2">Option 2</option>
            <option value="3">Option 3</option>
            <option value="4">Option 4</option>
        </select>
    </div>

    <button type="submit">Add Question</button>
</form>
<form action="mainPage.jsp">
    <div class="form-group">
        <button type="submit" class="btn btn-secondary">Finish</button>
    </div>
</form>
</body>
</html>
