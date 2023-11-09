<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address page</title>
<link type="image/png" sizes="16x16" rel="icon"
	href="img/icons8-reading-16.png">

<!-- CSS-CDN -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" href="allComponent/style.css">

<!-- FONT AWESOME CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body style="background-color: #f5f0f0;">
	<%@include file="allComponent/Navbar.jsp"%>
	<div class="container">
		<div class="row p-3">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
					<h3 class="text-center text-success">Add Address</h3>
					<form action="">
						<div class="form-row">
								
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input
										type="text" class="form-control" id="inputPassword4"
										value=""  readonly="readonly">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Landmark</label> <input
										type="text" class="form-control" id="inputPassword4"
										value=""  readonly="readonly">
								</div>
							</div>
							<div class="form-row">
								
								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input
										type="text" class="form-control" id="inputPassword4"
										value=""  readonly="readonly">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">State</label> <input
										type="text" class="form-control" id="inputPassword4"
										value=""  readonly="readonly">
								</div>
								<div class="form-group col-md-4">
									<label for="inputPassword4">Pin</label> <input
										type="text" class="form-control" id="inputPassword4"
										value=""  readonly="readonly">
								</div>
							</div>
					<div class="text-center">
					<button class="btn btn-warning">Add Address</button>
					
					</div>
					
					</form>			
					</div>

				</div>

			</div>

		</div>

	</div>
</body>
</html>