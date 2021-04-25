<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
	<script type="text/javascript">
        function preventBack() {
            window.history.forward(); 
        }
          
        setTimeout("preventBack()", 0);
          
        window.onunload = function () { null };
    </script>
</head>
<body style="background-color: gray;">
	<h2 style="text-align: center; color: white; padding: 2%;">Notify
		Me</h2>
	<center>
		<div id="newuser" style="color: rgb(65, 186, 129); display: block">${newuser}</div>
	</center>
	<br>
	<div class="card text-center text-white bg-dark mb-3"
		style="max-width: 18rem; position: absolute; left: 41%; right: 21%">
		<form action="login" method="POST">
			<div class="card-body">
				<h4 class="card-title">Login</h4>
				<br>
				<div id="error" style="color: red; display: block">${error}</div>
				<br>
				<div class="input-group flex-nowrap">
					<input type="text" id="email" class="form-control"
						placeholder="Email ID" name="email" aria-label="Username"
						aria-describedby="addon-wrapping">
				</div>
				<br>
				<div class="input-group flex-nowrap">
					<input type="password" id="password" class="form-control"
						placeholder="Password" name="password" aria-label="Password"
						aria-describedby="addon-wrapping">
				</div>
				<br> <input type="submit" class="btn btn-outline-success"
					value="Login"></input>
			</div>
		</form>
		<p class="card-text">
			New User? <a href="/signup.jsp">SignUp</a>
		</p>
		<div class="card-footer text-muted" style="padding-bottom: 5%;">
			Keep a track of your daily tasks</div>
	</div>
</body>
</html>