<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
.bg-img {
  
  background-image: url("image/home.jpg");

  min-height: 1330px;


  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}


.container {
  position: absolute;
  top: 100px;
  left: 10px;
  margin: 20px;
  max-heigth: 1000px;
  max-width: 800px;
  padding: 26px;
  background-color: yellow;
}


input[type=text], input[type=password] , input[type=date], input[type=email], input[type=number]{
  width: 90%;
  padding: 24px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus {
  background-color: #ddd;
  outline: none;
}


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
<%
HttpSession sess=request.getSession(false);  
if(session==null){  
	
	out.println("login First");
RequestDispatcher rs=request.getRequestDispatcher("login.html");
rs.include(request,response);

}  
else{  
	String name=(String)session.getAttribute("name");  
	  
	out.print("Hello, "+name+" Welcome to Profile");  
	}





%>
<div class="topnav">
  <a href="http://localhost:8080/practice/welcome.jsp">RideNow</a>
  
  <a href="http://localhost:8080/practice/feedback.jsp">feedback </a>
  <a href="javascript:go()">Logout</a>
  <a href=>all reviews</a>
</div>
<div class="bg-img">
 <form action="review" class="container">
  <%@page import=" java.io.IOException" %>
   <%@page import="java.io.PrintWriter" %>
   <%@page import="java.sql.Connection" %>
   <%@page import="java.sql.DriverManager" %>
   <%@page import="java.sql.ResultSet" %>
   <%@page import="java.sql.SQLException" %>
   <%@page import="javax.servlet.ServletException" %>
     <%@page import="javax.servlet.annotation.WebServlet" %> 
     <%@page import="javax.servlet.http.HttpServlet" %>
      <%@page import="javax.servlet.http.HttpServletRequest" %> 
      <%@page import="javax.servlet.http.HttpServletResponse" %> 
       <%@page import="java.sql.PreparedStatement" %>
  <%@page import="com.mysql.jdbc.Statement" %>
 <% try {
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");
 PreparedStatement pst=con.prepareStatement("select first_name,review from feedback");
  ResultSet rs=pst.executeQuery();
  out.print("<table border='1' width='400'>");
  out.print("<tr>");
  out.print("<td bgcolor=black><font color=white><h3>username</h3></td>");
  out.print("<td bgcolor=black><font color=white><h3>review</h3></td>");
  out.print("</tr>");
   if(rs.next()){
   do{
   String un=rs.getString(1);
   String r=rs.getString(2);
   out.print("<tr>");
   out.print("<td bgcolor=white>"+un+"</td>");
   out.print("<td bgcolor=white>"+r+"</td>");
    }while(rs.next());
   out.print("</table>");
   }else{
   out.print("<h2>No Data Found</h2>");
   }
   con.close();
   } catch (ClassNotFoundException e) {
   out.println("Driver Not Found"); 
   } catch (SQLException e) {
   out.println("SQL Error : "+e);
   }  
  %>
</form>
</body>
</html>