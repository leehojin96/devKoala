package service;

import org.springframework.beans.factory.annotation.Autowired;

import dao.KaKaoDao;

public class KaKaoLoginService {
	
	@Autowired
	KaKaoDao dao;
	
	public int kakaoCheck(String id) {
		int result = dao.kakaoidCheck(id);
		return result;
	}
	
	public void kakaoJoin(String id, String email, String nickname, String gender) {
		dao.KakaoJoin(id, email, nickname, gender);
	}
}
