package service;

import org.springframework.beans.factory.annotation.Autowired;

import api.NaverLoginApi;

public class NaverLoginService {
	
	@Autowired
	NaverLoginApi naverLoginApi;
	

	public int naverCheck(String id) {
		int result = naverLoginApi.naveridCheck(id);
		return result;
	}
	public void naverJoin(String id, String name, String email, String gender, String birthday, String birthyear, String mobile) {
		naverLoginApi.NaverJoin(id, name, email, gender, birthday, birthyear, mobile);
	}
}
