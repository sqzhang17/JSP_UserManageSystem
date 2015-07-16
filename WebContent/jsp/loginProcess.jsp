<%@ page language="java" import="java.util.*, java.sql.*, com.model.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%	
	//get username, password
	String uname = request.getParameter("un");
	String pw = request.getParameter("pw");

	UserBeanProcess ubp = new UserBeanProcess();
	String ubpRes = ubp.userCheck(uname, pw);
	
	if(ubpRes.equals("success")){
		int grade = ubp.getGrade(uname);
		response.sendRedirect("loginSuccess.jsp?uname="+uname+"&grade="+grade);
	}else if(ubpRes.equals("wrongPassword")){
		response.sendRedirect("login.jsp?err=wrongPassword");
	}else if(ubpRes.equals("userNotExit")){
		response.sendRedirect("login.jsp?err=userNotExists");	
	}
	
	
%>
