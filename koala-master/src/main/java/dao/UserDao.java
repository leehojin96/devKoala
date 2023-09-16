package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dto.UserDTO;
import dto.UserLogDto;
import dto.UserMypageDto;

@Component
public class UserDao {

	@Autowired
	DataSource ds;

	//로그인
	public int login(String id, String pw) {
		String sql = "select userPassword from tbl_user2 where userID=?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		System.out.println("id : " + id + " pw : " + pw);
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();

			if (rs.next()) {
				if (rs.getString(1).equals(pw)) {
					return 1;
				} else {
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

	//로그인로그
	public void loginLog(String id) {

		logFormat();

		String sql = "insert into tbl_login_log values(?,sysdate)";
		Connection con = null;
		PreparedStatement pst = null;

		try {
			con = ds.getConnection();
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

	//로그인포맷
	public void logFormat() {
		String sql = "ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI'";
		Connection con = null;
		PreparedStatement pst = null;

		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.executeUpdate();

			pst.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//회원가입
	public Boolean join(UserDTO userDTO) {
		StringBuilder sql = new StringBuilder();
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection(); // DB 연결 시도

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
	
	//회원 탈퇴
	public void deleteUser(UserDTO userDTO) {
		String sql = " DELETE FROM tbl_user2 WHERE userID = ? AND userPassword = ?";
		Connection con = null;
		PreparedStatement pst = null;
		try {
			
			con = ds.getConnection();
			pst = con.prepareStatement(sql);

			pst = con.prepareStatement(sql);
			pst.setString(1, userDTO.getUserID());
			pst.setString(2, userDTO.getUserPassword());

			pst.executeUpdate();
			
			pst.close();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

	//유저 정보 조회
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
	
	//휴대폰 번호 변경
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
	
	//이메일 변경
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
	
	//로그인 로그 조회
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
	
	//비밀번호 변경
	public void pwChange(String npw, String id) {
		String sql="update tbl_user2 set userPassword=? where userID=? ";
		 Connection con = null;
		 PreparedStatement pst = null;

		 
		 try {
			con=ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, npw);
			pst.setString(2, id);
			
			pst.executeUpdate();
			
			pst.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
}
