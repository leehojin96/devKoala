package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import dto.UserDto;
import dto.UserLogDto;
import dto.UserMypageDto;

public class UserDao {

	@Autowired
	DataSource ds;

	@Autowired
	JavaMailSender javaMailSender;

	// 로그인
	public String login(String id) {
		String sql = "select userPassword from user_tbl where userID=?";

		try (Connection con = ds.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			pst.setString(1, id);
			try (ResultSet rs = pst.executeQuery();) {
				if (rs.next()) {
					return rs.getString(1);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;

	}

	// 로그인로그
	public void loginLog(String id) {

		logFormat();

		String sql = "insert into tbl_login_log values(?,sysdate)";

		try (Connection con = ds.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			pst.setString(1, id);
			pst.execute();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 로그인포맷
	public void logFormat() {
		String sql = "ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI'";

		try (Connection con = ds.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {

			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 회원가입
	public Boolean join(UserDto userDto) {
		StringBuilder sql = new StringBuilder();
		Connection con = null;
		PreparedStatement pst = null;
//		ResultSet rs = null;

		try {
			con = ds.getConnection(); // DB 연결 시도

			sql.append("INSERT INTO user_tbl");
			sql.append("	(userID, userPassword, userName, email, phoneNumber, birth, addr1, addr2, addr3)");
			sql.append("	VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");

			pst = con.prepareStatement(sql.toString());
			pst.setString(1, userDto.getUserID());
			pst.setString(2, userDto.getUserPassword());
			pst.setString(3, userDto.getUserName());
			pst.setString(4, userDto.getEmail());
			pst.setString(5, userDto.getPhoneNumber());
			pst.setString(6, userDto.getBirth());
			pst.setString(7, userDto.getAddr1());
			pst.setString(8, userDto.getAddr2());
			pst.setString(9, userDto.getAddr3());

			int count = pst.executeUpdate();
			return count == 1;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return false;
	}

	// 회원 탈퇴
	public void deleteUser(UserDto userDto) {
		String sql = " DELETE FROM user_tbl WHERE userID = ? AND userPassword = ?";
		Connection con = null;
		PreparedStatement pst = null;
		try {

			con = ds.getConnection();
			pst = con.prepareStatement(sql);

			pst = con.prepareStatement(sql);
			pst.setString(1, userDto.getUserID());
			pst.setString(2, userDto.getUserPassword());

			pst.executeUpdate();

			pst.close();
			con.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	// 유저 정보 조회
	public UserMypageDto mypageinfo(String id) {
		String sql = "select userID, userName,  replace(substr(email,1,instr(email,'@')-1),substr(substr(email,1,instr(email,'@')-1),3,20),'******') || substr(email,instr(email,'@'),1) ||replace(substr(email,instr(email,'@')+1,50),substr(substr(email,instr(email,'@')+1,50),2,20),'*******'),email,  substr(phoneNumber,1,3)||'-'||replace(substr(phoneNumber,4,4),substr(phoneNumber,5,3),'***')||'-'||replace(substr(phoneNumber,8,4),substr(phoneNumber,9,3),'***'),phoneNumber, addr1, addr2, addr3 from user_tbl where userID=?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		UserMypageDto user = null;
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();

			if (rs.next()) {
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

	// 휴대폰 번호 변경
	public void changePhone(String phone, String newphone) {
		String sql = "update user_tbl set phoneNumber=? where phoneNumber=? ";
		Connection con = null;
		PreparedStatement pst = null;

		try {
			con = ds.getConnection();
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

	// 이메일 변경
	public void changeEmail(String newemail, String u_id) {
		String sql = "update user_tbl set email=? where userID=? ";
		Connection con = null;
		PreparedStatement pst = null;

		try {
			con = ds.getConnection();
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

	// 로그인 로그 조회
	public ArrayList<UserLogDto> LogView(String id) {
		ArrayList<UserLogDto> list = new ArrayList<UserLogDto>();

		String sql = "select * from tbl_login_log where userId=? order by time desc";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		UserLogDto userlog = null;

		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();

			while (rs.next()) {
				String userid = rs.getString(1);
				String time = rs.getString(2);

				userlog = new UserLogDto(userid, time);

				list.add(userlog);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;

	}

	// 비밀번호 변경
	public void pwChange(String npw, String id) {
		String sql = "update user_tbl set userPassword=? where userID=? ";
		Connection con = null;
		PreparedStatement pst = null;

		try {
			con = ds.getConnection();
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

	// 아이디 찾기
	public String idFind(String name, String date, String email, String phone) {
		String sql = "select replace(userID,substr(userID,5,20),'****') from user_tbl where userName=? and birth=? and email=? and phoneNumber=?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, name);
			pst.setString(2, date);
			pst.setString(3, email);
			pst.setString(4, phone);
			rs = pst.executeQuery();

			if (rs.next()) {
				String userid = rs.getString(1);
				return userid;

			} else {
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

	// 비밀번호 찾기
	public String pwFind(String id, String name, String date, String email, String phone) {
		String sql = "select userPassword from user_tbl where userID=? and userName=? and birth=? and email=? and phoneNumber=?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.setString(2, name);
			pst.setString(3, date);
			pst.setString(4, email);
			pst.setString(5, phone);
			rs = pst.executeQuery();

			if (rs.next()) {
				String userpw = rs.getString(1);
				return userpw;
			} else {
				return null;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;

	}

	// 아래로는 정리해야할 메소드들

	public int verifyUserPhoneNumber(UserDto userDto) {
		String sql = "SELECT COUNT(phoneNumber) phoneNumber FROM user_tbl WHERE phoneNumber = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userDto.getPhoneNumber());

			rs = pst.executeQuery();

			if (rs.next()) {
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
		String sql = "SELECT COUNT(userID) count FROM user_tbl WHERE userID = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userID);
			rs = pst.executeQuery();

			if (rs.next()) {
				System.out.println(rs.getString("count"));
				return rs.getString("count");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	public String verifyUserPassword(UserDto userDto) {
		String sql = "SELECT COUNT(userID) count FROM user_tbl WHERE userID = ? AND userPassword = ?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {

			con = ds.getConnection();
			pst = con.prepareStatement(sql);

			pst.setString(1, userDto.getUserID());
			pst.setString(2, userDto.getUserPassword());

			rs = pst.executeQuery();

			while (rs.next()) {
				System.out.println(rs.getString("count"));
				return rs.getString("count");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "";
	}

	public int phonecheck(String newphone) {
		String sql = "select * from user_tbl where phoneNumber=?";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, newphone);
			rs = pst.executeQuery();

			if (rs.next()) {
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

	public UserDto listUser(String userID) {
		System.out.println("DAO-서비스에서 listUser 호출해서 도착");
		UserDto user1 = null;
		String sql = " SELECT userID, userName, email, phoneNumber FROM user_tbl WHERE userID = ? ";
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			pst.setString(1, userID);

			rs = pst.executeQuery();

			if (rs.next()) {

				// 객체생성한 후 setter
				user1 = new UserDto();
				user1.setUserID(rs.getString("userID"));
				user1.setUserName(rs.getString("userName"));
				user1.setEmail(rs.getString("email"));
				user1.setPhoneNumber(rs.getString("phoneNumber"));
				// System.out.println("userName");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return user1;
	}

	// 이메일 인증
	public void joinMailSend(int checkNum, String userEmail) {

		MimeMessage message = javaMailSender.createMimeMessage();
		String title = "코알라북 회원가입 인증 이메일 입니다.";
		String content = "KOALA BOOK 회원가입을 축하합니다!!" + "<br>" + "<br>" + "인증 번호는 " + checkNum + "입니다." + "<br>" + "<br>"
				+ "회원가입 인증을 완료해주세요!";

		try {
			message.setFrom("st2035@naver.com");
			message.setRecipients(MimeMessage.RecipientType.TO, userEmail);
			message.setSubject(title);
			message.setText(content, "UTF-8", "html");
			javaMailSender.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}

	public String getUserIdByKakaoAuth(int kakaoAuth) throws Exception {
		String sql = "select userID from user_tbl where kakaoAuth=?";
		try (Connection conn = ds.getConnection(); PreparedStatement pst = conn.prepareStatement(sql)) {
			pst.setInt(1, kakaoAuth);
			try (ResultSet rs = pst.executeQuery();) {
				String userId = null;
				int rowCount = 0;
				while (rs.next()) {
					userId = rs.getString(1);
					rowCount++;
				}
				if (rowCount > 1) {
					// user_tbl에 kakaoAuth로 일치하는 유저 2개 이상
//					return null;
					throw new Exception("카카오에 연동되는 유저 2개 이상");
				}
				// user_tbl에 kakaoAuth로 일치하는 userId 리턴 / 없으면 null 리턴
				return userId;

			}
		} 

	}

	public void insertKakaoUser(String email, String userName) throws Exception {
		String sql = "insert into kakao_tbl(kakaoAuth,email,userName) values(kakao_sequence.nextval,?,?)";

		try (Connection con = ds.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			pst.setString(1, email);
			pst.setString(2, userName);
			pst.executeUpdate();

		}

	}

	public int getKakaoAuthByEmail(String email) {

		String sql = "select auth from kakao_tbl where email=?";
		try (Connection con = ds.getConnection(); PreparedStatement pst = con.prepareStatement(sql);) {
			pst.setString(1, email);
			try (ResultSet rs = pst.executeQuery();) {
				int auth = 0;
				int rowCount = 0;

				while (rs.next()) {
					auth = rs.getInt(1);
					rowCount++;
				}

				if (rowCount > 1) {
					// kakao_tbl에 email로 일치하는 유저가 2개 이상
					return -2;
				}
				// kakao_tbl에 email로 일치하는 유저 auth 리턴 / 없을때는 0리턴
				return auth;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}
	}

}
