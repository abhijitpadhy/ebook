<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>	
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login page</title>
  <link type="image/png" sizes="16x16" rel="icon" href="img/icons8-reading-16.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="allComponent/style.css">
<%@include file="allComponent/Navbar.jsp"%>
<!-- FONTAWASOME CDN -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


</head>
<body
	style="background: linear-gradient(0deg, rgba(34,193,195,1) 0%, rgba(253,187,45,1) 100%);">


	<!-- it is used for check the connection is working or not 
if working it return a connection object if not it return null
Connection con =DBConnect.getConnection();
out.println(con);%>-->
	<div class="container p-4">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-header text-center c-head">
						<i class="fas fa-user-circle fa-2x">
							<h5>Login-page</h5>
						</i>
						<%
String succMsg = (String) session.getAttribute("succMsg");
if (succMsg != null && !succMsg.isEmpty()) {
%>
    <h5 class="text-center text-danger"><%= succMsg %></h5>
    <%
    session.removeAttribute("succMsg");
}
%>

<%
String failedMsg = (String) session.getAttribute("failedMsg");
if (failedMsg != null && !failedMsg.isEmpty()) {
%>
    <h5 class="text-center text-danger"><%= failedMsg %></h5>
    <%
    session.removeAttribute("failedMsg");
}
%>

					</div>
					<!-- Your existing JSP code -->

	               				<%-- Success Message --%>
			
					<!-- Rest of your JSP code -->


					<div class="card-body">



						<form action="LoginServlet" method="post">



							<div class="form-group">
								<label for="exampleInputEmail1"> Enter Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="email" required="required">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label> 
								<input type="password" class="form-control" id="exampleInputPassword1" name="pwd" required="required">

							</div>
							<div class="text-center">

								<button type="submit" class="btn btn-primary ">Login</button>
								
								
								
								<br> <a href="register.jsp">Create Account</a>
							</div>
						</form>


					</div>
				</div>
			</div>
		</div>
	</div>
	
</body>
</html>