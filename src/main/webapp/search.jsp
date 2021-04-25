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
					value="${User.getObj().getUsername()}"></c:out>!
			</span>
			<div style="display: inline-block; margin-right: 2%;"></div>
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link" href="/notebook">NoteBooks</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/notes">Notes</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="/editProfile.jsp">Edit Profile</a></li>
				</ul>
				<form class="d-flex" action="../search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" style="min-width: 120%; position: relative;"
						name="keyword">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div style="padding-left: 40%;"></div>
				<div class="dropstart me-1">
					<a href="#" id="dropdownMenuOffset" data-bs-toggle="dropdown"
						aria-expanded="false" data-bs-offset="10,20" style="color: white;"><i
						class="fa fa-bell-o" aria-hidden="true"></i></a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
						<li><a class="dropdown-item" href="#">No Notifications to
								Show</a></li>
					</ul>
				</div>
				<form action="../logout">
					<button type="submit" class="btn btn-outline-light btn-sm"
						style="margin-right: 1%; margin-left: 2%;">Logout</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="card text-center">
		<div class="card-header">Search Results</div>
	</div>
	<c:forEach items="${searchresults}" var="element">
		<div class="card text-center">
			<div class="card-body">
				<h5 class="card-title">
					<c:out value="${element.getNoteName()}" />
				</h5>
				<p class="card-text">
					Notebook: <c:out value="${element.getNotebookName()}"></c:out>
				</p>
				<p class="card-text">
					<c:out value="${element.getStartDate()}"></c:out>
					 to 
					<c:out value="${element.getEndDate()}"></c:out>
				</p>
				<p class="card-text">
					<c:out value="${element.getDescription()}"></c:out>
				</p>
			</div>
		</div>
	</c:forEach>
</body>
</html>