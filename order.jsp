<%@page import="com.entity.Book_Order"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entity.User" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.DAO.BookOrderImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Order</title>
    <link type="image/png" sizes="16x16" rel="icon" href="img/icons8-reading-16.png">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link rel="stylesheet" href="allComponent/style.css">
    <%@ include file="allComponent/Navbar.jsp" %>
    <!-- FONTAWESOME CDN -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>
<body style="background-color: #f5f0f0;">
<c:choose>
    <c:when test="${empty userobj}">
        <c:redirect url="login.jsp"></c:redirect>
    </c:when>
    <c:otherwise>
        <div class="container p-1">
            <h3 class="text-center text-primary">Your Order</h3>
            <table class="table table-striped mt-3">
                <thead class="bg-primary">
                    <tr>
                        <th scope="col">Order Id</th>
                        <th scope="col">Name</th>
                        <th scope="col">Book Name</th>
                        <th scope="col">Author</th>
                        <th scope="col">Price</th>
                        <th scope="col">Payment Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    User user = (User) session.getAttribute("userobj");
                    BookOrderImpl dao = new BookOrderImpl(DBConnect.getConnection());
                    List<Book_Order> orderList = dao.getBook(user.getEmail());

                    for (Book_Order order : orderList) {
                    %>
                    <tr>
                        <td><%= order.getOrderId() %></td>
                        <td><%= order.getUsername() %></td>
                        <td><%= order.getBookname() %></td>
                        <td><%= order.getAuthor() %></td>
                        <td><%= order.getPrice() %></td>
                        <td><%= order.getPaymentType() %></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
    </c:otherwise>
</c:choose>
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
</body>
</html>
