<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login</title>
<style>
body, html {
	height: 100%;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: #333;
}

.topnav a {
	float: left;
	color: #f2f2f2;
	text-align: center;
	padding: 20px 20px;
	text-decoration: none;
	font-size: 20px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

* {
	box-sizing: border-box;
}

.bg-img {
	/* The image used */
	background-image: url("image/home.jpg");
	min-height: 800px;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
	position: relative;
}

.container {
	position: absolute;
	top: 120px;
	left: 0px;
	margin: 20px;
	max-heigth: 700px;
	max-width: 500px;
	padding: 26px;
	background-color: yellow;
}

input[type=text], input[type=password] {
	width: 100%;
	padding: 24px;
	margin: 5px 0 22px 0;
	border: none;
	background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus {
	background-color: #ddd;
	outline: none;
}

/* Set a style for the submit button */
.btn {
	background-color: black;
	color: white;
	padding: 16px 20px;
	border: none;
	cursor: pointer;
	width: 100%;
	opacity: 0.9;
}

.btn:hover {
	opacity: 1;
}
</style>
</head>
<body>

	
<div class="topnav">
		<a href="http://localhost:8080/practice/welcome.jsp">RideNow</a>
  
  <a href="http://localhost:8080/practice/feedback.jsp">feedback </a>
  <a href="javascript:go()">Logout</a>
  <a href="http://localhost:8080/practice/rewive.jsp">all reviews</a>
	</div>
	
	<div class="bg-img">
		<form action="confirm" class="container">

			<%@page import=" java.io.IOException"%>
			<%@page import="java.io.PrintWriter"%>
			<%@page import="java.sql.Connection"%>
			<%@page import="java.sql.DriverManager"%>
			<%@page import="java.sql.ResultSet"%>
			<%@page import="java.sql.SQLException"%>
			<%@page import="javax.servlet.ServletException"%>
			<%@page import="javax.servlet.annotation.WebServlet"%>
			<%@page import="javax.servlet.http.HttpServlet"%>
			<%@page import="javax.servlet.http.HttpServletRequest"%>
			<%@page import="javax.servlet.http.HttpServletResponse"%>
			<%@page import="java.sql.PreparedStatement"%>
			<%@page import="com.mysql.jdbc.Statement"%>
			<% try {
				   String s=request.getParameter("seat");
					String v=request.getParameter("vehicle");
				    Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");

PreparedStatement pst=con.prepareStatement("select * from driver where vehicle=? and seat_available=?");
pst.setString(1,v);
pst.setString(2,s);
ResultSet rst=pst.executeQuery();

if(rst.next())
{
	 do{
	   String vno=rst.getString(1);
	   String nm=rst.getString(2);   
	   int no=rst.getInt(3);  
	   String vn=rst.getString(5);
	   String ac=rst.getString(6);
	   String ft=rst.getString(7);
	   %><table>
	   <tr colspan=2>Vehicle And Driver Information</tr>
	   <tr><td>Driver Name:</td><td><%=nm %></td></tr><br>	
	    <tr><td>Driver Contact Number:</td><td><%=no %></td></tr><br>	
	    <tr><td>Vehicle Number:</td><td><%=vno %></td></tr><br>	
	    <tr><td>Vehicle Type:</td><td><%=v %></td></tr><br>
	   <tr><td>Vehicle Model:</td><td><%=vn %></td></tr><br>	
	    <tr><td>Air Conditioner:</td><td><%=ac %></td></tr><br>
	   <tr><td>Fuel Type:</td><td><%=ft %></td></tr><br>	
	    <tr><td>Seat Available:</td><td><%=s %></td></tr><br></table>
	   <%	
	   }
	 while(rst.next());
} 
else
{
	   out.println("data not found");
RequestDispatcher rd=request.getRequestDispatcher("vehicle.html");  
rd.include(request, response); 
}
%>
<a href="final.html">Submit</a>
<%
con.close();
} catch (ClassNotFoundException e) {
out.println("Driver Not Found"); 
} catch (SQLException e) {
out.println("SQL Error : "+e);
}  
%>
</body>
</html>