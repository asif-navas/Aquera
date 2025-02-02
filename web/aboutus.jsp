<%-- 
    Document   : aboutus
    Created on : Oct 3, 2022, 2:41:50 PM
    Author     : user
--%><%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <style>
      body {
        font-family: Arial, Helvetica, sans-serif;
        margin: 0;
      }

      html {
        box-sizing: border-box;
      }

      *,
      *:before,
      *:after {
        box-sizing: inherit;
      }

      .column {
        float: left;
        width: 33.3%;
        margin-bottom: 16px;
        padding: 0 8px;
      }

      .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        margin: 8px;
      }

      .about-section {
        padding: 50px;
        text-align: center;
        background-color: #474e5d;
        background-image: url("../Assets/images/home22222.jpg");
        background-color: #cccccc;
        color: white;
      }

      .container {
        padding: 0 16px;
      }

      .container::after,
      .row::after {
        content: "";
        clear: both;
        display: table;
      }

      .title {
        color: grey;
      }

      .button {
        border: none;
        outline: 0;
        display: inline-block;
        padding: 8px;
        color: white;
        background-color: #000;
        text-align: center;
        cursor: pointer;
        width: 100%;
      }

      .button:hover {
        background-color: #555;
      }

      @media screen and (max-width: 650px) {
        .column {
          width: 100%;
          display: block;
        }
      }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title>Aquera</title>
  </head>
  <body>
    <div>
    <!-- nav start -->
    <nav class="navbar navbar-expand-lg  navbar-dark bg-dark fixed-top">
      <!--fixing nav -->
      <div class="container">
        <a class="navbar-brand" href="#">
          <span class="text-info">Aquera</span>
          
        </a>
        <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>-->
        <div class="collapse navbar-collapse text-white" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            <!-- e=left ms=right -->
            <li class="nav-item">
              <a class="nav-link" href="/Aquera/">
                <p style="color:white">Home</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="gallery.jsp">
                <p style="color:white">Gallery</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="aboutus.jsp">
                <p style="color:white">Contact US</p>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="products.jsp">
                <p style="color:white">Our Products</p>
              </a>
            </li>
          <% if (session.getAttribute("name") != null && session.getAttribute("role").equals("buyer")) { %>
            <li class="nav-item">
              <a class="nav-link" href="orderList.jsp">
                <p style="color:white">Orders</p>
              </a>
            </li>
          <% } %>
            
          <% if (session.getAttribute("name") == null) { %>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">
              <p style="color:white">Login</p>
            </a>
          </li>
          <% } else { %>
          <li class="nav-item">
            <a class="nav-link" href="logout.jsp">
              <p style="color:white">Logout</p>
            </a>
          </li>
          <% } %>
        </div>
      </div>
    </nav>
    </div>
    <div style="margin-top:4rem;" class="about-section">
       <h1 class="bg-secondary p-3 " style="color: black"text-align:center">AQUERA</h1>
       <p style="color:black;">The complete online aquatic store</p>
      <p style="color:black;">Gmail ID : Aquera957@gmail.com</p>
      <p style="color:black;">Contact Number : 9865236754</p>
    </div>
    <center>
      <h2 class="bg-secondary p-3 text-black" style="text-align:center">Our Team</h2>
      <div class="row m-2 mt-4">
        <div class="col-6">
          <div class="card">
            <div class="card-body">
              <h2>Asif Navas</h2>
              <p class="title">Developer/Owner</p>
              <p>Studied in : School Of Computer Sciences MG University Kottayam</p>
              <p>asifnavas27@gmail.com</p>
              <p>
                <button class="button rounded-2">Contact</button>
              </p>
            </div>
          </div>
        </div>
        <div class="col-6">
          <div class="card">
            <div class="card-body">
              <h2>Vismaya K N</h2>
              <p class="title">Developer/Owner</p>
              <p>Studied in : School Of Computer Sciences MG University Kottayam</p>
              <p>vismayavis656@gmail.com</p>
              <p>
                <button class="button rounded-2">Contact</button>
              </p>
            </div>
          </div>
        </div>
      </div>
    </center>
    </div>
  </body>
</html>