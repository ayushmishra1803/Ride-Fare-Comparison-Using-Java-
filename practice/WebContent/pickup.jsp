<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cost Estimation</title>
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
	
	out.println("Login First");
RequestDispatcher rs=request.getRequestDispatcher("login.html");
rs.include(request,response);

}  
else{  
	String name=(String)session.getAttribute("name");
	out.println( "hello" +name);
	 
	}





%>
<div class="topnav">
  <a href="http://localhost:8080/practice/welcome.jsp">Compare Now</a>
  
  
  <a href="http://localhost:8080/practice/logout.jsp">Logout</a>
  
</div>
<div class="bg-img">
 <form action="payment.jsp" class="container">
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
       <%@page import="javax.servlet.RequestDispatcher" %> 
  <%@page import="com.mysql.jdbc.Statement" %>
  
 <% try {
	 
	
	 
	String v=request.getParameter("vehicle");
	
	
	 String p=request.getParameter("pick");
	 String d=request.getParameter("drop");
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ayush","root","root");
 PreparedStatement pt=con.prepareStatement("select distance from route where source=? and destination=?");
 pt.setString(1,request.getParameter("pick"));
 pt.setString(2,request.getParameter("drop"));
  ResultSet rs=pt.executeQuery();
  int t = Integer.parseInt(v);
     if(rs.next()){
   do{
   double un=rs.getDouble(1);
   out.println("<h1>");
   double cost=un*4;
   double ola=0;
   double uber=0; 
   double jug=0;
   double rap=0;
   
     out.println("Distance Between your pick up and drop location is : "+un+"Km"+"<br>");
   
   if(t==1)
   {
	   
	   
	   int bo=40;
		int bu=42;
		int bj=39;
		  if(un<10)
		   {
			   ola=un*7 +bo;
			   uber=un*7.35 +bu;
			   jug=un*9.15 +bj;
			   rap=un*0;
			   if(ola<50)
			   {
				   ola=50;
				   out.println("<a href=https://www.olacabs.com/>Ola will approximately charge</a>: "+ola+ "Rs"+"<br>");
			   }
			   if(uber<50)
			   {
				   
				   uber=46;
				   out.println("<a href=https://auth.uber.com/login/?breeze_local_zone=dca1&next_url=https%3A%2F%2Fm.uber.com%2F&state=FSO19kXTz1-Pl9PsLBxXwoKd1Ui5wYYOY5REcL85Zq0%3D>Uber will approximately charge: </a>"+uber+ "Rs"+"<br>");
			   }
			   
			   if(jug<50)
			   {
				   jug=50;
				   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+ "Rs"+"<br>");
			   }
			   else {
			   out.println("<a href=https://www.olacabs.com/>Ola will approximately charge</a>: "+ola+ "Rs"+"<br>"); 
			   out.println("<a href=https://auth.uber.com/login/?breeze_local_zone=dca1&next_url=https%3A%2F%2Fm.uber.com%2F&state=FSO19kXTz1-Pl9PsLBxXwoKd1Ui5wYYOY5REcL85Zq0%3D>Uber will approximately charge: </a>"+uber+"Rs"+"<br>");
			   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+"Rs"+"<br>");
			   out.println("Currenty Rapido does not provide this service!"+"<br>");
			   }
			   }
		  else if(un >10) 
			  
		  {
			  
			  ola=un*14 +bo;
			   uber=un*10.5 +bu;
			   jug=un*9.75 +bj;
			   rap=un*0;
			   out.println("<a href=https://www.olacabs.com/>Ola will approximately charge</a>: "+ola+"Rs"+"<br>"); 
			   out.println("<a href=https://auth.uber.com/login/?breeze_local_zone=dca1&next_url=https%3A%2F%2Fm.uber.com%2F&state=FSO19kXTz1-Pl9PsLBxXwoKd1Ui5wYYOY5REcL85Zq0%3D>Uber will approximately charge: </a>"+uber+" Rs"+"<br>");
			   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+"Rs"+"<br>");
			   out.println("Currenty Rapido does not provide this service!"+"<br>");
			 
		  }
   }
   else if(t==2)
   {
	   int bo=50;
		int bu=46;
		int bj=50;
		 if(un<10)
		   {
			   ola=un*10 +bo;
			   uber=un*8.5 +bu;
			   jug=un*10 +bj;
			   rap=un*0;
			   if(ola<50)
			   {
				   ola=50;
				   out.println("<a href=https://www.olacabs.com/>Ola will approximately charge</a>: "+ola+" Rs"+"<br>");
			   }
			   if(uber<46)
			   {
				   uber=46;
				   out.println("<a href=https://auth.uber.com/login/?breeze_local_zone=dca1&next_url=https%3A%2F%2Fm.uber.com%2F&state=FSO19kXTz1-Pl9PsLBxXwoKd1Ui5wYYOY5REcL85Zq0%3D>Uber will approximately charge: </a>"+uber+"Rs"+"<br>");
			   }
			   if(jug<50)
			   {
				   jug=50;
				   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+"Rs"+"<br>");
			   }
			   else {
			   out.println("<a href=https://www.olacabs.com/>Ola will approximately charge</a>: "+ola+"Rs"+"<br>"); 
			   out.println("<a href=https://auth.uber.com/login/?breeze_local_zone=dca1&next_url=https%3A%2F%2Fm.uber.com%2F&state=FSO19kXTz1-Pl9PsLBxXwoKd1Ui5wYYOY5REcL85Zq0%3D>Uber will approximately charge: </a>"+uber+" Rs"+"<br>");
			   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+"Rs"+"<br>");
			   out.println("Currenty Rapido does not provide this service!"+"<br>");
			   }
			   }
		  else if(un >10) 
			  
		  {
			  
			  
			  ola=un*16 +bo;
			   uber=un*8.76 +bu;
			   jug=un*10 +bj;
			   rap=un*0;
			   out.println("<a href=https://www.olacabs.com/>Ola will approximately charge</a>: "+ola+"Rs"+"<br>"); 
			   out.println("<a href=https://auth.uber.com/login/?breeze_local_zone=dca1&next_url=https%3A%2F%2Fm.uber.com%2F&state=FSO19kXTz1-Pl9PsLBxXwoKd1Ui5wYYOY5REcL85Zq0%3D>Uber will approximately charge: </a>"+uber+" Rs"+"<br>");
			   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+" Rs"+"<br>");
			   out.println("Currenty Rapido does not provide this service!"+"<br>");
			  
		  }
	   
   }
   else if(t==3)
   {
	   int bo=00;
		int bu=00;
		int bj=12;
		int br=10;
		 
		  
			   
			   jug=un*6 +bj;
			   rap=un*5+br;
			 if(jug<12)
			 {
				 jug=12;
				 out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+" Rs"+"<br>");
				 out.println("<a href=https://rapido.bike/>Rapdio will approximately charge: </a>"+rap+" Rs"+"<br>");
			 }
			 else  {
				   out.println("Currenty Ola does not provide this service!"+"<br>"); 
				   out.println("Currenty Uber does not provide this service!"+"<br>");
				   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+" Rs"+"<br>");
				   out.println("<a href=https://rapido.bike/>Rapdio will approximately charge: </a>"+rap+" Rs"+"<br>");
				   }
			   
			   
		 }
   else if(t==4)
   {
	   int bo=15;
	   int bu=5;
	   int bj=15;
	   ola=un*12+bo;
	   uber=un*20+bu;
	   jug=un*10+bj;
	   
	   out.println("<a href=https://www.olacabs.com/>Ola will approximately charge</a>: "+ola+" Rs"+"<br>"); 
	   out.println("<a href=https://auth.uber.com/login/?breeze_local_zone=dca1&next_url=https%3A%2F%2Fm.uber.com%2F&state=FSO19kXTz1-Pl9PsLBxXwoKd1Ui5wYYOY5REcL85Zq0%3D>Uber will approximately charge: </a>"+uber+" Rs "+"<br>");
	   out.println("<a href=https://www.jugnoo.in/>Jugnoo will approximately charge: </a>"+jug+" Rs"+"<br>");
	   out.println("Currenty Rapido does not provide this service!"+"<br>");
	   
	   
   }
		 
		 
	   
   }
   
   
 
 
 
   while(rs.next());
   
   
   
   
  
   }else{
   out.print("<h2>No Data Found</h2>");
   RequestDispatcher rd=request.getRequestDispatcher("welcome.jsp");
   rd.include(request,response);
   
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