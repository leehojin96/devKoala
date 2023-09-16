package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.KaKaoDao;
import dao.NaverDao;
import service.KaKaoLoginService;
import service.NaverLoginService;

@Configuration
public class LoginApiConfig {

	@Bean
	public KaKaoDao kaKaoDao() {
		return new KaKaoDao();
	}
	
	@Bean
	public NaverDao naverDao() {
		return new NaverDao();
	}
	
	@Bean
	public KaKaoLoginService kaKaoLoginService() {
		return new KaKaoLoginService();
	}
	
	@Bean
	public NaverLoginService naverLoginService() {
		return new NaverLoginService();
	}
}
