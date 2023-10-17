package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;

public class LoginService {

	@Autowired
	UserDao dao;

	public int loginUser(String id, String pw) {

		String result = dao.login(id);
		
		if (result == null) {
			// 존재하지 않는 아이디
			return -1;
		}
		if (result.equals(pw)) {
			dao.loginLog(id);
			return 1;
		} else {
			return 0;
		}

	}

}
