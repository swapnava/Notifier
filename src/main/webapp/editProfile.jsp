<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.notifier.beans.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Notify Me</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script type="text/javascript">
        function preventBack() {
            window.history.forward(); 
        }
          
        setTimeout("preventBack()", 0);
          
        window.onunload = function () { null };
    </script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<span class="navbar-brand">Hi <c:out
					value="${User.getObj().getUsername()}"></c:out> !
			</span>
			<div style="display: inline-block; margin-right: 2%;"></div>
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="/notebook">NoteBooks</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/notes">Notes</a>
					</li>
					<li class="nav-item"><a class="nav-link active" href="#">Edit
							Profile</a></li>
				</ul>
				<form action="../logout">
					<button type="submit" class="btn btn-outline-light btn-sm"
						style="margin-right: 1%; margin-left: 2%;">Logout</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="card text-center">
		<div class="card-header">Edit Profile</div>
		<center>
			<div id="updated" style="color: rgb(65, 186, 129); display: block">${updated}</div>
		</center>
		<center>
			<div id="invalidpass" style="color: red; display: block">${invalidpassword}</div>
		</center>
		<center>
			<div id="invalidpass" style="color: red; display: block">${nullpassword}</div>
		</center>
		<div class="card-body">
			<form action="../updateUser" method="post">
				<div style="width: 35%; margin-left: 33%;">

					<div class="form-floating mb-3">
						<c:out value="${User.getObj().getEmail()}"></c:out>
					</div>

					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="UserName" name="username"> <label
							for="floatingInput">Username</label>
					</div>
					<div class="form-floating mb-3">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="MobileNo" name="mobile"> <label
							for="floatingInput">Mobile Number</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="floatingInput"
							placeholder="password" name="oldpassword"> <label
							for="floatingInput">Existing Password</label>
					</div>
					<div class="form-floating mb-3">
						<input type="password" class="form-control" id="floatingInput"
							placeholder="password" name="newpassword"> <label
							for="floatingInput">New Password</label>
					</div>
				</div>
				<button type="submit" class="btn btn-success">Save</button>
			</form>
		</div>
</body>
</html>