package service;

import dao.UserDao;

public class LoginService {
		UserDao dao;

		public LoginService(UserDao dao) {
			this.dao = dao;
		}

		public LoginService() {

		}
		
		public int loginUser(String id, String pw) {
			int result = dao.login(id, pw);
			return result;
			
		}
		
		
		
}
