<%@page import="newpackage.ConnectionPro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
 <html>
     <%
 
    if(request.getParameter("submit")!=null)
    {
            
        String product_id = request.getParameter("product_id");
        String quantity = request.getParameter("quantity");
        int seller_id = Integer.parseInt(request.getParameter("seller_id"));
        String current_quantity = request.getParameter("q1");
        int new_quantity = Integer.parseInt(current_quantity) - Integer.parseInt(quantity);
        String price = request.getParameter("price");
        int total = Integer.parseInt(quantity) * Integer.parseInt(price);
        String buyer_id = request.getParameter("buyer_id");
        String acc_no = request.getParameter("acc_no");
        String ifsc_code = request.getParameter("ifsc_code");
        String branch_name = request.getParameter("branch_name");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        con = ConnectionPro.getConnection();
        pst = con.prepareStatement("insert into orders(product_id,quantity, total, buyer_id, acc_no, ifsc_code, branch_name, seller_id)values(?,?,?,?,?,?,?,?)");
        pst.setString(1, product_id);
        pst.setString(2, quantity);
        pst.setInt(3, total);
        pst.setString(4, buyer_id);
        pst.setString(5, acc_no);
        pst.setString(6, ifsc_code);
        pst.setString(7, branch_name);
        pst.setInt(8, seller_id);
        pst.executeUpdate();
        
        Connection con1;
        PreparedStatement pst1;
        ResultSet rs1;
        
        con1 = ConnectionPro.getConnection();
        pst1 = con1.prepareStatement("update products set quantity =? where id = ?");
        pst1.setInt(1, new_quantity);
        pst1.setString(2, product_id);
        pst1.executeUpdate();  
        response.sendRedirect(request.getContextPath() + "/orderList.jsp"); 
         
    }
   %>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="../Assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../Assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
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
              <a class="nav-link" href="home.jsp">
                <p style="color:white">Home</p>
              </a>
            </li>
            
            <% if (session.getAttribute("name") == null) { %>
            <li class="nav-item">
              <a class="nav-link" href="../login.jsp">
                <p style="color:white">Login</p>
              </a>
            </li>
            <% } else { %>
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
<body>
    <div style="margin-top: 7rem; margin-left: 23rem;" class="card shadow-lg p-4 mb-4 w-50 opacity-20">
        <div class="row">
            <div class="col-6">
                <h4 class="mb-3">Buy Product</h4>
            </div>
        </div>
        <form  method="POST" action="#"  >
          <input type="hidden" value="<%=request.getParameter("id") %>" id="product_id" name="product_id" class="form-control" />
          <input type="hidden" value="<%=session.getAttribute("id") %>" id="buyer_id" name="buyer_id" class="form-control" />
          <input type="hidden" value="<%=request.getParameter("price") %>" id="price" name="price" class="form-control" />
          
          <div class="row mb-3"> 
          <%
                Connection con;
                PreparedStatement pst;
                ResultSet rs;

                con = ConnectionPro.getConnection();

                String id = request.getParameter("id");

                pst = con.prepareStatement("select * from products where id = ?");
                pst.setString(1, id);
                rs = pst.executeQuery();

                while (rs.next()) {
            %>  
            <input type="hidden" value="<%=rs.getString("created_by") %>" id="seller_id" name="seller_id" class="form-control" />
            <div class="col-6">
                <img height='300' width="300" src="../Assets/images/claudio-guglieri-K2RH1QZdLF4-unsplash.jpg"/>
            </div>
            <div class="col-6">
                <label class="mb-1">Product ID</label>
                <div class="text"><%=rs.getString("id")%></div>
                <label class="mb-1">Product Name ( <%=rs.getString("quantity")%> )</label>
                <div class="text"><%=rs.getString("product_name")%></div> 
                <label class="mb-1">Product Price</label>
                <div class="text"><%=rs.getString("price")%></div> 
                <label class="mb-1">Product Description</label>
                <div class="text"><%=rs.getString("product_description")%></div> 
            </div>    
          </div>
            <hr>
        <div class="row mb-3">
          <div class="col-md-6">
            <label class="mb-1">Quantity</label>
            <input value="<%=rs.getString("quantity")%>" type="hidden" id="q1" name="q1" class="form-control" />
            <input required="required" type="number" onchange="myChangeFunction(this.value)" id="quantity" name="quantity" class="form-control" />
          </div>    
          <div class="col-md-6">
            <label class="mb-1">Total</label>
            <input type="number" disabled id="total" name="total" class="form-control" />
          </div>
        </div>
        <div class="row mb-3">
          <div class="col-md-12">
            <label class="mb-1">Account Number</label>
            <input type="text" id="acc_no" maxlength="12" name="acc_no" class="form-control" />
          </div>  
        </div>
        <div class="row mb-3">
          <div class="col-md-6">
            <label class="mb-1">IFSC Code</label>
            <input type="text" id="ifsc_code" maxlength="10" name="ifsc_code" class="form-control" />
          </div>   
          <div class="col-md-6">
            <label class="mb-1">Branch Name</label>
            <input type="text" id="branch_name" name="branch_name" class="form-control" />
          </div>   
        </div>
        <div align="right" class="mt-3">
          <a href="../products.jsp" class="btn btn-danger">Cancel</a>
          <input type="submit" id="submit" value="Buy" name="submit" class="btn btn-info">
        </div>  
            <% } %>
      </form>
        <script type="text/javascript">
            function myChangeFunction(quantity) {
              var q1 = document.getElementById('q1');
              if (parseInt(quantity) > parseInt(q1.value)) {
                  var quantity = document.getElementById('quantity');
                  quantity.value = '';
                  alert("Max quantity limit is " + q1.value);
              } else {
                var total = document.getElementById('total');
                total.value = parseInt(quantity) * <%=request.getParameter("price") %>;
              }
            }
          </script>
    </div>
  </body>
  <style>
      body {
  margin: 0;
  font-family: Arial;
  background-image: url('..Assets/images/whitebg.png');
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-size: 100% 100%;

}
  </style>
</html>