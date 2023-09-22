package service;

import org.springframework.beans.factory.annotation.Autowired;

import api.KakaoLoginApi;

public class KakaoLoginService {
	
	@Autowired
	KakaoLoginApi kakaoLoginApi;
	
	public int kakaoCheck(String id) {
		int result = kakaoLoginApi.kakaoidCheck(id);
		return result;
	}
	
	public void kakaoJoin(String id, String email, String nickname, String gender) {
		kakaoLoginApi.KakaoJoin(id, email, nickname, gender);
	}
}
