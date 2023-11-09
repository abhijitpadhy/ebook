<%@page import="com.entity.BookDtlss"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="javax.servlet.http.HttpServletRequest"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Details</title>
<link type="image/png" sizes="16x16" rel="icon"
	href="img/icons8-reading-16.png">


<!-- CSS-CDN  -->
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
	<%
	int bid = Integer.parseInt(request.getParameter("bid"));

	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
	BookDtlss b = dao.getBookById(bid);
	%>
	<div class="container p-3">
		<div class="row">

			<div class="col-md-6 text-center p-5 border bg-white">
				<img src="book/<%=b.getPhotoName() %>" style="height: 180px; width: 150px"><br>
				<h4 class="mt-3">
					Book Name:<span class="text-success"><%=b.getBookname() %></span>
				</h4>
				<h4>
					Author Name: <span class="text-success"><%=b.getAuthor() %></span>
				</h4>
				<h4>
					Category: <span class="text-success"><%=b.getBookCategory() %></span>
				</h4>
			</div>
			<div class="col-md-6 text-center p-5 border bg-white">
				<h2><%=b.getBookname() %></h2>
				
				<%
				if("Old".equals(b.getBookCategory()))
				{%>
				<h5 class="text-primary">Contact To Seller</h5>
				<h5 class="text-primary"><i class="far fa-envelope"></i>Email:<%=b.getEmail()%></h5>
				<%
				}
				%>
				<div class="row">
					<div class="col-md-4 text-success text-center p-2">
						<i class="fa fa-money-bill-wave fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-2">
						<i class="fas fa-undo-alt fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-warning text-center p-2">
						<i class="fas fa-truck-moving fa-2x"></i>
						<p>Free Shipping</p>
					</div>
					
					<%
					 if("Old".equals(b.getBookCategory())){	 
					%>
					<div class="text-center p-3">
					<a href="index.jsp" class="btn btn-success"><i class="fas fa-cart-plus"></i>Continue Shopping</a> <a href="" class="btn btn-success"><i
						class="fas fa-rupee-sign"></i>200</a>
							</div>
							
							<%
					 }else{
					%>
					<div class="text-center p-3">
					<a href="" class="btn btn-primary"><i class="fas fa-cart-plus"></i>Add
						Cart</a> <a href="" class="btn btn-success"><i
						class="fas fa-rupee-sign"></i>200</a>

				</div>
				<%
				}%>
							

				
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