package com.acorn.koala.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.acorn.koala.dao.UserJoinDAO;
import com.acorn.koala.dto.UserDTO;

@Service("userService")
public class UserService {
	@Autowired
	UserJoinDAO userDAO;
	
	public Map<String, Object> join(UserDTO userDTO) { // dto받음  ,
		Map<String, Object> map = new HashMap<String, Object>(); 
		
		if (userDAO.verifyUserID(userDTO) == 1) { // 1 : db에 데이터존재 0:데이터유효라고 명시해줌
			map.put("status", false); //"status", false :실패 , "status값",true:성공
			map.put("message", "중복된 아이디입니다.");
		}
		//else if (userDAO.verifyUserEmail(userDTO) == 1) {
			//map.put("status", false);
			//map.put("message", "중복된 이메일입니다.");
		//} 
		else if (userDAO.verifyUserPhoneNumber(userDTO) == 1) {
			map.put("status", false);
			map.put("message", "중복된 전화번호입니다.");
		} else {
			if (userDAO.join(userDTO)) {
				map.put("status", true);
				map.put("message", "확인되었습니다.");
			} else {
				map.put("status", false);
				map.put("message", "회원가입 중 오류가 발생했습니다.");
			}
		}
		
		return map; 
	}
	
	public Boolean verifyUserID(String userID) {
		Boolean result = false;
		if("1".equals(userDAO.verifyUserID(userID))) {
			result = true;
		}
		return result;
	} //아이디 중복체크버튼 
	
	
	public Boolean verifyUserPassword(UserDTO userDTO) {
		Boolean result = false;
		if("1".equals(userDAO.verifyUserPassword(userDTO))) {
			userDAO.deleteUser(userDTO);
			result = true;
		}
		return result;
				
	}

	public UserDTO list(String userID) {
		
		UserDTO resultUser = new UserDTO();
	
		resultUser = userDAO.listUser(userID);
		//다오에서 쿼리실행결과를 받아주는구문 
		
		return resultUser; //되롤려줌 컨트롤러로
		
	}

	



}
