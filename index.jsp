
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtlss"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ebook: Index</title>
  <!-- Add the favicon link here -->
   <link type="image/png" sizes="16x16" rel="icon" href="img/icons8-reading-16.png">


<!-- CSS-CDN  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<link rel="stylesheet" href="allComponent/style.css">
<!-- FONTAWASOME CDN -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

<style type="text/css">
.back-img {
	background: url("img/26102.jpg");
	height: 50vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #e0dede;
}
</style>
</head>
<body style="background-color: #f5f0f0;">

<%
User u=(User)session.getAttribute("userobj"); 
%>
	<%@include file="allComponent/Navbar.jsp"%>
	<div class="container-fluid back-img">
		<h2 class="text-center text-white">EBook Management System</h2>

	</div>

	<!-- Starting Recent-book -->
	<div class="container">
    <h3 class="text-center">Recent Books</h3>
    <div class="row">
        <%
        BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConnection());
        List<BookDtlss> list = dao2.getRecentBooks();
        for (BookDtlss b : list) {
        %>
        <!-- Recent Books content -->
        <div class="col-md-3 mb-1">
            <div class="card crd-ho">
                <div class="card-body text-center">
                    <img alt="" src="book/<%=b.getPhotoName()%>"
                        style="height: 200px; width: 150px" class="img-thumblin">
                    <p><%=b.getBookname()%></p>
                    <p><%=b.getAuthor()%></p>
                    <p>
                    <%
                    if(b.getBookCategory().equals("Old"))
                    {%>
                     Categories: <%=b.getBookCategory()%></p>
                    	 <div class="row d-flex justify-content-center">
                    	 
                        <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
                        <a href="#" class="btn btn-danger btn-sm ml-1 "><i
                            class="fa fa-rupee"></i> <%=b.getPrice()%></a>
                    </div>
                   <%}else{%>
                	<p>Categories: <%=b.getBookCategory()%></p>
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
                        <a href="#" class="btn btn-danger btn-sm ml-1 mt-1"><i
                            class="fa fa-rupee"></i> <%=b.getPrice()%></a>
                    </div>   
                  <%}
                    %>
                    
                   
                </div>
            </div>
        </div>
        <!-- End of Recent Books content -->
        <%
        }
        %>
    </div>
    <div class="text-center mt-1">
        <a href="all_recent_book.jsp" class="btn btn-danger btn-sm text-white">View all</a>
    </div>
</div>

<hr>
<!-- Starting NNew book -->
<div class="container">
    <h3 class="text-center">New Books</h3>
    <div class="row">
        <%
        BookDAOImpl dao = new BookDAOImpl(DBConnect.getConnection());
        List<BookDtlss> list2 = dao.getNewBook();
        for (BookDtlss b : list2) {
        %>
        <!-- New Books content -->
        <div class="col-md-3 mb-1">
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
                        <a href="#" class="btn btn-danger btn-sm mt-1"><i
                            class="fa fa-rupee"></i> <%=b.getPrice()%></a>
                    </div>
                </div>
            </div>
        </div>
        <%
        }
        %>
    </div>
    <div class="text-center mt-1">
        <a href="all_new_book.jsp" class="btn btn-danger btn-sm text-white">View all</a>
    </div>
</div>
   <!-- End of New Books content -->
		<hr>
	<!-- Starting old-book -->
	<div class="container ">
		<h3 class="text-center">Old Book</h3>
		<div class="row">


			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConnection());
			List<BookDtlss> list3 = dao3.getOldBooks();
			for (BookDtlss b : list3) {
			%>
			<!-- Recent Books content -->
			<div class="col-md-3 mb-1">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="height: 200px; width: 150px" class="img-thumblin">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p><%=b.getBookCategory()%></p>
						<div class="row d-flex justify-content-center">
							<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-success btn-sm ml-1">View Details</a>
							<a href="#" class="btn btn-danger btn-sm ml-1 "><i
								class="fa fa-rupee"></i> <%=b.getPrice()%></a>
						</div>

					</div>
				</div>
			</div>
			<!-- End of Recent Books content -->
			<%
			}
			%>

		</div>
		<div class="text-center mt-1 mb-2">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm text-white">View all</a>
		</div>
	</div>
	<!-- Ending Old-book -->

<%@include file="allComponent/Footer.jsp"%>	

			
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