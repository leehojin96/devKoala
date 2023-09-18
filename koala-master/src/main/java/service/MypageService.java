package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.UserDao;
import dto.UserMypageDto;

public class MypageService {

	@Autowired
	UserDao dao;

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
