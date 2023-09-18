package config;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.beans.factory.annotation.Configurable;
import org.springframework.context.annotation.Bean;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import dao.ChangePwDao;
import dao.FindDao;
import dao.KoalaDao;
import dao.MyPageDao;
import dao.UserDao;
import service.ChangePwService;
import service.FindService;
import service.KoalaService;
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

	
	//Dao
	
	@Bean
	public UserDao userDao() {
		return new UserDao();
	}
	
	@Bean
	public ChangePwDao changePwDao() {
		return new ChangePwDao(); 
	}
	
	@Bean
	public FindDao findDao() {
		return new FindDao();
	}
	
	@Bean
	public MyPageDao myPageDao() {
		return new MyPageDao();
	}
	
//	@Bean
//	public UserJoinDAO userJoinDAO() {
//		return new UserJoinDAO();
//	}
	
	@Bean
	public KoalaDao koalaDao() {
		return new KoalaDao();
	}
	
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
	public KoalaService koalaService() {
		return new KoalaService();
	}
	
//	public static void main(String[] args) {
//		PlatformTransactionManager a = transactionManager();
//		System.out.println(a.equals(null)); 
//
//	}
}
