<%@page import="newpackage.ConnectionPro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 <html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title>Aquera</title>
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
              <a class="nav-link" href="productsList.jsp">
                <p style="color:white">Products</p>
              </a>
            </li>
            <% if (session.getAttribute("name") != null) { %>
            <li class="nav-item">
              <a class="nav-link" href="../logout.jsp">
                <p style="color:white">Logout</p>
              </a>
            </li>
            <% } %>
      </div>
    </div>
  </nav>
  <!-- nav end -->
<%
    if(request.getParameter("submit")!=null)
    {
        String id = request.getParameter("id");
        String product_name = request.getParameter("product_name");
        String quantity = request.getParameter("quantity");
        String product_description = request.getParameter("product_description");
        String price = request.getParameter("price");
        String product_image = request.getParameter("product_image");
        String product_category = request.getParameter("product_category");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        con = ConnectionPro.getConnection();
        pst = con.prepareStatement("update products set product_name = ?,quantity =?,product_description= ?, price = ?, product_image = ?, product_category = ? where id = ?");
        pst.setString(1, product_name);
        pst.setString(2, quantity);
        pst.setString(3, product_description);
        pst.setString(4, price);
        pst.setString(5, product_image);
        pst.setString(6, product_category);
        pst.setString(7, id);
        pst.executeUpdate();  
        response.sendRedirect(request.getContextPath() + "/Seller/productsList.jsp");
    }
        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        con = ConnectionPro.getConnection();

        String id = request.getParameter("id");

        pst = con.prepareStatement("select * from products where id = ?");
        pst.setString(1, id);
        rs = pst.executeQuery();

        while(rs.next())
        {
        %>
            
<body>
    <div style="margin-top: 8rem; margin-left: 23rem;" class="custom-card opacity-75">
        <div class="row">
            <div class="col-6">
                <h4 class="mb-3">Update Product</h4>
            </div>
        </div>
      <form method="POST" action="#">
        <div class="row">
          <div class="col-md-6">
            <label>Product Name</label>
            <input type="text" id="product_name" value="<%=rs.getString("product_name") %>" name="product_name" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Product Category</label>
            <select class="form-control" id="product_category" name="product_category" class="select">
                <option value="">Select Category</option>
                <option value="Fishes" <% if (rs.getString("product_category").equals("Fishes")) { %> selected <% } %>>Fishes</option>
                <option value="Aquatic Products" <% if (rs.getString("product_category").equals("Aquatic Products")) { %> selected <% } %>>Aquatic Products</option>
            </select>
          </div>
          <div class="col-md-12">
            <label>Product Image</label>
            <input class="form-control" id="product_image" value="<%=rs.getString("product_image") %>" name="product_image" type="file" />
            <div class="small mt-2">Upload your Image. Max file size 5 MB</div>
          </div>
          <div class="col-md-12 mb-3">
            <label>Product Description</label>
            <input type="text" id="product_description" value="<%=rs.getString("product_description") %>" name="product_description" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Product Quantity</label>
            <input type="number" id="quantity" value="<%=rs.getString("quantity") %>" name="quantity" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Product Price</label>
            <input type="number" id="price" value="<%=rs.getString("price") %>" name="price" class="form-control" />
          </div>
        </div>
        <div align="right" class="mt-3">
          <input type="submit" id="submit" value="Update" name="submit" class="btn btn-info">
        </div>
      </form>
    </div>
  </body>
   <% }  %>
</html>