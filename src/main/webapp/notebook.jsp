<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.notifier.beans.User" %>
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
			<span class="navbar-brand">Hi  <c:out value="${User.getObj().getUsername()}"></c:out> !</span>
			<div style="display: inline-block; margin-right: 2%;"></div>
			<div class="collapse navbar-collapse" id="navbarText">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active" href="#">NoteBooks</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/notes">Notes</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="/editProfile.jsp">Edit Profile</a></li>
				</ul>
				<form class="d-flex" action="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" style="min-width: 120%; position: relative;" name="keyword">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div style="padding-left: 40%;"></div>
				<form action="../logout">
					<button type="submit" class="btn btn-outline-light btn-sm"
						style="margin-right: 1%; margin-left: 2%;">Logout</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="card text-center">
		<div class="card-header">
			NoteBooks <a href="#" data-bs-toggle="modal"
				data-bs-target="#staticBackdrop"
				style="position: absolute; right: 2%; text-decoration: none; color: darkcyan;">+Add
				NoteBook</a>
		</div>
	</div>
	<c:forEach items="${notebookresult}" var="element">
		<div class="card text-center">
			<div class="card-body">
				<h5 class="card-title">
					<c:out value="${element.getNotebookName()}" />
				</h5>
				<p class="card-text">Number of Notes: <c:out value="${element.getNoteCount()}"></c:out></p>
			</div>
			<div>
				<a href="#" data-bs-toggle="modal"
					data-bs-target="#staticBackdropedit"
					style="text-decoration: none; color: green;"><i
					class="fa fa-pencil" aria-hidden="true"></i>Edit</a>
				<div style="display: inline-block; margin-left: 1%;"></div>
				<a href="/deleteNotebook/${element.getNotebookId()}"
					style="text-decoration: none; color: darkred;"><i
					class="fa fa-trash-o" aria-hidden="true"></i>Delete</a>
			</div>
		</div>
	</c:forEach>

	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static"
		data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">New Notebook</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="../addNotebook" method="POST">
					<div class="modal-body">
						<input class="form-control me-2" type="text"
							placeholder="Enter Notebook name" aria-label="NotebookName"
							name="notebookname" style="min-width: 90%; position: relative;">
					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Submit</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div class="modal fade" id="staticBackdropedit"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Edit Notebook</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="../updateNotebook" method="POST">
					<div class="modal-body">

						<input class="form-control me-2" type="text"
							placeholder="Enter Existing Name" name="notebookoldname"
							style="min-width: 90%; position: relative;"> <br> <input
							class="form-control me-2" type="text"
							placeholder="Enter New Name" name="notebooknewname"
							style="min-width: 90%; position: relative;">
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-success">Save</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>