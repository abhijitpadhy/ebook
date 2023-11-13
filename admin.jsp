<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Home</title>
<!-- CSS-CDN  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<!-- FONTAWASOME CDN -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<style type="text/css">
a{
text-decoration:none;
color:black;
}
a:hover{
text-decoration:none;
color:black;
}

</style>
</head>

<body>
	<%@include file="Navbar.jsp"%>
	
	<%
    if (session.getAttribute("userobj") == null) {
        response.sendRedirect("../login.jsp");
    }
%>
	
	
	<!--  <c:if test="${empty userobj}">
    <c:redirect url="../login.jsp" />
</c:if>-->


	<div class="container">
		<div class="row p-4">
			<div class="col-md-3">
			<a href="add_books.jsp">
				<div class="card">
					<div class="card-body  text-center">
						<i class="fa-solid fa-square-plus fa-beat-fade text-primary fa-3x"></i><br>
						<h4>Add Books</h4>
						--------------------
					</div>
				</div>
		        </a>
			</div>

			<div class="col-md-3">
			<a href="all_books.jsp">
				<div class="card">
					<div class="card-body  text-center">
						<i class="fa-solid fa-book fa-beat-fade fa-3x text-success "></i><br>
						<h4>All Books</h4>
						--------------------
					</div>
				</div>
				</a>
			</div>
			<div class="col-md-3">
			<a href="orders.jsp">
				<div class="card">
					<div class="card-body  text-center">

						<i class="fa-solid fa-box-archive fa-beat-fade fa-3x text-warning"></i><br>
						<h4>Orders</h4>
						--------------------
					</div>
				</div>
				</a>
			</div>

			<div class="col-md-3">
			<a data-toggle="modal" data-target="#exampleModalCenter">
				<div class="card">
					<div class="card-body  text-center">
						<i class="fa-solid fa-right-from-bracket fa-beat-fade  fa-3x text-primary"></i><br>
						<h4>logout</h4>
						--------------------
					</div>
				</div>
				</a>
			</div>


		</div>
	</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="text-center">
        <h4>Do You want logout</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a href="../logout" type="button" class="btn btn-primary text-white">Logout</a>
       </div>
       </div>
      <div class="modal-footer">
        
         </div>
    </div>
  </div>
</div>

</body>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>



</html>