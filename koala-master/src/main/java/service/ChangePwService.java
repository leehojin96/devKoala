package service;

import dao.ChangePwDao;

public class ChangePwService {
	ChangePwDao dao;

	public ChangePwService(ChangePwDao dao) {
		this.dao = dao;
	}
	
	public void pwChangeService(String npw, String id) {
		dao.pwChange(npw, id);
	}
	
	
}
