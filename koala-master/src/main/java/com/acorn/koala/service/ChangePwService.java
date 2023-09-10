package com.acorn.koala.service;

import com.acorn.koala.dao.ChangePwDao;

public class ChangePwService {
	ChangePwDao dao;

	public ChangePwService(ChangePwDao dao) {
		this.dao = dao;
	}
	
	public void pwChangeService(String npw, String id) {
		dao.pwChange(npw, id);
	}
	
	
}
