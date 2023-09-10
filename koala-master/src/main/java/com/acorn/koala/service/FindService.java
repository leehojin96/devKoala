package com.acorn.koala.service;

import com.acorn.koala.dao.FindDao;

public class FindService {

	FindDao dao;

	public FindService(FindDao dao) {
		this.dao = dao;
	}
	
	public String idFindService(String name, String date, String email, String phone) {
		String result = dao.idFind(name, date, email, phone);
		return result;
		
	}
	
	public String pwFindService(String id, String name, String date, String email, String phone) {
		String result = dao.pwFind(id, name, date, email, phone);
		return result;
		
	}
	
}
