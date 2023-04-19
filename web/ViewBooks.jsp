<%-- 
    Document   : ViewBooks
    Created on : 17-Nov-2022, 8:35:51 pm
    Author     : farook
--%>

<%@page language="java" contentType="text/html;" pageEncoding="UTF-8" import="java.sql.*"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1"> 
<title>View All Book Details</title> 
</head> 
<body> 
<h1 align="center">All Book Details</h1> <hr /> 
<% 
 Connection conn = null;  
 PreparedStatement ps = null;   ResultSet rs = null;  
 try {  
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 String URL = "jdbc:mysql://localhost:3306/library";  conn = DriverManager.getConnection(URL, "root", "1234");  ps = conn.prepareStatement("select * from book order by accno");  
 rs = ps.executeQuery();  %> 
<table border="1"> 
 <tr> 
 <td>Acc No.</td> 
 <td>Title</td> 
 <td>Author</td> 
 <td>Publisher</td> 
 <td>Edition</td> 
 <td>Price</td> 
 <td>Edit</td> 
 <td>Delete</td> 
 </tr> 
<% 
 while (rs.next()) {   %> 
<tr> 
 <td><%=rs.getInt("accno")%></td>  <td><%=rs.getString("title")%></td>  <td><%=rs.getString("author")%></td>  <td><%=rs.getString("publisher")%></td>  
<td><%=rs.getInt("edition")%></td>  <td><%=rs.getInt("price")%></td>  <td><a href="EditBook.jsp?accno=<%=rs.getInt("accno")%>">Edit</a></td>  <td><a href="DeleteBook.jsp?accno=<%=rs.getInt("accno")%>">Delete</a></td> 
 </tr> 
<% 
 }  
%> 
</table>
<% 
 } catch (Exception e) {  
 out.println(e);  
 }  
 rs.close();  
 ps.close();  
 conn.close();  
%> 
<br /> 
<a href="Book.html">Back</a> 
</body> 
</html>  
