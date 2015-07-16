//this is a java class to handle the error message in login page
package com.model;

public class ErrorFunc {
	StringBuilder res;
	public String errorPrint(String errMsg){
		res = new StringBuilder();
		
		if(errMsg==null) return "";
			
		if(errMsg.equals("wrongPassword")){
			res.append("Login fail: Wrong password.<br>");
		}else if(errMsg.equals("userNotExists")){
			res.append("Login fail: User not exists.<br>");
		}
		
		return res.toString();
	}
}
