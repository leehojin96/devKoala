package config;


import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import controller.BoarderController;
import controller.BooksViewController;
import controller.ChangePwController;
import controller.FindController;
import controller.JoinController;
import controller.KakaoLoginController;
import controller.KoalaController;
import controller.LoginController;
import controller.MyPageController;
import controller.PopUpLoginController;
import controller.UserController;

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
	public JoinController joinController() {
		return new JoinController();
	}

	@Bean
	public BoarderController boarderController() {
		return new BoarderController();
	}
	
	@Bean
	public ChangePwController changePwController() {
		return new ChangePwController();
	}
	
//	@Bean
//	public KakaoLoginController kakaoLoginController() {
//		return new KakaoLoginController();
//	}
//	
//	@Bean
//	public NaverLoginController naverLoginService() {
//		return new NaverLoginController();
//	}
//	
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
	
	@Bean
	public KakaoLoginController kakaoLoginController() {
		return new KakaoLoginController();
	}
	

}
