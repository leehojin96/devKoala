package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService service;
	

	@RequestMapping(value = "user/login", method = RequestMethod.GET)
	public String login(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session.getAttribute("userID") != null) {
			return "redirect:index";
		}
		return "/user/login";
	}
	
	
	@RequestMapping(value = "user/login", method = RequestMethod.POST)
	public String login2(String id, String pw, String login_type, boolean rememberId, HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
	
			int result = service.loginUser(id, pw);
			
			if(result == 1 ){
				HttpSession session = request.getSession();
				session.setAttribute("userId", id);
				session.setAttribute("loginType", login_type);
				
//				userDao.loginLog(id);
				
				if(rememberId) {
					//쿠키생성, 저장
					Cookie cookie = new Cookie("id",id);
					response.addCookie(cookie);
				} else {
					//쿠키삭제
					Cookie cookie = new Cookie("id",id);
					cookie.setMaxAge(0); // 쿠키 삭제
					response.addCookie(cookie);
				}
				return "redirect: ../index";		// redirect 가 아닌  return "index"  로 보내게 되면 화면은 index로 가지만 주소창엔 login으로 남아있음
			} else if (result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>alert('비밀번호가 틀립니다.'); history.back(); </script>");
			} else if (result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>alert('존재하지 않는 아이디입니다.'); history.back(); </script>");
			} else if (result == -2){
				PrintWriter script = response.getWriter();
				script.println("<script>alert('DB 오류'); history.back(); </script>");
			}
		
		
		
		return "redirect: ../index";
	}
	
	@RequestMapping(value = "user/logout", method = RequestMethod.GET)
	public String logout(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		
		PrintWriter script = response.getWriter();
		script.println("<script>alert('로그아웃 되었습니다.'); </script>");
		script.println("<script>location.href = '/koala/index'; </script>");
		script.flush();	// 얘 하니까 안뜨던 alert가 뜨지만 return이 안먹어서 location.hrtf로 보냄..

		return null;
		
	}
}
