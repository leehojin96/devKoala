package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.NaverDao;

public class NaverLoginService {
	
	@Autowired
	NaverDao dao;
	

	public int naverCheck(String id) {
		int result = dao.naveridCheck(id);
		return result;
	}
	public void naverJoin(String id, String name, String email, String gender, String birthday, String birthyear, String mobile) {
		dao.NaverJoin(id, name, email, gender, birthday, birthyear, mobile);
	}
}
