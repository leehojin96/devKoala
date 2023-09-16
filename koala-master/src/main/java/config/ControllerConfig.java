package config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.BooksViewController;
import controller.KoalaController;
import controller.UserController;
import dao.ApiBooks;

@Configuration
public class ControllerConfig {

	@Bean
	public BooksViewController booksViewController() {
		return new BooksViewController();
	}
	
	@Bean
	public KoalaController koalaController() {
		return new KoalaController();
	}
	
	@Bean
	public UserController userController() {
		return new UserController();
	}

	

}
