<%@ page language="java" import="java.util.*, java.sql.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor=pink>
	<%//get user name
	String grade = request.getParameter("grade");
	String uname = request.getParameter("uname"); %>
	
	<h1>Login Success!</h1><hr>
	Welcome, <%=uname %>.<br>
	<%
		Connection con = null;
		PreparedStatement psm = null;
		String query = null;
		ResultSet rs = null;
		
		try{
			//get driver
			Class.forName("com.mysql.jdbc.Driver");
			//get connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb","root","root");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		query = "select * from users";
		psm = con.prepareStatement(query);
		rs = psm.executeQuery();
		ResultSetMetaData rsmd = rs.getMetaData();
		
		int columnCount = rsmd.getColumnCount();
	%>
	
	<table border="1px solid blue" align="center">
		<tbody>
			<tr>
				<th>UserID</th><th>Username</th><th>Password</th><th>Email</th><th>Grade</th>
				<% if(grade.equals("1")){%>
					<th>Update</th><th>Delete</th>
				<% } %>
			</tr>
			
			<%while(rs.next()){%>	
			<tr>
				<% for(int i=1;i<=columnCount;i++){%>
					<td><%= rs.getString(i)%></td>
				<% }%>
				
				<% if(grade.equals("1")){ %>
					<td><a href="???">Update</a></td>
					<td><a href="???">Delete</a></td>
				<% }%>
			</tr>
			<% }%>

		</tbody>
	</table>
	<br>
	<a href="login.jsp">Return to login page.</a>
</body>
</html>