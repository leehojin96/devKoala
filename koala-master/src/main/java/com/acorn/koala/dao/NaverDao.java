package com.acorn.koala.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class NaverDao {
	 @Autowired
	  DataSource ds;
	 
	 
	 public int naveridCheck(String id) {
		 String sql="select * from koala_naver_tbl where id=?";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 
		 try {
			con=ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs=pst.executeQuery();
			
			if(rs.next()) {
				return 1;
			} else {
				return 0;
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
		return -1;
	 }
	 
	 public void NaverJoin(String id, String name, String email, String gender, String birthday, String birthyear, String mobile) {
		 String sql="insert into koala_naver_tbl values(?,?,?,?,?,?,?)";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 
		 try {
			con=ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, name);
			pst.setString(3, email);
			pst.setString(4, gender);
			pst.setString(5, birthday);
			pst.setString(6, birthyear);
			pst.setString(7, mobile);
			
			pst.executeUpdate();
			
			rs.close();
			pst.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	 }
}
