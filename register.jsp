<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
  <link type="image/png" sizes="16x16" rel="icon" href="img/icons8-reading-16.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="allComponent/style.css">
<!-- FONTAWASOME CDN -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>
<body 	style="background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(253,187,45,1) 100%);">
	<%@include file="allComponent/Navbar.jsp"%>

	<div class="container p-2">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center c-head">
						<i class="fas fa-user-circle fa-2x">
							<h5>Registration-page</h5>
						</i>
					</div>
					<!-- for Alert -->
					<%
					String regMsg = (String) session.getAttribute("reg-msg");

					if (regMsg != null) {
					%>
					<div class="alert alert-success" role="alert">
						<%=regMsg%>Login..<a href="login.jsp">Click here</a>
					</div>

					<%
					}
					%>
					<%-- Error Message --%>
					<%
					String regErrorMsg = (String) session.getAttribute("reg-error-msg");

					if (regErrorMsg != null) {
					%>
					<div class="alert alert-danger" role="alert">
						<%=regErrorMsg%>
					</div>
					<%
					session.removeAttribute("reg-error-msg"); // Remove the message from session after displaying
					}
					%>
					<div class="card-body">
						<form action="register" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Name*</label> <input type="text"
									class="form-control" id="exampleInputName"
									aria-describedby="emailHelp" name="uname" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address*</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">phone*</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="phone" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password*</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									name="pwd" required="required">
							</div>
							<div class="form-group ml-3">
								<input type="checkbox" class="form-check-input"
									id="exampleCheck1" name="checkbox"><label
									class="form-check-label" for="exampleCheck1">Check me
									out</label>
							</div>
							<button type="submit"
								class="btn btn-primary btn-block batch-pill">Register</button>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>