package com.acorn.koala.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class FindDao {
	 @Autowired
	  DataSource ds;
	 
	 public String idFind(String name, String date, String email, String phone)  {
		 String sql="select replace(userID,substr(userID,5,20),'****') from tbl_user2 where userName=? and birth=? and email=? and phoneNumber=?";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 
		 try {
			con=ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, date);
			pst.setString(3, email);
			pst.setString(4, phone);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				String userid = rs.getString(1);
				return userid;
				
				
			}else {
				return null;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				pst.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		 
		 
		return null;
		 
	 }
	 
	 public String pwFind(String id, String name, String date, String email, String phone) {
		 String sql="select userPassword from tbl_user2 where userID=? and userName=? and birth=? and email=? and phoneNumber=?";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 
		 try {
			con=ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, name);
			pst.setString(3, date);
			pst.setString(4, email);
			pst.setString(5, phone);
			rs = pst.executeQuery();
			
			if(rs.next()) {
				String userpw = rs.getString(1);
				return userpw;
			}else {
				return null;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		return null;
		 
	 }
	 
	
}
