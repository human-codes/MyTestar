<%@ page import="com.mytestar.entityrepo.CategoryRepo" %>
<%@ page import="com.mytestar.entity.Category" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
            max-width: 400px;
            margin-top: 50px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            background-color: #fff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-check-label {
            margin-left: 5px;
        }

        .btn-start, .btn-back {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <form action="/getDetails" method="POST">
        <div class="form-group">
            <label>Type</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="type" id="random" value="random" required>
                <label class="form-check-label" for="random">Random</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="type" id="sequential" value="sequential" required>
                <label class="form-check-label" for="sequential">Sequential</label>
            </div>
        </div>
        <div class="form-group">
            <label>Difficulty</label>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="difficulty" id="any" value="ANY" required>
                <label class="form-check-label" for="any">Any</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="difficulty" id="easy" value="EASY" required>
                <label class="form-check-label" for="easy">EASY</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="difficulty" id="normal" value="MEDIUM" required>
                <label class="form-check-label" for="normal">MEDIUM</label>
            </div>
            <div class="form-check">
                <input class="form-check-input" type="radio" name="difficulty" id="difficult" value="HARD" required>
                <label class="form-check-label" for="difficult">HARD</label>
            </div>
        </div>
        <div class="form-group">
            <label for="how-many">How many?</label>
            <select class="form-control" id="how-many" name="howMany" required>
                <option value="0">all</option>
                <option value="5">5</option>
                <%
                    int categoryId = Integer.parseInt(request.getParameter("categoryId"));
                    request.getSession().setAttribute("categoryId",categoryId);
                    CategoryRepo categoryRepo = new CategoryRepo();
                    Category categoryByID = categoryRepo.getCategoryByID(categoryId);
                    if (categoryByID.getTestCount() > 9) {
                %>
                <option value="10">10</option>
                <%
                    if (categoryByID.getTestCount() > 14) {
                %>
                <option value="15">15</option>
                <%
                    }
                    if (categoryByID.getTestCount() > 19) {
                %>
                <option value="20">20</option>
                <%
                        }
                    }
                %>

            </select>
        </div>
        <button type="submit" class="btn btn-primary btn-start">Start</button>
    </form>
    <form action="takeCategory.jsp" method="GET">
        <button type="submit" class="btn btn-secondary btn-back">Go back</button>
    </form>
</div>
</body>
</html>
