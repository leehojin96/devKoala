package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;

public class ChangePwService {
	
	@Autowired
	UserDao dao;
	
	public void pwChangeService(String npw, String id) {
		dao.pwChange(npw, id);
	}
	
	
}
