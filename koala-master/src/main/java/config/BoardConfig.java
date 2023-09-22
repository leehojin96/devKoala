package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import api.KakaoLoginApi;
import service.BoardService;

@Configuration
public class BoardConfig {

	
	@Bean
	public KakaoLoginApi boardDao() {
		return new KakaoLoginApi();
	}
	
	@Bean
	public BoardService koalaService() {
		return new BoardService();
	}
	
}
