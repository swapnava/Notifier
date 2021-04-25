<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
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
	<br>
	<center>
		<div id="error" style="color: red; display: block;">${error}</div>
	</center>
	<br>
	<div class="card text-center text-white bg-dark mb-3"
		style="max-width: 18rem; position: absolute; left: 41%; right: 21%">
		<div class="card-body">
			<h4 class="card-title">Sign Up</h4>
			<br> <br>
			<form action="signup" method="POST">
				<div class="input-group flex-nowrap">
					<input type="text" class="form-control" placeholder="Username"
						name="username" aria-label="Username"
						aria-describedby="addon-wrapping">
				</div>
				<br>
				<div class="input-group flex-nowrap">
					<input type="text" class="form-control" placeholder="Mobile Number"
						name="mobile" aria-label="Mobile"
						aria-describedby="addon-wrapping">
				</div>
				<br>
				<div class="input-group flex-nowrap">
					<input type="text" class="form-control" placeholder="Email ID"
						name="email" aria-label="Mail" aria-describedby="addon-wrapping">
				</div>
				<br>
				<div class="input-group flex-nowrap">
					<input type="password" class="form-control" placeholder="Password"
						name="password" aria-label="Password"
						aria-describedby="addon-wrapping">
				</div>
				<br>
				<div class="input-group flex-nowrap">
					<input type="password" class="form-control"
						placeholder="Confirm Password" aria-label="ConfirmPassword"
						aria-describedby="addon-wrapping">
				</div>
				<br> <input type="submit" value="Signup"
					class="btn btn-outline-success"></input>
			</form>
		</div>

		<p class="card-text" style="padding-bottom: 10%;">
			Already a User? <a href="/login.jsp">Login</a>
		</p>
	</div>

</body>
</html>