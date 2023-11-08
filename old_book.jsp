
<%@page import="com.entity.BookDtlss"%>
<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User : old Book</title>
<link type="image/png" sizes="16x16" rel="icon"
	href="img/icons8-reading-16.png">
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

<c:if test="${not empty succMsg}">
<div class="alert alert-danger alert-sm rounded-pill text-center border border-warning">
${succMsg }
</div>
<c:remove var="succMsg" scope="session" />
</c:if>

	<div class="container p-5">
		<table class="table table-striped">
			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>
				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();
				BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
				List<BookDtlss> list = dao.getBookByOld(email, "Old");
				for (BookDtlss b : list)

				{
				%>
				<tr>
					<td><%=b.getBookname()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory()%></td>
					<td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>

				</tr>

				<%
				}
				%>

			</tbody>
		</table>
	</div>

</body>
</html>