<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.entity.BookDtlss"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@page isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="style.css">
<!-- FONTAWASOME CDN -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">



</head>
<body style="background-color: #f0f1f2">
	<%@include file="Navbar.jsp"%>
	<%
    if (session.getAttribute("userobj") == null) {
        response.sendRedirect("../login.jsp");
    }
%>
	
	<h3 class="text-center"><i class="far fa-smile"></i> Hello Admin</h3>
	   <c:if test="${not empty succMsg}">
                            <p class="text-center text-success">${succMsg}</p>
                            <c:remove var="succMsg" scope="session" />
                        </c:if>

                        <c:if test="${not empty failedMsg}">
                            <p class="text-center text-danger">${failedMsg}</p>
                            <c:remove var="failedMsg" scope="session" />
                        </c:if>

	<table class="table table-striped">
		<thead class="bg-primary text-white">
			<tr>
			     <th scope="col">Id</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		<%
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
		List<BookDtlss> list=dao.getAllBooks();
		for(BookDtlss b:list){
		%>
		<tr>
				<td ><%=b.getBookId() %></td>
				<td><img  src="../book/<%=b.getPhotoName()%>" style="width:50px; height:50px;"></td>
				<td><%=b.getBookname() %></td>
				<td><%=b.getAuthor() %></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>

				<td><a href="edit_books.jsp?id=<%=b.getBookId() %>" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i>Edit</a>
				 <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm btn-danger"><i class="fa fa-trash-o"></i>Delete</a></td>

			</tr>
		
		<%
		}
		
		%>
			
			
		</tbody>
	</table>

</body>
</html>