package config;

import java.util.Properties;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import dao.BoardDao;
import dao.UserDao;
import service.BoardService;
import service.ChangePwService;
import service.FindService;
import service.JoinService;
import service.LoginService;
import service.MypageService;
import service.UserService;

@Configurable
@EnableTransactionManagement
public class UserConfig {

	@Bean(destroyMethod = "close")
	public DataSource ds() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		ds.setUrl("jdbc:oracle:thin:@localhost:1521:xe");
		ds.setUsername("system");
		ds.setPassword("1234");
		ds.setInitialSize(2);
		ds.setMaxActive(10);
		ds.setTestWhileIdle(true);
		ds.setMinEvictableIdleTimeMillis(60000 * 3);
		ds.setTimeBetweenEvictionRunsMillis(10 * 1000);
		return ds;
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager tm = new DataSourceTransactionManager();
		tm.setDataSource(ds());
		return tm;
	}
	
	@Bean
	public JavaMailSender javaMailSender() {
		JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
		javaMailSender.setHost("smtp.naver.com");
		javaMailSender.setPort(587);
		javaMailSender.setUsername("st2035@naver.com");
		javaMailSender.setPassword("Leeought21!@");
		
		Properties props = javaMailSender.getJavaMailProperties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.timeout", 5000);
		props.put("mail.smtp.starttls.enable","ture");
		
		
		return javaMailSender;
	}

	
	//Dao
	
	@Bean
	public UserDao userDao() {
		return new UserDao();
	}
	
	@Bean
	public BoardDao koalaDao() {
		return new BoardDao();
	}
	
//	@Bean
//	public ChangePwDao changePwDao() {
//		return new ChangePwDao(); 
//	}
//	
//	@Bean
//	public FindDao findDao() {
//		return new FindDao();
//	}
	
//	@Bean
//	public MyPageDao myPageDao() {
//		return new MyPageDao();
//	}
	
//	@Bean
//	public UserJoinDAO userJoinDAO() {
//		return new UserJoinDAO();
//	}
	
	
	
	//Service
	
	@Bean
	public UserService userService() {
		return new UserService();
	}
	
	@Bean
	public MypageService mypageService() {
		return new MypageService(); 
	}
	
	@Bean
	public LoginService loginService() {
		return new LoginService();
	}
	
	@Bean
	public FindService findService() {
		return new FindService();
	}
	
	@Bean
	public ChangePwService changePwService() {
		return new ChangePwService();
	}
	
	@Bean
	public BoardService koalaService() {
		return new BoardService();
	}
	
	@Bean
	public JoinService joinService() {
		return new JoinService();
	}
	
//	public static void main(String[] args) {
//		PlatformTransactionManager a = transactionManager();
//		System.out.println(a.equals(null)); 
//
//	}
}
