<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Order</title>
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
        crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <!-- FONTAWESOME CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body style="background-color: #f0f1f2">
<c:if test="$(empty userobj}">
<c:redirect url="../login.jsp" />
</c:if>
    <%@include file="Navbar.jsp"%>
    <h3 class="text-center">Hello Admin</h3>
    <table class="table table-striped">
        <thead class="bg-dark text-light">
            <tr>
                <th scope="col">Order Id</th>
                <th scope="col">Name</th>
                <th scope="col">Email</th>
                <th scope="col">Address</th>
                <th scope="col">Phone no</th>
                <th scope="col">Book Name</th>
                <th scope="col">Author</th>
                <th scope="col">Price</th>
                <th scope="col">Payment Type</th>
            </tr>
        </thead>
        <tbody class="text-danger">
            <%
            BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
            List<Book_Order> blist = dao.getAllOrder();
            for (Book_Order b : blist) {
            %>
            <tr>
                <th scope="row"><%= b.getOrderId() %></th>
                <td><%= b.getUsername() %></td>
                <td><%= b.getEmail() %></td>
                <td><%= b.getFulladd() %></td>
                <td><%= b.getPhoneno() %></td>
                <td><%= b.getBookname() %></td>
                <td><%= b.getAuthor() %></td>
                <td><%= b.getPrice() %></td>
                <td><%= b.getPaymentType() %></td>
            </tr>
            <%
            }
            %>
        </tbody>
    </table>
</body>
</html>
