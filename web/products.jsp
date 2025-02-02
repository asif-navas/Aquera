<%-- 
    Document   : products
    Created on : 04-Oct-2022, 7:10:15 am
    Author     : 91963
--%><%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title>Aquera</title>
    
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
            <a class="nav-link" href="/Aquera/">
              <p style="color:white">Home</p>
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
          <% } if (session.getAttribute("name") == null) { %>
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
  <body class="container" style="margin-top:7rem;">
      <div class="row mb-3">
          <div class="col">
              <h2>Our Products</h4>
          </div>
          <div class="col-3 text-end">
             <form  method="POST" action="#">
                <select onchange="this.form.submit()" class="form-control" id="category" name="category" class="select">
                    <option selected="selected" value="">Filter by Category</option>
                    <option value="">All</option>
                    <option value="Fishes">Fishes</option>
                    <option value="Aquatic Products">Aquatic Products</option>
                </select>
             </form>
          </div>
      </div>
          <hr>
    <div class="row ">
        <%
            Connection con;
            PreparedStatement pst;
            ResultSet rs;
            con = ConnectionPro.getConnection();
            String category = request.getParameter("category");
            if (category != null && category !="") {
                pst = con.prepareStatement("select * from products where product_category = ?");
                pst.setObject(1, category);
            } else {
                pst = con.prepareStatement("select * from products");
            }
            rs = pst.executeQuery();

            while (rs.next()) {
        %>
      <div class="col-3">
          <div class="card mb-3">
          <img height="250" width="100" class="card-img-top" src="Assets/images/claudio-guglieri-K2RH1QZdLF4-unsplash.jpg" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title"><%=rs.getString("product_name")%></h5>
            <p class="card-text"><%=rs.getString("product_description")%></p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">Price : ₹ <%=rs.getString("price")%></li>
          </ul>
          <div class="card-body">
                <% if (session.getAttribute("name") != null) { %>
                    <a class="btn btn-primary w-100" href="Buyer/buyProduct.jsp?id=<%=rs.getString("id")%>&price=<%=rs.getString("price")%>">Buy now</a>
                <% } else { %>
                    <a class="btn btn-primary w-100" href="login.jsp">Login to Buy</a>
                <% } %>
          </div>
        </div>
      </div>
      <% } %>
    </div>
  </body>
  <style> 
      body {
  margin: 0;
  font-family: Arial;
  background-image: url('Assets/images/whitebg.png');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;

}
  </style>
</html>