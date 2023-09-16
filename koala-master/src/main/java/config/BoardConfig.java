package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.KoalaDao;
import service.KoalaService;

@Configuration
public class BoardConfig {

	
	@Bean
	public KoalaDao koalaDao() {
		return new KoalaDao();
	}
	
	@Bean
	public KoalaService koalaService() {
		return new KoalaService();
	}
	
}
