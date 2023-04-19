<%-- 
    Document   : UpdateBook
    Created on : 17-Nov-2022, 8:39:12 pm
    Author     : farook
--%>

<%@page language="java" contentType="text/html;" pageEncoding="UTF-8" import="java.sql.*"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1"> 
<title>Update Book Details</title> 
</head> 
<body> 
<h1 align="center">Update Book Details</h1> <hr /> 
<% 
 Connection conn = null;  
 PreparedStatement ps = null;
 try {  
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 String URL = "jdbc:mysql://localhost:3306/library";  conn = DriverManager.getConnection(URL, "root", "1234");  
 ps = conn.prepareStatement(   "update book set title = ?, author = ?, publisher = ?, edition = ?, price = ? where accno = ?");   
 ps.setString(1, request.getParameter("title")); 
 ps.setString(2, request.getParameter("author"));  ps.setString(3,request.getParameter("publisher"));  ps.setInt(4,Integer.parseInt(request.getParameter("edition"))); 
 ps.setInt(5, Integer.parseInt(request.getParameter("price"))); 
 ps.setInt(6,  Integer.parseInt(request.getParameter("accno"))); 
 int res = ps.executeUpdate();  if (res != 0)  
 out.println("Book Details Updated  Successfully...");  
 else 
 out.println("Book Details Updation Failure..."); 
 } catch (Exception e) {  
 out.println(e);  
 }  
 ps.close();  
 conn.close();  
%> 
<br /> 
<a href="ViewBooks.jsp">Back</a> 
</body> 
</html>  
