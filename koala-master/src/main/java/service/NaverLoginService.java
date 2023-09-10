package service;

import dao.NaverDao;

public class NaverLoginService {
	NaverDao dao;

	public NaverLoginService(NaverDao dao) {;
		this.dao = dao;
	}
	

	public int naverCheck(String id) {
		int result = dao.naveridCheck(id);
		return result;
	}
	public void naverJoin(String id, String name, String email, String gender, String birthday, String birthyear, String mobile) {
		dao.NaverJoin(id, name, email, gender, birthday, birthyear, mobile);
	}
}
