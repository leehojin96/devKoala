package config;

import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * DispatcherServlet은 웹 브라우저의 요청을
 * 1.핸들러매핑을 이용 하여 객체를 찾고,
 * 2.핸들러어댑터를 이용 하여 컨트롤러의 메서드를 알맞게 실행하고 그 결과를 ModelAndView 객체로 변환해서 반환한다.
 * 3.ViewController가 설정에 따라 뷰를 선택하고 결과를 반환 한다.
 * 4.ViewResolver가 적절한 뷰로 변환 한다.
 */
@Configuration
@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer{

	/**
	 * 스프링 MVC에서 기본 서블릿 핸들러를 설정하는 메서드입니다.
	 * 이 메서드에서는 DefaultServletHandlerConfigurer 객체를 사용하여 기본 서블릿 핸들러를 활성화합니다.
	 */
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	/**
	 * 스프링 MVC에서 뷰 컨트롤러를 설정하는 메서드입니다.
	 * 이 메서드에서는 ViewControllerRegistry 객체를 사용하여 main 뷰 컨트롤러를 등록합니다.
	 */
	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/main").setViewName("main");
	}
	
	/**
	 * 스프링 MVC에서 뷰 리졸버를 설정하는 메서드입니다. 
	 * 컨트롤러의 실행 결과를 받은 DispatcherServlet은 ViewResolver에게 뷰 이름에 해당하는 View객체를 요청한다.
	 */
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/",".jsp");
	}

	
}
