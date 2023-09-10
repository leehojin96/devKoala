package com.acorn.koala.service;

import com.acorn.koala.dao.KaKaoDao;

public class KaKaoLoginService {
	KaKaoDao dao;
	
	
	public KaKaoLoginService(KaKaoDao dao) {
		this.dao = dao;
	}

	public int kakaoCheck(String id) {
		int result = dao.kakaoidCheck(id);
		return result;
	}
	
	public void kakaoJoin(String id, String email, String nickname, String gender) {
		dao.KakaoJoin(id, email, nickname, gender);
	}
}
