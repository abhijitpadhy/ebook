<%@page import="com.entity.Cart"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
	<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="allComponent/style.css">
<!-- FONTAWASOME CDN -->

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>
<body style="background-color: #f5f0f0;">
	<%@include file="allComponent/Navbar.jsp"%>
	
	<c:if test="${empty userobj}">

<c:redirect url="login.jsp"></c:redirect>

</c:if>
	<c:if test="${not empty succMsg1}">

		<div class="alert alert-success" role="alert">${succMsg1 }</div>
        <c:remove var="succMsg1" scope="session" />
		</c:if>
     <c:if test="${not empty failedMsg1}">
     <div class="alert alert-danger text-center" role="alert">${failedMsg1 }</div>
		<c:remove var="failedMsg1" scope="session" />
     </c:if>

	<div class="container">

		<div class="row p-2">

			<div class="col-md-6">

				

				<div class="card bg-white">
					<div class="card-body">
					<h3 class="text-center text-success">Your Selected Item</h3>
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConnection());

								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice=0.00;

								for (Cart c: cart) {
									totalPrice=c.getTotal_price();
								%>

								<tr>

									<th scope="row"><%=c.getBookname()%></th>

									<td><%=c.getAuthor()%></td>

									<td><%=c.getPrice()%></td>

                                   <td><a 
                                   href="remove_book?bid=<%=c.getBid() %>&&uid=<%=c.getUid() %>&&cid=<%=c.getCid() %>" 
                                   class="btn btn-sm btn-danger">Remove</a></td>

								</tr>

								<%
								}

								%>

								<tr>

									<td>Total Price</td>

									<td></td>

									<td></td>

									<td><%=totalPrice %></td>

								</tr>

							</tbody>
						</table>
					</div>
				</div>

			</div>

			<div class="col-md-6">
				<div class="card">

					<div class="card-body">
					<h3 class="text-center text-success">Your Details for order</h3>
						<form action="order" method="post">
						<input type="hidden" value="${userobj.id}" name="id">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text" name="username"
										class="form-control" id="inputEmail4" value="${userobj.name }">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Email</label> <input
										type="email" name="email" class="form-control" id="inputPassword4" value="${userobj.email }">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Phone Number</label> <input type="number" name="phoneno"
										class="form-control" id="inputEmail4" value="${userobj.phoneno }"> 
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input
										type="text" name="address" class="form-control" id="inputPassword4">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text" name="landmark"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">City</label> <input
										type="text" name="city" class="form-control" id="inputPassword4">
										
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">State</label> <input type="text" name="state"
										class="form-control" id="inputEmail4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">Pin code</label> <input
										type="text" name="pincode" class="form-control" id="inputPassword4">
										
								</div>
							</div>
							<div class="form-group">

								<label>Payment Mode</label> <select class="form-control" name="payment">
									<option value="noselect">--Select--</option>
									<option value="COD">Cash On Delivery</option>

								</select>

							</div>

							<div class="text-center">

								<button class="btn btn-warning">Order Now</button>

								<a href="index.jsp" class="btn btn-success">Continue
									Shopping</a>
							</div>

						</form>



					</div>
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