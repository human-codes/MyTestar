<%--
  Created by IntelliJ IDEA.
  User: SaRDoR
  Date: 12/12/2024
  Time: 9:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String answer = request.getParameter("answer");
    System.out.println(answer);
    Integer currentQuestionIndex = (Integer) request.getSession().getAttribute("currentQuestionIndex");
    if (currentQuestionIndex != null) {
        session.setAttribute("currentQuestionIndex", currentQuestionIndex + 1);
    }
    response.sendRedirect("test.jsp");

%>

