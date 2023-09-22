package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import api.ApiBooks;
import service.ApiBooksService;

@Configuration
public class AladinApiConfig {

	@Bean
	public ApiBooks apiBooks() {
		return new ApiBooks();
	}
	
	@Bean
	public ApiBooksService apiBooksService() {
		return new ApiBooksService();
	}
}
