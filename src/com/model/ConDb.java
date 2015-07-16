//This is a connection class, will generate connection to mysql database
package com.model;

import java.sql.*;

public class ConDb {
	private Connection con=null;
	
	public Connection getConnection(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/logindb", "root", "root");
		}catch(Exception e){
			e.printStackTrace();
		}
		return con;
	}
}
