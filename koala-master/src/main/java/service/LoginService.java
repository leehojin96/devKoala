package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;

public class LoginService {

	@Autowired
	UserDao dao;

	public int loginUser(String id, String pw) {
		int result = dao.login(id, pw);
		return result;

	}

}
