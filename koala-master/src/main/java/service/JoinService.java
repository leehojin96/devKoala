package service;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;
import dto.UserDTO;

public class JoinService {
	
	@Autowired
	UserDao userDao;
	
	public Map<String, Object> join(UserDTO userDTO) { // dto받음  ,
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		if (userDao.verifyUserID(userDTO.getUserID()).equals("1")) { // 1 : db에 데이터존재 0:데이터유효라고 명시해줌
			map.put("status", false); //"status", false :실패 , "status값",true:성공
			map.put("message", "중복된 아이디입니다.");
		}
		//else if (userDAO.verifyUserEmail(userDTO) == 1) {
			//map.put("status", false);
			//map.put("message", "중복된 이메일입니다.");
		//} 
		else if (userDao.verifyUserPhoneNumber(userDTO) == 1) {
			map.put("status", false);
			map.put("message", "중복된 전화번호입니다.");
		} else {
			if (userDao.join(userDTO)) {
				map.put("status", true);
				map.put("message", "확인되었습니다.");
			} else {
				map.put("status", false);
				map.put("message", "회원가입 중 오류가 발생했습니다.");
			}
		}
		
		return map; 
	}
	
	public int randomSix() {
		Random random = new Random();
		return new Integer(random.nextInt(888888)+111111); 
	}
	
	public int joinMailService(String userEmail) {
		
		//인증번호 생성
		int checkNum = randomSix();
		
		//유저메일에 인증번호 보내기
		userDao.joinMailSend(checkNum, userEmail);
		
		//인증번호 ajax로 값넘겨주기
		return checkNum;
		
	}
}
