package config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.BoarderController;
import controller.BooksViewController;
import controller.ChangePwController;
import controller.FindController;
import controller.KoalaController;
import controller.LoginController;
import controller.MyPageController;
import controller.PopUpLoginController;
import controller.UserController;
import service.KaKaoLoginService;
import service.NaverLoginService;

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

	@Bean
	public BoarderController boarderController() {
		return new BoarderController();
	}
	
	@Bean
	public ChangePwController changePwController() {
		return new ChangePwController();
	}
	
	@Bean
	public KaKaoLoginService kaKaoLoginService() {
		return new KaKaoLoginService();
	}
	
	@Bean
	public NaverLoginService naverLoginService() {
		return new NaverLoginService();
	}
	
	@Bean
	public FindController findController() {
		return new FindController();
	}
	
	@Bean
	public LoginController loginController() {
		return new LoginController();
	}
	
	@Bean
	public MyPageController myPageController() {
		return new MyPageController();
	}
	
	@Bean
	public PopUpLoginController popUpLoginController() {
		return new PopUpLoginController();
	}
	
	

}
