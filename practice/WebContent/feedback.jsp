<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Feedback</title>

<script>
function go() {
window.location.replace("logout.jsp",'window','toolbar=3,location=3,directories=3,status=3,menubar=3,scrollbars=3,resizable=3');
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
  max-heigth: 700px;
  max-width: 500px;
  padding: 26px;
  background-color: yellow;
}


input[type=text], input[type=password], input[type=number]{
  width: 100%;
  padding: 24px;
  margin: 5px 0 22px 0;
  border: none;
  background: #f1f1f1;
}

input[type=text]:focus, input[type=password]:focus input[type=number]:focus{
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

<div class="topnav">
  <a href="http://localhost:8080/practice/welcome.jsp">RideNow</a>
 
  <a href="http://localhost:8080/practice/feedback.jsp">Feedback</a>
  <a href="http://localhost:8080/practice/rewive.jsp">all reviews</a>
</div>

<div class="bg-img"> 
<form action="feedback" class="container">

 <label for="First Name"><b>First Name</b></label>
    <input type="text" placeholder="Enter First Name" name="First_Name" required>

    <label for="Last Name"><b>Last Name</b></label>
    <input type="text" placeholder="Enter Last Name" name="Last_Name" required>

<label for="Mobile Number"><b>Contact Number</b></label>
    <input type="number"  placeholder="Enter Contact Number" name="Contact_Number" required>
<label for="Subject"><b> Subject</b></label>
    <input type="text" placeholder="Enter Subject" name="Subject" required>


    <button type="submit" class="btn">Sumbit </button>
   






</form>





</div>



</body>
</html>