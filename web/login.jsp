<%-- 
    Document   : login
    Created on : 02-Oct-2022, 9:04:41 pm
    Author     : 91963
--%>
<%@page import="newpackage.ConnectionPro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
    if (request.getParameter("form_submit") != null) {
        boolean status = false;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Connection con;
        PreparedStatement pst;
        ResultSet rs;

        con = ConnectionPro.getConnection();

        pst = con.prepareStatement("select * from users where username=? and password=?");
        pst.setString(1, username);
        pst.setString(2, password);
        rs = pst.executeQuery();
        status = rs.next();

        if (status == true) {
            String role = rs.getString("role");
            String has_approved = rs.getString("has_approved");
            session.setAttribute("id", rs.getString("id"));
            session.setAttribute("name", rs.getString("name"));
            session.setAttribute("has_approved", rs.getString("has_approved"));
            session.setAttribute("role", rs.getString("role"));
            if (role.equals("seller") && has_approved.equals("1")) {
                response.sendRedirect(request.getContextPath() + "/Seller/home.jsp");

            } else if (role.equals("buyer")) {
                response.sendRedirect(request.getContextPath() + "/Buyer/home.jsp");

            } else if (role.equals("admin")) {
                response.sendRedirect(request.getContextPath() + "/Admin/home.jsp");

            } else { %> <script>
  alert("Invalid Credentials");
</script><% }
} else { %> <script>
  alert("user id or password doesn't match");
</script><% }
    }%>
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
<!--            <li class="nav-item">
              <a class="nav-link" href="/Kart_EM/">
                <p style="color:white">HOME</p>
              </a>
            </li>-->
            <li class="nav-item">
              <a class="nav-link" href="index.jsp">
                <p style="color:white">Home</p>
              </a>
            </li>
            
      </div>
    </div>
  </nav>
  <!-- nav end -->
  <body>
      
    <div class="main">
      <div class="main-w3l">
        <h1 class="logo-w3 bg-body-img" style="color:black">Aquera</h1>
        <div class="container custom-card opacity-75 bg-body-img" style="margin-top:7rem; width: 35rem !important;">
                  <!-- login_wrapper -->
                  <div class="">
                      <h3 class="mb-5 text-center">Login</h4>
                <form  method="POST" action="#" >
                    <input value="submit" type="hidden" name="form_submit"> 
                    <div class="formsix-pos">
                      <div class="form-group i-username">
                        <input type="text" class="form-control" required="" id="username" name="username" placeholder="Username">
                      </div>
                    </div>
                    <div class="formsix-e">
                      <div class="form-group i-password">
                        <!--<input placeholder="Password" class="form-control" name="password" type="password" required="" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Password must have atleast 8 characters, 1 lowercase and uppercase and a digit" autocomplete="off" />-->
                        <input placeholder="Password" class="form-control" name="password" type="password" required="" title="Password must have atleast 8 characters, 1 lowercase and uppercase and a digit" autocomplete="off" />
                      </div>
                    </div>
                    <div class="login_btn_wrapper">
                        <button  type="submit" class="btn btn-primary w-100 mt-3 mb-3"> Login </button>
                    </div>
                    <div class="text-center">Don't have an account ? <a class="text-white" href="registration.jsp"> Sign up </a>
                    </div>
                </form>
                  </div>
                  <!-- /.login_wrapper-->
        </div>
      </div>
    </div>
    </body>
</html>