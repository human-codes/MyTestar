<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Test Page</title>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f7fa;
    }

    .full-height {
      height: 100vh;
    }

    .half-width {
      width: 50%;
    }

    .center-content {
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100%;
    }

    .navbar {
      background-color: #2c3e50;
    }

    .navbar .navbar-brand, .navbar .nav-link {
      color: white !important;
    }

    .navbar .btn-primary {
      background-color: #e74c3c;
      border-color: #e74c3c;
      border-radius: 30px;
      font-weight: 600;
    }

    .navbar .btn-primary:hover {
      background-color: #c0392b;
      border-color: #c0392b;
    }


    .btn-lg {
      font-size: 1.50rem;
      font-weight: 450;
      padding: 18px 120px !important;
      border-radius: 30px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      transition: all 0.3s ease;
      width: auto !important;
    }



    .btn-lg:hover {
      transform: scale(1.05);
    }

    .bg-light {
      background-color: #ecf0f1 !important;
    }

    .bg-secondary {
      background-color: #95a5a6 !important;
    }

    .container-fluid {
      padding: 0;
    }

    .section {
      background-color: #ecf0f1;
      border-radius: 10px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
      margin: 10px;
    }

    /* Improved login button placement (centered) */
    .navbar .btn-primary {
      margin-left: auto;
      margin-right: 30px;
      padding: 10px 50px;
    }

    /* Additional adjustments for button spacing and alignment */
    .section button {
      width: 100%;
    }

    /* Add padding and margin to sections */
    .container-fluid {
      display: flex;
      justify-content: space-between;
      padding: 20px;
    }
  </style>
</head>

<body>

<!-- Top Navigation Panel -->
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">My Test App</a>
    <div class="collapse navbar-collapse">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="#">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Call Center</a>
        </li>
      </ul>
    </div>
    <!-- Login Button (Right aligned) -->
    <button class="btn btn-primary" type="button">Login</button>
  </div>
</nav>

<!-- Main Content -->
<div class="container-fluid full-height d-flex">
  <!-- Left Section -->
  <div class="half-width center-content section">
    <a href="chooseCategory.jsp" class="btn btn-success btn-lg">Create Test</a>
  </div>
  <!-- Right Section -->
  <div class="half-width center-content section">
    <a href="" class="btn btn-info btn-lg">Take Test</a>
  </div>
</div>

<!-- Bootstrap Script -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-J6qa484v0R8ctjErDoDYoS03AQ6FHjD/4B+4kNy38KsHUs0nxz1gfNE3Ikxp6DyM"
        crossorigin="anonymous"></script>
</body>

</html>

