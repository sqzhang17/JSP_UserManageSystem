<%@ page language="java" import="com.model.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<title>Insert title here</title>
</head>
<body bgcolor=pink>
	<h1>Welcome to the User Management System!</h1>
	<hr>
	<%
		//get error message
		String error = request.getParameter("err");
		out.println(new ErrorFunc().errorPrint(error));
	%>

	<form action="loginProcess.jsp" method="post">
		<table>
		<tr><td>User Name: </td> <td><input type="text" name="un"></td></tr>
		<tr><td>Password: </td> <td><input type="password" name="pw"></td></tr>
		</table>
		<input type="submit" value="Login">
		<input type="reset" value="Reset">
	</form>
	
	<br><br>
	<a>Author: Shiqi Zhang</a><br>
	<a>Date:&nbsp&nbsp&nbsp&nbsp 07/16/2015</a>
</body>
</html>