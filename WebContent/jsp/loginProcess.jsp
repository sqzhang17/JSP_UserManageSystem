<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%	
	//get username, password
	String uname = request.getParameter("un");
	String pw = request.getParameter("pw");

	Connection con = null;
	PreparedStatement psm = null;
	String query = null;
	ResultSet rs = null;
	
	//build connection
	try{
		//get driver
		Class.forName("com.mysql.jdbc.Driver");
		//get connection
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb","root","root");
	}catch(Exception e){
		e.printStackTrace();
	}
	
	//prepare query statement
	query = "select username, password, grade from Users where username=?";
	psm = con.prepareStatement(query);
	psm.setString(1,uname);
	
	//execute query
	rs = psm.executeQuery();
	
	//user authorization check
	if(rs.next()){//rs is not empty
		if(rs.getString("password").equals(pw)){//correct password
			response.sendRedirect("loginSuccess.jsp?uname="+uname+"&grade="+rs.getString("grade"));
		}else{
			response.sendRedirect("login.jsp?err=wrongPassword");
		}
	}else{//rs is empty 
		response.sendRedirect("login.jsp?err=userNotExists");
	}
%>
