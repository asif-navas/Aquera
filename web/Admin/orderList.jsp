<%-- 
    Document   : sellerverify
    Created on : 04-Oct-2022, 2:17:53 am
    Author     : 91963
--%>

<%@page import="java.sql.Statement"%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    <body style="margin-top:7rem;">
        <div class="col-sm-12 card shadow-sm container-sm pb-4 opacity-75">
            <div class="panel-body">
                <div class="row">
                    <div class="col">
                        <h4 class="p-3">Orders</h4>
                    </div>
                </div>
                <hr>
                <table id="tbl-student" class="table table-striped mb-0" cellpadding ="0" width="100%">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Product Name</th>
                            <th>Product Category</th>
                            <th>Ordered Date</th>
                            <th>Buyer</th>
                            <th>Quantity</th>
                            <th>Total</th>
                        </tr>  
                         <%
                            Connection con;
                            PreparedStatement pst;
                            ResultSet rs;
                            con = ConnectionPro.getConnection();
                            
                            ResultSet result;
                            pst = con.prepareStatement("select * from orders");
                            result = pst.executeQuery();

                            while (result.next()) {
                        %>

                        <tr>
                            <td><%=result.getString("id")%></td>
                            <%
                                ResultSet rslt;
                                pst = con.prepareStatement("select * from products where id = ?");
                                pst.setString(1, result.getString("product_id"));
                                rslt = pst.executeQuery();
                                 while(rslt.next())
                                 {
                            %>
                            <td><%=rslt.getString("product_name") %></td>
                            <td><%=rslt.getString("product_category") %></td>
                            <% } %>
                            <td><%=result.getString("ordered_date")%></td>
                            <%
                                ResultSet rslt1;
                                pst = con.prepareStatement("select * from users where id = ?");
                                pst.setString(1, result.getString("buyer_id"));
                                rslt1 = pst.executeQuery();
                                 while(rslt1.next())
                                 {
                            %>
                            <td><%=rslt1.getString("name") %></td>
                            <td><%=result.getString("quantity")%></td>
                            <% } %>
                            <td><%=result.getString("total")%></td>
                        </tr>
                    <%

                        }
                    %>

                </table>    
            </div>

        </div>  
    </div>

</body>    </html>  
</body>
</html>
