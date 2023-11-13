<%@page import="com.entity.BookDtlss"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Books</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <!-- FONTAWESOME CDN -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body style="background-color:#f0f1f2">
    <%@include file="Navbar.jsp"%>

    <div class="container">
        <div class="row">
            <div class="col-md-5 offset-md-4">
                <div class="card mt-3 mb-3">
                    <div class="card-body">
                        <h4 class="text-center text-warning">Edit Books</h4>

                     
                        <%
                       int id= Integer.parseInt(request.getParameter("id"));
                        BookDAOImpl dao =new  BookDAOImpl(DBConnect.getConnection());
                        BookDtlss b=dao.getBookById(id);
                        %>
                        
                        

                        <form action="../editbooks" method="post">
                        <input type="hidden" name="id" value="<%=b.getBookId()%>">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Book Name*</label>
                                <input name="bname" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getBookname()%>">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail">Author Name*</label>
                                <input name="author" type="text" class="form-control" id="exampleInputPassword1" value="<%=b.getAuthor()%>">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail">Price*</label>
                                <input name="price" type="number" class="form-control" id="exampleInputPassword1"  value="<%=b.getPrice()%>">
                            </div>
                            
                            
                            
                            
                            
                            <div class="form-group">
                                <label for="inputState">Book Status</label>
                                <select class="form-control" name="status" id="exampleFormControlSelect1">
                                    <%if("Active".equals(b.getStatus())){%>
                                      <option value="Active">Active</option>
                                    	 <option value="Inactive">Inactive</option>
                                    	
                                  <%  }else{
                                  %>
                                        <option value="Active">Active</option>
                                         <option value="Inactive">Inactive</option>
                                  <%} 
                                     %>
                                  
                                   
                                </select>
                            </div>
                     <!--        <div class="form-group">
                                <label for="exampleFormControlFile1">Upload Photo</label>
                                <input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
                            </div>  
--> 
                            <button type="submit" class="btn btn-primary">Update</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
