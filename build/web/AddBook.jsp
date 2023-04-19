<%-- 
    Document   : AddBook
    Created on : 17-Nov-2022, 8:31:29 pm
    Author     : farook
--%>

<%@page language="java" contentType="text/html;" pageEncoding="UTF-8" import="java.sql.*"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1"> 
<title>Add Book Details</title> 
</head> 
<body> 
<h1 align="center">Add Book Details</h1> <hr /> 
<% 
 Connection conn = null;   PreparedStatement ps = null;   try {  
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 String URL = "jdbc:mysql://localhost:3306/library";  
 conn = DriverManager.getConnection(URL, "root", "1234");  
 ps = conn.prepareStatement("insert into book values (?, ?, ?, ?, ?, ?)");  
 ps.setInt(1,Integer.parseInt(request.getParameter("accno"))); 
 ps.setString(2, request.getParameter("title"));  
 ps.setString(3, request.getParameter("author"));  
 ps.setString(4, request.getParameter("publisher"));  
ps.setInt(5, Integer.parseInt(request.getParameter("edition"))); 
 ps.setInt(6, Integer.parseInt(request.getParameter("price"))); 

 int res = ps.executeUpdate();  if (res != 0)  
 out.println("Book Details Inserted Successfully...");  else 
 out.println("Book Details Insertion Failure..."); 
 } catch (Exception e) {   out.println(e);   }  
 ps.close();  
 conn.close();  
%> 
<br /> 
<a href="Book.html">Back</a> 
</body> 
</html> 