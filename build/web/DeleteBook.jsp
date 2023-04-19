<%-- 
    Document   : DeleteBook
    Created on : 17-Nov-2022, 8:40:48 pm
    Author     : farook
--%>

<%@page language="java" contentType="text/html;" pageEncoding="UTF-8" import="java.sql.*"%> 
<!DOCTYPE html> 
<html> 
<head> 

<title>Delete Book Details</title> 
</head> 
<body> 
<h1 align="center">Delete Book Details</h1> <hr /> 
<% 
 Connection conn = null;  
 PreparedStatement ps = null;   
 try {  
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 String URL = "jdbc:mysql://localhost:3306/library";  
 conn = DriverManager.getConnection(URL, "root", "1234"); 

 ps = conn.prepareStatement("delete from book where accno = ?");  
 ps.setInt(1, Integer.parseInt(request.getParameter(("accno")))); 
 int res = ps.executeUpdate();  
 if (res != 0)  
 out.println("Book Details Deleted  Successfully...");  
 else 
 out.println("Book Details Deletion Failure..."); 
 }
 catch (Exception e) 
 {  
 out.println(e);  
 }  
 ps.close();  
 conn.close();  
%> 
<br /> 
<a href="ViewBooks.jsp">Back</a> 
</body> 
</html> 
