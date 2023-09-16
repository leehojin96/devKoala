package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.ChangePwDao;

public class ChangePwService {
	
	@Autowired
	ChangePwDao dao;
	
	public void pwChangeService(String npw, String id) {
		dao.pwChange(npw, id);
	}
	
	
}
