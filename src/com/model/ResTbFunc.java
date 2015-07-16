// this java class contains functions for displaying the result on loginSuccess.jsp
package com.model;

import java.util.*;

public class ResTbFunc {
	StringBuilder sb;
	
	//display the header of the content
	public String dispHeader(String grade){
		sb = new StringBuilder();
		
		sb.append("<tr><th>UserID</th><th>Username</th><th>Email</th><th>Grade</th>");
		
		if(grade.equals("1")){
			sb.append("<th>Password</th><th>Update</th><th>Delete</th>");
		}
		
		sb.append("<tr>");
		
		return sb.toString();
	}
	
	
	//display the content (result) on loginSuccess.jsp
	public String dispContent(String grade, ArrayList<UserBean> al){
		sb = new StringBuilder();
		
		for(UserBean ub:al){
			sb.append("<tr><td>"+ub.getUserid()+"</td>");
			sb.append("<td>"+ub.getUsername()+"</td>");
			sb.append("<td>"+ub.getEmail()+"</td>");
			sb.append("<td>"+ub.getGrade()+"</td>");
			
			if(grade.equals("1")){
				sb.append("<td>Password</td><td>Update</td><td>Delete</td>");
			}
			sb.append("</tr>");
		}
		return sb.toString();
	}
	
}
