<%-- 
    Document   : home
    Created on : 04-Oct-2022, 3:37:12 am
    Author     : 91963
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="../Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <title >Aquera</title>
          <style>
        body{
            background-image:url("../Assets/images/bgg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            width:100%;
           
            
        }
        </style>
    </head>
    <!-- nav start -->
    <nav class="navbar navbar-expand-lg  navbar-dark bg-dark fixed-top">
        <!--fixing nav -->
        <div class="container">
            <a class="navbar-brand" href="#">
                 <span style="font-family: cursive; font-weight: bold; font-size:28px;" class="text-info">Aquera</span>
            </a>
            <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>-->
            <div class="collapse navbar-collapse text-white" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <!-- e=left ms=right -->
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">
                            <p style="color:white">Home</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sellerverify.jsp">
                            <p style="color:white">Pending Requests</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="verifiedUserList.jsp">
                            <p style="color:white">Verified Sellers</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="rejectedUserList.jsp">
                            <p style="color:white">Rejected Sellers</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="productsList.jsp">
                            <p style="color:white">Products</p>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="orderList.jsp">
                            <p style="color:white">Orders</p>
                        </a>
                    </li>

                    <% if (session.getAttribute("name") != null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="../logout.jsp">
                            <p style="color:white">Logout</p>
                        </a>
                    </li>
                    <% }%>
            </div>
        </div>
    </nav>
    <!-- nav end -->
    <body
<div style="margin-top: 12rem;" class="row text-white">
            <div class="col-4"></div>
            <div class="col-8" style="padding-right: 5rem !important;">
                <h1>Hello</h1> </center><br>
                <h1>Welcome Super User... </h1><br>
            </div>
        
</body>
</html>
