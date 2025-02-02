<%-- 
    Document   : logout
    Created on : Oct 2, 2022, 11:23:31 AM
    Author     : AFSAL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Aquera</title>
    </head>
    <body>
        <% session.invalidate(); %>
        <script>alert("Logout Sucessfull");</script>
        <%response.setHeader("Refresh", "0;url=index.jsp");%>
</body> 
</html>