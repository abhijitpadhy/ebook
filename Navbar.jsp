<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>



<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/fontawesome.min.css"
	integrity="sha512-siarrzI1u3pCqFG2LEzi87McrBmq6Tp7juVsdmGY1Dr8Saw+ZBAzDzrGwX3vgxX1NkioYNCFOVC0GpDPss10zQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>







	<div class="container-fluid"
		style="height: 10px; background-color: #3949ab;"></div>



	<div class="container-fluid p-3 bg-light">
		<div class="row">
			<div class="col-md-3 text-success">
				<h3>
					<i class="fa fa-book"></i>BookCart
				</h3>
			</div>
			<div class="col-md-6">
				<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
					<input class="form-control mr-sm-2" type="search" name="ch"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
				</form>

			</div>

			<c:if test="${not empty userobj }">
			
			<a href="checkout.jsp"class="btn btn-success rounded-circle text-white">
				<i class="fa-solid fa-cart-shopping fa-beat-fade "></i>Cart</a>
				<a href="login.jsp"
					class="btn btn-warning rounded-circle text-white ml-1"><i
					class="fa fa-user"></i>${userobj.name}</a>
				<a data-toggle="modal" data-target="#exampleModalCenter"
					class="btn btn-primary rounded-circle text-white ml-1"><i
					class="fa fa-sign-out"></i>LogOut</a>
			</c:if>
			<c:if test="${empty userobj }">
				<div class="col-md-3">
					<a href="login.jsp" class="btn btn-success rounded-circle"><i
						class="fa fa-sign-in"></i>Login</a> <a href="register.jsp"
						class="btn btn-primary text-white rounded-circle"><i
						class="fa fa-user-plus"></i>Register</a>
				</div>


			</c:if>
			<!-- Modal start -->

			<!-- Modal -->
			<div class="modal fade" id="exampleModalCenter" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalCenterTitle"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLongTitle"></h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="text-center">
								<h4>Do You want logout</h4>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<a href="logout" type="button"
									class="btn btn-primary text-white">Logout</a>
							</div>
						</div>
						<div class="modal-footer"></div>
					</div>
				</div>
			</div>

			<!-- Modal End -->



		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<a class="navbar-brand" href="index.jsp"><i class="fa fa-home"></i>
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_recent_book.jsp">Recent Book</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="all_new_book.jsp">New Book</a></li>

				<li class="nav-item active"><a class="nav-link disabled"
					href="all_old_book.jsp">Old Book</a></li>
			</ul>
			<form class="form-inline my-2 my-lg-0">
				<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"
					style="border-radius: 15px;">
					<i class="fa fa-gear fa-spin" style="font-size: 24px"></i> Setting
				</a>
				<a class="btn btn-light my-2 my-sm-0 ml-1" type="submit" href="helpline.jsp"
					style="border-radius: 15px;">
					<i class="fa-solid fa-phone fa-shake" style="color: #30e723;"></i>Contact
					Us
				</a>
			</form>
		</div>
	</nav>







</body>



</html>