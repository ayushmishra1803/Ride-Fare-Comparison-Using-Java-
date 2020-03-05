<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>welcome</title>
<script>
function go() {
window.location.replace("logout.jsp",'window','toolbar=1,location=1,directories=1,status=1,menubar=1,scrollbars=1,resizable=1');
self.close()
}
</script>


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
	heigth: 800px;
	width: 400px;
	padding: 26px;
	background-color: yellow;
	opacity: .855;
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
  <a href="http://localhost:8080/practice/welcome.jsp">Compare Now</a>
   <a href="http://localhost:8080/practice/logout.jsp">Logout</a>
   <!--  
  <a href="http://localhost:8080/practice/feedback.jsp">feedback </a>
 
  
  <a href="http://localhost:8080/practice/rewive.jsp">all reviews</a>
-->
</div>
<div class="bg-img">
  <form action= "pickup.jsp" class="container">
    <h3>Pickup Point
  <input list="pickup" name="pick">
  <datalist id="pickup">
    <option value="Rajiv Gandhi">
    <option value="Vishnupuri">
    <option value="Bhawarkua">
    <option value="Navlakha">
     <option value="Indira Pratima">
 <option value="G.P.O">
 
  <option value="Shivaji Vatika">
   <option value="Geeta Bhawan">
       <option value="Palasia">
     <option value="Industry House">
      <option value="Press Complex">
       <option value="MR-9">
        <option value="VIJAY NAGAR">
         <option value="MR-10">
  </datalist>
  </h3>
  <h3>Drop Point
   <input list="drop" name="drop">
  <datalist id="drop">
    <option value="Rajiv Gandhi">
    <option value="Vishnupuri">
    <option value="Bhawarkua">
    <option value="Navlakha">
     <option value="Indira Pratima">
 <option value="G.P.O">
  <option value="Shivaji Vatika">
   <option value="Geeta Bhawan">
       <option value="Palasia">
     <option value="Industry House">
      <option value="Press Complex">
       <option value="MR-9">
        <option value="VIJAY NAGAR">
         <option value="MR-10">
  </datalist></h3>
  
  

 
 <fieldset>
          <legend>Vehicle Type</legend>
          <p>
             <label>Vehicle Present </label>
             <select id = "myList" name="vehicle">
               <option value = "1">Mini</option>
               <option value = "2">Sedan</option>
               <option value = "3">Bike</option>
               <option value = "4">Auto</option>
             </select>
          </p>
       </fieldset>
 
 

  
    
    <button type="submit" class="btn">Compare Now</button>
</form>
</div>
</body>

</html>