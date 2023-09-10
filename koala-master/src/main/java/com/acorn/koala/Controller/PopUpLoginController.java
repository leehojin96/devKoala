package com.acorn.koala.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.acorn.koala.dao.UserDao;
import com.acorn.koala.service.LoginService;

@Controller
public class PopUpLoginController {
	@Autowired
	UserDao dao;
	
	
	@RequestMapping(value = "/pop", method = RequestMethod.GET)
	public String pop() {
		
		
		return "popuptest";
	}
	
	@RequestMapping(value = "/poplogin", method = RequestMethod.GET)
	public String pop2() {
		 
		return "pop";
	}
	
	@RequestMapping(value = "/poplogin", method = RequestMethod.POST)
	public String login2(String id, String pw, String login_type, HttpServletResponse response, HttpServletRequest request) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		
		LoginService service = new LoginService(dao);
		int result = service.loginUser(id, pw);

		
		
		if(result == 1 ){	
			HttpSession session = request.getSession();
			session.setAttribute("userID", id);
			session.setAttribute("logintype", login_type);
			
			PrintWriter script = response.getWriter();
			script.println("<script> opener.location.reload(); self.close(); </script>");
			
			

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
		
		return null;
	}
}
