<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>
		<%
			//get data
			String uname = request.getParameter("un");
			String pw = request.getParameter("pw");
			
			if(uname.equals("shiqi") && pw.equals("123")){
				response.sendRedirect("loginSuccess.jsp?un="+uname);
			}else{
				response.sendRedirect("login.jsp");
			}
		%>
	</body>
</html>