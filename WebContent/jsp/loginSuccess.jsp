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
		//declare parameters for connection and query
		Connection con = null;
		PreparedStatement pagingPsm = null;
		String pagingQuery = null;
		ResultSet pagingRs = null;
		
		//build connection
		try{
			//get driver
			Class.forName("com.mysql.jdbc.Driver");
			//get connection
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb","root","root");
		}catch(Exception e){
			e.printStackTrace();
		}
		
		//declare paging parameters
		int currPage = request.getParameter("currPage")==null?1:Integer.parseInt(request.getParameter("currPage"));
		int pageSize = 5;
		int rowCount=0;
		int pageCount=0;
		
		//develop query for paging
		pagingQuery = "select userid, username, email, grade, password from users where userid limit ?, ?";
		pagingPsm = con.prepareStatement(pagingQuery);
		pagingPsm.setInt(1, (currPage-1)*pageSize);
		pagingPsm.setInt(2, pageSize);
		
		//execute paging query
		pagingRs = pagingPsm.executeQuery();
		
		// get number of column fro paging query
		ResultSetMetaData rsmd = pagingRs.getMetaData();
		int columnCount = rsmd.getColumnCount();
		
		//develop query for total count, rcQuery -> row count query 
		String rcQuery ="select count(*) from users";
		PreparedStatement rcqPsm = con.prepareStatement(rcQuery);
		
		//execute query for total count 
		ResultSet rcRs = rcqPsm.executeQuery();
		
		//get row count 
		if(rcRs.next()) rowCount = Integer.parseInt(rcRs.getString(1));
		
		//calculte page count
		pageCount = rowCount%pageSize==0?(rowCount/pageSize):(rowCount/pageSize+1);
				
	%>
	
	<table border="1px solid blue" align="center">
		<tbody>
			<tr>
				<th>UserID</th><th>Username</th><th>Email</th><th>Grade</th>
				<% if(grade.equals("1")){%>
					<th>Password</th><th>Update</th><th>Delete</th>
				<% } %>
			</tr>
			
			<%while(pagingRs.next()){%>	
			<tr>
				<% for(int i=1;i<=columnCount-1;i++){%>
					<td><%= pagingRs.getString(i)%></td>
				<% }%>
				
				<% if(grade.equals("1")){ %>
					<td><%=pagingRs.getString("password") %></td>
					<td><a href="???">Update</a></td>
					<td><a href="???">Delete</a></td>
				<% }%>
			</tr>
			<% }%>

		</tbody>
	</table>
	
	<!-- set previous link -->
	<div align="center">
	<%String href=null;
	if(currPage!=1){
		href = "loginSuccess.jsp?uname="+uname+"&grade="+grade+"&currPage="+(currPage-1);%>
		<a href=<%=href %>>previous</a>
	<%} %>

	<!-- set next 5 page link-->
	<%for(int i=0;i<5;i++){ 
		if(currPage+i<=pageCount){
			href="loginSuccess.jsp?uname="+uname+"&grade="+grade+"&currPage="+(currPage+i);%>
			<a href=<%=href %>><%if(i==0)%><mark><%=currPage+i %><%if(i==0)%></mark></a>
		<%}
	}%>
	
	<!-- set next link -->
	<%if(currPage!=pageCount){
		href="loginSuccess.jsp?uname="+uname+"&grade="+grade+"&currPage="+(currPage+1);%>
		<a href=<%=href %>>next</a>
	<%}%>
	</div>
	
	<!-- return to login page -->
	<br>
	<a href="login.jsp">Return to login page.</a>
</body>
</html>