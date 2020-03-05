<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Driver Page</title>
<style>
body, html {
	height: 100%;
	font-family: Arial, Helvetica, sans-serif;
}

.topnav {
	overflow: hidden;
	background-color: black;
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
	background-color: black;
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
	background-color: green;
	outline: none;
}

/* Set a style for the submit button */
.btn {
	background-color: black;;
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



<body>
<div class="topnav">
  <a href="http://localhost:8080/practice/welcome.jsp">Ride Now</a>
  
  <a href="http://localhost:8080/practice/feedback.jsp">feedback </a>
  <a href="javascript:go()">Logout</a>
  <a href="http://localhost:8080/practice/rewive.jsp">all reviews</a>
</div>


<div class="bg-img">
		<form action="confirm.jsp" class="container">
<body>

<form action="confirm.jsp">

 <h3>Vehicle Type
   <input list="vehicle" name="vehicle">
  <datalist id="vehicle">
    <option value="car">
    <option value="scooty">
    <option value="bike">
    <option value="van">
       </datalist></h3>
   <h3>No. of Seat
   <input list="seat" name="seat">
  <datalist id="seat">
    <option value="1">
    <option value="2">
    <option value="3">
    <option value="4">
     <option value="5">
 <option value="6">
  <option value="7">
  
  </datalist></h3>
   <input type = "submit" value = "Submit" />
  </form>
 




</body>
</html>