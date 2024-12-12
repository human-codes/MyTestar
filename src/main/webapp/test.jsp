<%--
  Created by IntelliJ IDEA.
  User: SaRDoR
  Date: 12/12/2024
  Time: 8:35 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mytestar.entity.Question" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="com.mytestar.entity.Answer" %>
<%@ page import="com.mytestar.entityrepo.AnswerRepo" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 600px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
        }
        .btn-next {
            margin-top: 20px;
            width: 100%;
        }
    </style>
</head>
<body>
<%
    AnswerRepo answerRepo=new AnswerRepo();
    List<Answer> answers = answerRepo.findAll();
    List<Question> TEST = (List<Question>) request.getSession().getAttribute("TEST");
    Integer currentQuestionIndex = (Integer) session.getAttribute("currentQuestionIndex");
    if (currentQuestionIndex == null) {
        currentQuestionIndex = 0;
        session.setAttribute("currentQuestionIndex", currentQuestionIndex);
    }
    if (currentQuestionIndex < TEST.size()) {
        Question question = TEST.get(currentQuestionIndex);
%>
<div class="container">
    <h2>Question <%= currentQuestionIndex + 1 %> of <%= TEST.size() %></h2>
    <p><%= question.getText() %></p>
    <% if (question.getAudio() != null) { %>
    <audio controls>
        <source src="/file/get?id=<%=question.getAudio().getId()%>" type="audio/mpeg">
        Your browser does not support the audio element.
    </audio>
    <% } %>
    <form action="nextQuestionPage.jsp" method="POST">
        <%
            List<Answer> questionAnswers= new ArrayList<>();
            for (Answer answer : answers) {
                if (answer.getQuestion().equals(question)){
                    questionAnswers.add(answer);
                }
            }
            for (int i = 0; i < questionAnswers.size(); i++) { %>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="answer" value="<%=questionAnswers.get(i).isCorrect()%>" id="option<%= i + 1 %>">
            <label class="form-check-label" for="option<%= i + 1 %>">
                <%=questionAnswers.get(i).getText()%>
            </label>
        </div>
        <% } %>
        <button type="submit" class="btn btn-primary btn-next">Next</button>
    </form>
</div>
<% } else { %>
<div class="container">

    <%
        int time=
        TEST.get(1).getDifficulty()
    %>

    <h2>Test Completed</h2>
    <p>You have answered all the questions.</p>
    <form action="resultPage.jsp" method="POST">
        <button type="submit" class="btn btn-primary btn-next">See Results</button>
    </form>
</div>
<% } %>
</body>
</html>
