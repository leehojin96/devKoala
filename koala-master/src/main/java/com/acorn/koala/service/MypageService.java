package com.acorn.koala.service;

import com.acorn.koala.dao.MyPageDao;
import com.acorn.koala.dto.UserMypageDto;

public class MypageService {

	MyPageDao dao;

	public MypageService(MyPageDao dao) {
		this.dao = dao;
	}
	
	public UserMypageDto MypageInfo(String userId) {
		
		UserMypageDto user = dao.mypageinfo(userId);
		return user;
		
	}
	
	
	public int phonecheck(String newphone) {
		int result = dao.phonecheck(newphone);
		return result;
	}
	
	public void changephone(String phone, String newphone) {
		dao.changePhone(phone, newphone);
	}
	
	public void changeemail(String newemail, String u_id) {
		dao.changeEmail(newemail, u_id);
	}
}
