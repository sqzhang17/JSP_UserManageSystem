
<!-- Header -->
<%@ page language="java" import="java.util.*, java.sql.*, com.model.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!-- Model -->
<%
	//get user name
	String grade = request.getParameter("grade");
	String uname = request.getParameter("uname"); 
	
	//declare primitive parameters
	int currPage = PagingFunc.getCurrPage(request.getParameter("currPage"));
	int pageSize = 3;
	int rowCount=0;
	int linkDisplayCount=3;
	int pageCount=0;
	int columnCount=0;
			
	//declare reference variable 
	UserBeanProcess ubp = new UserBeanProcess();
	ArrayList<UserBean> al = new ArrayList<UserBean>();
	ResTbFunc rtf = new ResTbFunc();
	PagingFunc pf = new PagingFunc();
	LinkFunc lf = new LinkFunc();
	
	//execute query for current page content and store it into arraylist
	al = ubp.dispCurrContent(currPage, pageSize);
			
	//calculate row count
	rowCount = ubp.getRowCount();
	
	//calculte page count
	pageCount = pf.calculatePageCount(rowCount,pageSize);
%>
	
<!-- View -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Insert title here</title>
	</head>
	<body bgcolor=pink>
		<h1>Login Success!</h1><hr>
		
		Welcome, <%=uname %>.<br>
		<!-- result table -->
		<table border="1px solid blue" align="center">
			<tbody>
				<!-- display headers -->
				<% out.println(rtf.dispHeader(grade)); %>
				
				<!-- display content -->
				<% out.println(rtf.dispContent(grade, al));%>
			</tbody>
		</table>
		
		<!-- links -->
		<div align="center">
			<!-- set "previous" link-->
			<%out.println(lf.printPrevLink(currPage, uname, grade));%>
	
			<!-- set current pages link-->
			<%out.println(lf.printCurrLinks(linkDisplayCount, currPage, pageCount, uname, grade));%>
		
			<!-- set "next" link -->
			<%out.println(lf.printNextLink(currPage, uname, grade, pageCount));%>
		</div>
		<br>
		
		<!-- return to login page -->
		<a href="login.jsp">Return to login page.</a>
	</body>
</html>