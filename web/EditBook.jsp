<%-- 
    Document   : EditBook
    Created on : 17-Nov-2022, 8:38:18 pm
    Author     : farook
--%>

<%@page language="java" contentType="text/html;" pageEncoding="UTF-8" import="java.sql.*"%> 
<!DOCTYPE html> 
<html> 
<head> 

<title>Edit Book Details</title> 
</head> 
<body> 
<h1 align="center">Edit Book Details</h1> <hr /> 
<% 
 Connection conn = null;  
 PreparedStatement ps = null;   ResultSet rs = null;  
 try {  
 Class.forName("com.mysql.cj.jdbc.Driver"); 
 String URL = "jdbc:mysql://localhost:3306/library";  conn = DriverManager.getConnection(URL, "root", "1234");  ps = conn.prepareStatement("select * from book where accno = ?");  
 ps.setInt(1, Integer.parseInt(request.getParameter(("accno")))); 
 rs = ps.executeQuery();   
 rs.next();  
%> 
<form action="UpdateBook.jsp" method="post">  <table> 
 <tr> 
 <td>Acc. No. :</td>  <td><input type="text" name="accno"  value="<%=rs.getInt("accno")%>" 
readonly></td> 
 </tr> 
<tr> 
 <td>Title :</td>  <td><input type="text" name="title"  value="<%=rs.getString("title")%>"></td> </tr>

 <tr> 
 <td>Author :</td>  <td><input type="text" name="author"  value="<%=rs.getString("author")%>"></td> </tr> 
<tr> 
 <td>Publisher :</td>  <td><input type="text" name="publisher" value="<%=rs.getString("publisher")%>"></td> </tr> 
<tr> 
 <td>Edition :</td>  <td><input type="text" name="edition" value="<%=rs.getInt("edition")%>"></td> </tr> 
<tr> 
 <td>Price :</td>  <td><input type="text" name="price"  value="<%=rs.getInt("price")%>"></td> </tr> 
<tr> 
 <td colspan="2" align="center"><input type="submit" value="Update Book"></td>  </tr> 
 </table> 
</form> 
<% 
 } catch (Exception e) {  
 out.println(e);  
 }  
 rs.close();  
 ps.close();  
 conn.close();  
%> 
<br /> 
<a href="ViewBooks.jsp">Back</a> 
</body> 
</html>  
