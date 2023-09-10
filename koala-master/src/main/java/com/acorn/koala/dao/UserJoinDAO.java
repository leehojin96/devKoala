package com.acorn.koala.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.acorn.koala.dto.UserDTO;





@Repository("userDAO")
public class UserJoinDAO {
	
	@Autowired
	DataSource ds;
	
	@Autowired
    private SqlSession session;
	private static String namespace = "com.acorn.userJoin.Mapper."; //구분하기위한네임스페이스로 실제존재안하고 보통자신의페키지명씀
	
	private final String driver = "oracle.jdbc.driver.OracleDriver";
	private final String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String user = "System";
	private final String password = "1234";
	
	
	public Boolean join(UserDTO userDTO) {
		StringBuilder sql = new StringBuilder();
		 Connection con = null;
		 PreparedStatement pst = null;
		 ResultSet rs = null;
		 
		try {
			con=ds.getConnection();	//DB 연결 시도

			sql.append("INSERT INTO tbl_user2");
			sql.append("	(userID, userPassword, userName, email, phoneNumber, birth, addr1, addr2, addr3)");
			sql.append("	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			pst = con.prepareStatement(sql.toString());
			pst.setString(1, userDTO.getUserID());
			pst.setString(2, userDTO.getUserPassword());
			pst.setString(3, userDTO.getUserName());
			pst.setString(4, userDTO.getEmail());
			pst.setString(5, userDTO.getPhoneNumber());
			pst.setString(6, userDTO.getBirth());
			pst.setString(7, userDTO.getAddr1());
			pst.setString(8, userDTO.getAddr2());
			pst.setString(9, userDTO.getAddr3());
			
			int count = pst.executeUpdate();
			return count == 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
	}
	

	public int verifyUserID(UserDTO userDTO) {
		/*
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(userID) userID FROM tbl_user2");
			sql.append("	WHERE userID = ?");
			
			PreparedStatement pst = con.prepareStatement(sql.toString());
			pst.setString(1, userDTO.getUserID());
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				if (rs.getInt("userID") > 0) {
					return 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		return session.selectOne(namespace+"selectUserCount", userDTO.getUserID());
	}
	
	public int verifyUserEmail(UserDTO userDTO) {
		return  session.selectOne(namespace+"selectUserEmailCount" , userDTO.getEmail());
		/*
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);

			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(email) email FROM tbl_user2");
			sql.append("	WHERE email = ?");
			
			PreparedStatement pst = con.prepareStatement(sql.toString());
			pst.setString(1, userDTO.getEmail());
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				if (rs.getInt("email") > 0) {
					return 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		*/
		
	}
	
	public int verifyUserPhoneNumber(UserDTO userDTO) {
		try {
			Class.forName(driver);
			//DB 연결을 시도만 한다
			Connection con = DriverManager.getConnection(url, user, password);

			//쿼리를 입력만 한다.
			StringBuilder sql = new StringBuilder();
			sql.append("SELECT COUNT(phoneNumber) phoneNumber FROM tbl_user2");
			sql.append("	WHERE phoneNumber = ?");
			
			//입력된 쿼리에 변수(파라미터) ex} where phonumber = ? 물음표를 폰넘버 값으로 바꿔준다.
			PreparedStatement pst = con.prepareStatement(sql.toString());
			pst.setString(1, userDTO.getPhoneNumber());
			
			//쿼리를 실행하고 그 결과를 변수에 담아준다.
			ResultSet rs = pst.executeQuery();
			
			//결과값에 따라 성공 및 실패를 판다할 값을 처리한다.
			while (rs.next()) {
				if (rs.getInt("phoneNumber") > 0) {
					return 1;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public String verifyUserID(String userID) {
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			
			String sql = "SELECT COUNT(userID) count FROM tbl_user2 WHERE userID = ?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, userID);
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				return rs.getString("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	public String verifyUserPassword(UserDTO userDTO) {
		try {
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			
			String sql = "SELECT COUNT(userID) count FROM tbl_user2 WHERE userID = ? AND userPassword = ?";
			
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, userDTO.getUserID());
			pst.setString(2, userDTO.getUserPassword());
			
			ResultSet rs = pst.executeQuery();
			
			while (rs.next()) {
				System.out.println(rs.getString("count"));
				return rs.getString("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "";
	}
	
	
 
	public void deleteUser(UserDTO userDTO) {
		Connection con = null;
		PreparedStatement pst =null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			String sql = " DELETE FROM tbl_user2 WHERE userID = ? AND userPassword = ?";
			pst = con.prepareStatement(sql);
			pst.setString(1, userDTO.getUserID());
			pst.setString(2, userDTO.getUserPassword());
			
			pst.executeUpdate();
			
		}  catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				pst.close();
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		}
	}
	
	public UserDTO listUser(String userID) {
		System.out.println("DAO-서비스에서 listUser 호출해서 도착");
		UserDTO user1= null;
		try {
			
			Class.forName(driver);
			Connection con = DriverManager.getConnection(url, user, password);
			
			String sql = " SELECT userID, userName, email, phoneNumber FROM tbl_user2 WHERE userID = ? ";
			
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1, userID);
				
			ResultSet rs = pst.executeQuery();
			
			
			if(rs.next()) {
				
				// 객체생성한 후 setter 
				user1 = new UserDTO();
				user1.setUserID(rs.getString("userID"));
				user1.setUserName(rs.getString("userName"));
				user1.setEmail(rs.getString("email"));
				user1.setPhoneNumber(rs.getString("phoneNumber"));				
				//System.out.println("userName");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
				return user1;
	}
}