package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import api.KakaoLoginApi;
import api.NaverLoginApi;
import service.KakaoLoginService;
import service.NaverLoginService;

@Configuration
public class LoginApiConfig {

	//dao 
	
	@Bean
	public KakaoLoginApi kakaoLoginApi() {
		return new KakaoLoginApi();
	}
	
	@Bean
	public NaverLoginApi naverLoginApi() {
		return new NaverLoginApi();
	}
	

	
	//service
	
	@Bean
	public KakaoLoginService kakaoLoginService() {
		return new KakaoLoginService();
	}
	
	@Bean
	public NaverLoginService naverLoginService() {
		return new NaverLoginService();
	}
}
