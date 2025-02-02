<%-- 
    Document   : delete
    Created on : 01-Oct-2022, 4:27:17 pm
    Author     : Ashwin M A
--%>
<%@page import="newpackage.ConnectionPro"%>
<%@page import="java.sql.*" %>
 
 
<%
    String id = request.getParameter("id");
    Connection con;
    PreparedStatement pst;
    ResultSet rs;

    con = ConnectionPro.getConnection();
    pst = con.prepareStatement("delete from products where id = ?");
     pst.setString(1, id);
    pst.executeUpdate();  
    response.sendRedirect(request.getContextPath() + "/Admin/productsList.jsp");
%>