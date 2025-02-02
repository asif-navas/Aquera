<%@page import="newpackage.ConnectionPro"%><%@page contentType="text/html" pageEncoding="UTF-8" %><%@page import="java.sql.*" %><% 

if(request.getParameter("submit")!=null)
{
   String name = request.getParameter("name");
   String address = request.getParameter("address");
   String pincode = request.getParameter("pincode");
   String district = request.getParameter("district");
   String phone = request.getParameter("phone");
   String username = request.getParameter("username");
   String id_proof = request.getParameter("id_proof");
   String email = request.getParameter("email");
   String password = request.getParameter("password");
   String role = request.getParameter("role");
   
        Connection con;
        PreparedStatement pst;
       
        
        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/aquera", "root","");
        pst = con.prepareStatement("insert into users(name,address,pincode,district,phone,username,id_proof,email,password,role)values(?,?,?,?,?,?,?,?,?,?)");
        pst.setString(1, name);      
        pst.setString(2, address);
        pst.setString(3, pincode);
        pst.setString(4, district);
        pst.setString(5, phone);       
        pst.setString(6, username);
        pst.setString(7, id_proof);
        pst.setString(8, email);
        pst.setString(9, password);
        pst.setString(10, role);
        pst.executeUpdate();  
%> <script>
  alert("Registration Successful...!!!!");
</script><%
response.sendRedirect("login.jsp");

}

%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Assets/bootstrap/css/login-page.css" rel="stylesheet" type="text/css" />
    <title>Aquera</title>
     <style>
        body{
            background-image:url("Assets/images/bgg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            width:100%;
            background-position: center;
            
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
            <a class="nav-link" href="/Aquera/">
              <p style="color:white">Home</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="products.jsp">
              <p style="color:white">Our Products</p>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.jsp">
              <p style="color:white">Login</p>
            </a>
          </li>
      </div>
    </div>
  </nav>
  <!-- nav end -->
  
  <body class="">
    <div style="margin-top: 8rem; margin-left: 23rem;"  class="custom-card">
        <div class="row text-center">
            <div class="col-12">
                
                <h4 class="mb-3 text-white" >REGISTRATION FORM</h4>
            </div>
        </div>
        <form class="text-white" method="POST" action="#">
        <div class="row">
          <div class="col-md-6">
            <label>Name</label>
            <input type="text" required id="name" name="name" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Role</label>
            <select class="form-control" id="role" name="role" class="select">
                <option selected="selected" value="">Select Role</option>
                <option value="seller">Seller</option>
              <option value="buyer">Buyer</option>
            </select>
          </div>
          <div class="col-md-6">
            <label>ID Proof</label>
            <input class="form-control" required id="id_proof" name="id_proof" type="file" />
            <div class="small text-white mt-2">Upload your Image. Max file size 5 MB</div>
          </div>
          <div class="col-md-6">
            <label>Address</label>
            <input type="text" required id="address" name="address" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Pincode</label>
            <input type="text" required id="pincode" name="pincode" maxlength="6" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>District</label>
            <input type="text" required id="district" name="district" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Phone Number</label>
            <input type="text" required id="phone" name="phone" maxlength="10" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>E-Mail</label>
            <input type="email" required id="email" name="email" class="form-control" />
          </div>
          <div class="col-md-6">
            <label>Username</label>
            <input type="text" required id="username" name="username" class="form-control" />
          </div>
          <div class="col-md-6">
              <label>Password</label>
            <input type="password" required id="password" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" class="form-control" />
            <span style="font-size: 12px" class="text-white" >Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters.</span>
          </div>
        </div>
        <div align="right" class="mt-3">
          <input type="submit" id="submit" value="submit" name="submit" class="btn btn-primary">
          <input type="reset" id="reset" value="reset" name="reset" class="btn btn-success">
        </div>
      </form>
    </div>
  </body>
</html>