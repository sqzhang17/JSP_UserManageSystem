//This is a process class or bo (business object) class
//encapsulate operations to user table in logindb

package com.model;

import java.util.*;
import java.sql.*;

public class UserBeanProcess {
	private String query ;
	private PreparedStatement psm;
	private ResultSet rs;
	private Connection con;
	
	//check if is valid user when login 
	public String userCheck(String uname, String pw){	
		con = new ConDb().getConnection();
		//prepare query statement
		query = "select username, password, grade from users where username=?";
		String res=null;
		
		try {
			psm = con.prepareStatement(query);
			psm.setString(1,uname);
			//execute query
			rs = psm.executeQuery();
			
			//user authorization check
			if(rs.next()){//rs is not empty
				if(rs.getString("password").equals(pw)){//correct password
					res ="success";
				}else{
					res = "wrongPassword";
				}
			}else{//rs is empty 
				res = "userNotExit";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//close resource, this is important
			this.closeResource();
		}
		
		return res;
	}
	
	
	//get grade of the user
	public int getGrade(String uname){
		con = new ConDb().getConnection();
		//prepare query statement
		query = "select grade from users where username=?";
		int res=0;
		
		try {
			psm = con.prepareStatement(query);
			psm.setString(1,uname);
			//execute query
			rs = psm.executeQuery();
			
			if(rs.next()){//rs is not empty
				res = Integer.parseInt(rs.getString("grade"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			//close resource, this is important
			this.closeResource();
		}
		return res;
		
	}
	
	//get the row count of user table
	public int getRowCount(){
		int rowCount=0;
		//develop query for total count, rcQuery -> row count query 
		query ="select count(*) from users";
		try{
			con = new ConDb().getConnection();
			psm = con.prepareStatement(query);
					
			//execute query for total count 
			rs = psm.executeQuery();
			
			//get row count 
			if(rs.next()) rowCount = Integer.parseInt(rs.getString(1));
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeResource();
		}	
		return rowCount;
	}
	
	
	//display result on current page 
	public ArrayList<UserBean> dispCurrContent(int currPage, int pageSize){
		con=new ConDb().getConnection();
		
		ArrayList<UserBean> al = new ArrayList<UserBean>();
		
		query = "select userid, username, email, grade, password from users where userid limit ?, ?";
		
		try{
			psm = con.prepareStatement(query);
			psm.setInt(1, (currPage-1)*pageSize);
			psm.setInt(2, pageSize);
			
			rs = psm.executeQuery();
			
			while(rs.next()){
				UserBean ub = new UserBean();
				
				ub.setUsername(rs.getString("username"));
				ub.setEmail(rs.getString("email"));
				ub.setGrade(rs.getInt("grade"));
				ub.setPassword(rs.getString("password"));
				ub.setUserid(rs.getInt("userid"));
				
				al.add(ub);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			this.closeResource();
		}
		
		return al;
	}
	
	
	//method for close resource
	private void closeResource(){
		try {
			if(rs!=null){
				rs.close();
				rs=null;
			}
			
			if(psm!=null){
				psm.close();
				psm=null;
			}
			
			if(con!=null){
				con.close();
				con=null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
