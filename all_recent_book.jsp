<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.BookDtlss"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>All Recent Book</title>
  <link type="image/png" sizes="16x16" rel="icon" href="img/icons8-reading-16.png">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="allComponent/style.css">
</head>


<body style="background-color: #f5f0f0;">
<%
User u=(User)session.getAttribute("userobj"); 
%>
	<%@include file="allComponent/Navbar.jsp"%>
	<div class="container-fluid">
		<div class="row">
			
			
			  <%
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
        List<BookDtlss> list2 = dao.getNewBook();
        for (BookDtlss b : list2) {
        %>
        <!-- New Books content -->
        <div class="col-md-3 mb-2 mt-2">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>"
                        style="height: 200px; width: 150px" class="img-thumbnail">
                    <p><%=b.getBookname()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p><%=b.getBookCategory()%></p>
                    <div class="row d-flex justify-content-center">
                        <% if(u==null)
                    	{%>
                    	       <a href="login.jsp" class="btn btn-danger btn-sm ml-1"><i
                            class="fa fa-cart-plus" aria-hidden="true"></i> Add to Cart</a>
                    	<%}else{%>
                    		 <a href="cart?bid=<%=b.getBookId() %>&&uid=<%=u.getId() %>" class="btn btn-danger btn-sm ml-1"><i
                            class="fa fa-cart-plus" aria-hidden="true"></i> Add to Cart</a>
                    	<%}
                    	%>
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="#" class="btn btn-danger btn-sm ml-1"><i
                            class="fa fa-rupee"></i> <%=b.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of New Books content -->
        <%
        }
        %>
		

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