<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <header class="d-flex flex-wrap align-items-center justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
        <div class="col-md-3 mb-2 mb-md-0">
          <a href="/" class="d-inline-flex link-body-emphasis text-decoration-none">
            <img src="asset/anurag-logo-2.png.webp" width="200">
          </a>
        </div>
      </header>
    <center>
      <div class="form-custom-login">
        <form action="login.jsp" method="post">
            <h1 class="h3 mb-3 fw-normal">Please sign in</h1>      
            <div class="form-floating">
              <label for="floatingInput">username</label>
              <input type="username" class="form-control w-25" id="floatingInput" placeholder="username" name="uname" required>
            </div>
            <div class="form-floating">
              <label for="floatingPassword">Password</label>
              <input type="password" class="form-control w-25" id="floatingPassword" placeholder="Password" name="password" required>
            </div>
            <button class="btn btn-primary w-25 py-2 my-3" type="submit">Sign in</button>
          </form>
      </div>
      <a href="forget.html">forgot password?</a><br>
      <a href="register.html">create a new account</a>
    </center>
  </body>
</html>