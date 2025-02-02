<%@page import="newpackage.ConnectionPro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 <html>
     <%
 
    if(request.getParameter("submit")!=null)
    {
            
        String created_by = request.getParameter("created_by");
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
        pst = con.prepareStatement("insert into products(product_name,quantity,product_description, price, product_image, created_by, product_category)values(?,?,?,?,?,?,?)");
        pst.setString(1, product_name);
        pst.setString(2, quantity);
        pst.setString(3, product_description);
        pst.setString(4, price);
        pst.setString(5, product_image);
        pst.setString(6, created_by);
        pst.setString(7, product_category);
        pst.executeUpdate(); 
        response.sendRedirect(request.getContextPath() + "/Admin/productsList.jsp"); 
         
    }
   %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <title>Aquera</title>
     <style>
        body{
            background-image:url("../Assets/images/bgg.jpg");
            background-repeat: no-repeat;
            background-size:auto;
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
            <% } %>
      </div>
    </div>
  </nav>
  <!-- nav end -->
  <body class="g-body-imgb">>
    <div style="margin-top: 8rem; margin-left: 23rem;" class="custom-card opacity-75">
        <div class="row">
            <div class="col-6">
                <h4 class="mb-3">Add Product</h4>
            </div>
        </div>
      <form method="POST" action="#">
          <input type="hidden" value="<%= session.getAttribute("id") %>" id="created_by" name="created_by" class="form-control" />
        <div class="row">
          <div class="col-md-6">
            <label>Product Name</label>
            <input type="text" id="product_name" name="product_name" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Product Category</label>
            <select class="form-control" id="product_category" name="product_category" class="select">
                <option selected="selected" value="">Select Category</option>
                <option value="Fishes">Fishes</option>
                <option value="Aquatic Products">Aquatic Products</option>
            </select>
          </div>
          <div class="col-md-12">
            <label>Product Image</label>
            <input class="form-control" id="product_image" name="product_image" type="file" />
            <div class="small mt-2">Upload your Image. Max file size 5 MB</div>
          </div>
          <div class="col-md-12 mb-3">
            <label>Product Description</label>
            <input type="text" id="product_description" name="product_description" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Product Quantity</label>
            <input type="number" id="quantity" name="quantity" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Product Price</label>
            <input type="number" id="price" name="price" class="form-control" />
          </div>
        </div>
        <div align="right" class="mt-3">
          <input type="submit" id="submit" value="Save" name="submit" class="btn btn-info">
        </div>
      </form>
    </div>
  </body>
</html>