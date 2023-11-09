<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false" %>	
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Settings</title>
    <link type="image/png" sizes="16x16" rel="icon" href="img/icons8-reading-16.png">

    <!-- CSS-CDN -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <link rel="stylesheet" href="allComponent/style.css">

    <!-- FONT AWESOME CDN -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        a {
            text-decoration: none;
            color: black;
        }

        a:hover {
            text-decoration: none;
        }
    </style>
</head>
<body style="background-color: #f5f0f0;">
<c:if test="${empty userobj}">
<c:redirect url ="login.jsp"/>
</c:if>
<%@include file="allComponent/Navbar.jsp"%>
<div class="container">
 <h3 class="text-center">Hello,${userobj.name}</h3>
    <div class="row p-5">
        <div class="col-md-4">
            <a href="sell_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h4>Sell Old Book</h4>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-md-4">
            <a href="old_book.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-book-open fa-3x"></i>
                        </div>
                        <h4> Old Book</h4>
                    </div>
                </div>
            </a>
        </div>
        
        
        <div class="col-md-4">
            <a href="edit_profile.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                            <i class="fas fa-edit fa-3x"></i>
                        </div>
                        <h4>Edit Profile</h4>
                    </div>
                </div>
            </a>
        </div>
        
       
        
        
          <div class="col-md-6 mt-3">
            <a href="order.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-danger">
                          <i class="fa-solid fa-box fa-3x"></i> 
                        </div>
                        <h4>My Order</h4>
                        <p>Track Your Order</p>
                    </div>
                </div>
            </a>
        </div>
        
        <div class="col-md-6 mt-3">
            <a href="helpline.jsp">
                <div class="card">
                    <div class="card-body text-center">
                        <div class="text-primary">
                          <i class="fas fa-user-circle fa-3x"></i> 
                        </div>
                        <h4>Help Center</h4>
                        <p>24*7 Service</p>
                    </div>
                </div>
            </a>
        </div> 
        
    </div>
</div>

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
