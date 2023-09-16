package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.ApiBooks;

@Configuration
public class AladinApiContorllerConfig {

	@Bean
	public ApiBooks apiBooks() {
		return new ApiBooks();
	}
	
}
