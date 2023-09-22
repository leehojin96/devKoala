package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;
import dto.UserDTO;

public class UserService {
	
	@Autowired
	UserDao userDao;
	
	
	public Boolean verifyUserID(String userID) {
		Boolean result = false;
		if("1".equals(userDao.verifyUserID(userID))) {
			result = true;
		}
		return result;
	} //아이디 중복체크버튼 
	
	
	public Boolean verifyUserPassword(UserDTO userDTO) {
		Boolean result = false;
		if("1".equals(userDao.verifyUserPassword(userDTO))) {
			userDao.deleteUser(userDTO);
			result = true;
		}
		return result;
				
	}

	public UserDTO list(String userID) {
		
		UserDTO resultUser = new UserDTO();
	
		resultUser = userDao.listUser(userID);
		//다오에서 쿼리실행결과를 받아주는구문 
		
		return resultUser; //되롤려줌 컨트롤러로
		
	}

	



}
