package com.acorn.koala.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDao {
	 @Autowired
	  DataSource ds;
	 
	 
	 public int login(String id, String pw){
		 String sql="select userPassword from tbl_user2 where userID=?";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 System.out.println("id : "+id+" pw : "+pw);
		 try {
			 con=ds.getConnection();
			 pst = con.prepareStatement(sql);
			 pst.setString(1, id);
			 rs=pst.executeQuery();

			 if(rs.next()) {
				 if(rs.getString(1).equals(pw)) {
						return 1;
					}else {
						return 0;
					}
				}
				return -1;
			 
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
		return -2;
		 
	 }
	 
	 public void loginLog(String id) {
		 
		 logFormat();
		 
		 String sql="insert into tbl_login_log values(?,sysdate)";
		 Connection con = null;
		 PreparedStatement pst = null;

		 
		 try {
			con=ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.executeUpdate();
			
			pst.close();
			con.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
	 }
	
	public void logFormat() {
		 String sql="ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI'";
		 Connection con = null;
		 PreparedStatement pst = null;
		 
		 try {
			con=ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.executeUpdate();
			
			pst.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	 

}
