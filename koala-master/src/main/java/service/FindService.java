package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;

public class FindService {

	@Autowired
	UserDao dao;
	
	public String idFindService(String name, String date, String email, String phone) {
		String result = dao.idFind(name, date, email, phone);
		return result;
		
	}
	
	public String pwFindService(String id, String name, String date, String email, String phone) {
		String result = dao.pwFind(id, name, date, email, phone);
		return result;
		
	}
	
}
