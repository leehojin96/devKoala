package com.acorn.koala.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.acorn.koala.dto.UserLogDto;
import com.acorn.koala.dto.UserMypageDto;

@Component
public class MyPageDao {
	 @Autowired
	  DataSource ds;
	 
	 
	 public UserMypageDto mypageinfo(String id){
		 String sql="select userID, userName,  replace(substr(email,1,instr(email,'@')-1),substr(substr(email,1,instr(email,'@')-1),3,20),'******') || substr(email,instr(email,'@'),1) ||replace(substr(email,instr(email,'@')+1,50),substr(substr(email,instr(email,'@')+1,50),2,20),'*******'),email,  substr(phoneNumber,1,3)||'-'||replace(substr(phoneNumber,4,4),substr(phoneNumber,5,3),'***')||'-'||replace(substr(phoneNumber,8,4),substr(phoneNumber,9,3),'***'),phoneNumber, addr1, addr2, addr3 from tbl_user2 where userID=?";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 UserMypageDto user = null;
		 try {
				con=ds.getConnection();
				pst=con.prepareStatement(sql);
				pst.setString(1, id);
				rs=pst.executeQuery();
				
				if(rs.next()) {
					String userID = rs.getString(1); 
					String userName = rs.getString(2); 
					String rpemail = rs.getString(3); 
					String email = rs.getString(4);
					String rpphoneNumber = rs.getString(5); 
					String phoneNumber = rs.getString(6);
					String addr1 = rs.getString(7); 
					String addr2 = rs.getString(8); 
					String addr3 = rs.getString(9); 
					
					
					
					user = new UserMypageDto();
					
					user.setUserID(userID);
					user.setUserName(userName);
					user.setRpemail(rpemail);
					user.setEmail(email);
					user.setRpphoneNumber(rpphoneNumber);
					user.setPhoneNumber(phoneNumber);
					user.setAddr1(addr1);
					user.setAddr2(addr2);
					user.setAddr3(addr3);
					
					rs.close();
					pst.close();
					con.close();
					
				}
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
		 
	 }
	 
	 
	 
	 public int phonecheck(String newphone) {
		 String sql="select * from tbl_user2 where phoneNumber=?";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 
		 try {
			con=ds.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, newphone);
			rs=pst.executeQuery();
			
			if(rs.next()) {
				return 1;
			} else {
				return 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		 return 0;
		 
	 }
	 
	 
	 
	 
	 public void changePhone(String phone, String newphone) {
			String sql="update tbl_user2 set phoneNumber=? where phoneNumber=? ";
			 Connection con = null;
			 PreparedStatement pst = null;

			 
			 try {
				con=ds.getConnection();
				pst = con.prepareStatement(sql);
				pst.setString(1, newphone);
				pst.setString(2, phone);
				
				pst.executeUpdate();
				
				pst.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
	 public void changeEmail(String newemail, String u_id) {
			String sql="update tbl_user2 set email=? where userID=? ";
			 Connection con = null;
			 PreparedStatement pst = null;

			 
			 try {
				con=ds.getConnection();
				pst = con.prepareStatement(sql);
				pst.setString(1, newemail);
				pst.setString(2, u_id);
				
				pst.executeUpdate();
				
				pst.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	 
	 
	 
	 
	 
	 
	 
	 
	 public ArrayList<UserLogDto> LogView(String id) {
		 ArrayList<UserLogDto> list = new ArrayList<UserLogDto>();
		 
		 String sql="select * from tbl_login_log where userId=? order by time desc";
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 UserLogDto userlog = null;
		 
		 try {
			con=ds.getConnection();
			pst=con.prepareStatement(sql);
			pst.setString(1, id);
			rs=pst.executeQuery();
			
			while(rs.next()) {
				String userid = rs.getString(1);
				String time = rs.getString(2);
				
				userlog= new UserLogDto(userid,time);
				
				list.add(userlog);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		 
		return list;
		 
	 }
	 
	 


}
