<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.notifier.beans.User"%>
<%@page import="com.notifier.Service.NotebookDao"%>
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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
					<li class="nav-item"><a class="nav-link active" href="#">Notes</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="/editProfile.jsp">Edit Profile</a></li>
				</ul>
				<form class="d-flex" action="../search" method="POST">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search" style="min-width: 120%; position: relative;" name="keyword">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<div style="padding-left: 40%;"></div>
				<div class="dropstart me-1">
					<a href="#" id="dropdownMenuOffset" data-bs-toggle="dropdown"
						aria-expanded="false" data-bs-offset="10,20" style="color: white"><i
						class="fa fa-bell-o" aria-hidden="true"></i></a>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuOffset">
					<c:forEach items="${notelist}" var="reminder">
						<li class="dropdown-item"><p style="font-weight:bold; display:inline;"><c:out value="${reminder.getNoteName()}"></c:out></p>: Finish by <c:out value="${reminder.getEndDate()}"></c:out></li>
						<hr>
					</c:forEach>
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
		<div class="card-header">
			Notes <a href="#" data-bs-toggle="modal"
				data-bs-target="#staticBackdropnoten"
				style="position: absolute; right: 2%; text-decoration: none; color: darkcyan;">+Add
				Note</a>
		</div>
	</div>

	<c:forEach items="${notelist}" var="notes">
		<div class="card text-center">
			<div class="card-body">
				<h5 class="card-title">${notes.getNoteName()}</h5>
				<p class="card-text">${notes.getStartDate()}    to    
					${notes.getEndDate()}</p>

				<a href="#" onclick="showDetails(${notes.getNoteId()})"
					id="detailsbutton"
					style="color: rgb(74, 97, 139); text-decoration: none; font-size: 90%;">View
					Details</a>
			</div>
			<div>
				<a href="#" data-bs-toggle="modal"
					data-bs-target="#staticBackdropnote"
					style="text-decoration: none; color: green;"><i
					class="fa fa-pencil" aria-hidden="true"></i>Edit</a>
				<div style="display: inline-block; margin-left: 1%;"></div>
				<a href="/deleteNote/${notes.getNoteId()}"
					style="text-decoration: none; color: darkred;"><i
					class="fa fa-trash-o" aria-hidden="true"></i>Delete</a>
			</div>
			<div class="card"
				style="align-items: center; align-self: center; border-style: none; display: none"
				id="${notes.getNoteId()}">
				<div class="card-body" style="text-align: left">
					<table>
						<tr>
							<td>Note name: <c:out value="${notes.getNoteName()}"></c:out>
							</td>
						</tr>
						<tr>
							<td>Notebook name: <c:out value="${notes.getNotebookName()}"></c:out>
							</td>
						</tr>
						<tr>
							<td>Start Date: <c:out value="${notes.getStartDate()}"></c:out>
							</td>
						</tr>
						<tr>
							<td>End name: <c:out value="${notes.getEndDate()}"></c:out>
							</td>
						</tr>
						<tr>
							<td>Status: <c:out value="${notes.getStatus()}"></c:out>
							</td>
						</tr>
						<tr>
							<td>Tag: <c:out value="${notes.getTag()}"></c:out>
							</td>
						</tr>
						<tr>
							<td>Description: <c:out value="${notes.getDescription()}"></c:out>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

	</c:forEach>

	<div class="modal fade" id="staticBackdropnote"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">Edit Note</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="../editNote" method="post">
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="Enter existing note title" name="prevname">
							<label for="floatingInput">Enter existing note title</label>
						</div>
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="Enter appropriate note title" name="nnotename">
							<label for="floatingInput">Enter appropriate note title</label>
						</div>
						<div class="form-floating mb-3">
							<input type="date" class="form-control" id="floatingInput"
								placeholder="Start Date" name="nstartdate"> <label
								for="floatingInput">Start Date</label>
						</div>
						<div class="form-floating mb-3">
							<input type="date" class="form-control" id="floatingInput"
								placeholder="End Date" name="nenddate"> <label
								for="floatingInput">End Date</label>
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect01">Select Notebook</label>
							<select class="form-select" id="inputGroupSelect01" name="nnotebookname">
								<option selected>--------</option>
								<c:forEach items="${NotebookDao.notebooknames}" var="notebook">
									<option value="${notebook}"><c:out value="${notebook}"></c:out></option>
								</c:forEach>
							</select>
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect01">Options</label>
							<select class="form-select" id="inputGroupSelect01"
								name="nstatus">
								<option selected>Status</option>
								<option value="Started">Started</option>
								<option value="Pending">Pending</option>
								<option value="Paused">Paused</option>
								<option value="Finished">Finished</option>
							</select>
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect01">Options</label>
							<select class="form-select" id="inputGroupSelect01" name="ntag">
								<option selected>Tag</option>
								<option value="Public">Public</option>
								<option value="Private">Private</option>
							</select>
						</div>
						<div class="input-group">
							<textarea class="form-control" aria-label="With textarea"
								placeholder="Description" name="ndescription"></textarea>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Save</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>


	<div class="modal fade" id="staticBackdropnoten"
		data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
		aria-labelledby="staticBackdropLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="staticBackdropLabel">New Note</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form action="../addNote" method="post">
					<div class="modal-body">
						<div class="form-floating mb-3">
							<input type="text" class="form-control" id="floatingInput"
								placeholder="Enter appropriate note title" name="notename">
							<label for="floatingInput">Note Name</label>
						</div>
						<div class="form-floating mb-3">
							<input type="date" class="form-control" id="floatingInput"
								placeholder="Start Date" name="startdate"> <label
								for="floatingInput">Start Date</label>
						</div>
						<div class="form-floating mb-3">
							<input type="date" class="form-control" id="floatingInput"
								placeholder="End Date" name="enddate"> <label
								for="floatingInput">End Date</label>
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect01">Select Notebook</label>
							<select class="form-select" id="inputGroupSelect01" name="notebookname">
								<option selected>--------</option>
								<c:forEach items="${NotebookDao.notebooknames}" var="notebook">
									<option value="${notebook}"><c:out value="${notebook}"></c:out></option>
								</c:forEach>
							</select>
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect01">Status</label>
							<select class="form-select" id="inputGroupSelect01" name="status">
								<option selected>Undecided</option>
								<option value="Started">Started</option>
								<option value="Pending">Pending</option>
								<option value="Paused">Paused</option>
								<option value="Finished">Finished</option>
							</select>
						</div>
						<div class="input-group mb-3">
							<label class="input-group-text" for="inputGroupSelect01">Tag</label>
							<select class="form-select" id="inputGroupSelect01" name="tag">
								<option selected>Default</option>
								<option value="Public">Public</option>
								<option value="Private">Private</option>
							</select>
						</div>
						<div class="input-group">
							<textarea class="form-control" aria-label="With textarea"
								placeholder="Description" name="description"></textarea>
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-success">Save</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function showDetails(variable){
			var element = document.getElementById(variable);
			if(element.style.display === "none"){
				element.style.display = "block";
			}
			else{
				element.style.display = "none";
			}
		}
	</script>
</body>
</html>