package com.acorn.koala.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.acorn.koala.dao.NaverDao;
import com.acorn.koala.service.NaverLoginService;

@Controller
public class NaverLoginController {
	@Autowired
	NaverDao dao;
	
	
	@RequestMapping(value = "/naverLogin", method = RequestMethod.POST)
	public String naverLogin(String id, String name, String email, String gender, String birthday, String birthyear, String mobile, String login_type, HttpServletRequest request) throws IOException {
		
		System.out.println(id + "/" + name + "/" + email + "/" + gender + "/" + birthday + "/" + birthyear + "/" + mobile + "/" + login_type);
		
		NaverLoginService service = new NaverLoginService(dao);
		int result = service.naverCheck(id);
		// 가입 후 세션에 id 등록
		if(result==0) {
			service.naverJoin(id, name, email, gender, birthday, birthyear, mobile);
			HttpSession session = request.getSession();
			session.setAttribute("userID", id);
			session.setAttribute("logintype", login_type);
			
			
			
			return "redirect:index";
			
		} else {
			// 가입 이미 되어있다면 세션에 id 등록
			HttpSession session = request.getSession();
			session.setAttribute("userID", id);
			session.setAttribute("logintype", login_type);
			
		}
		return "redirect:index";
	}
	
	@RequestMapping(value = "/naverLogout", method = RequestMethod.GET)
	public String naverLogout( HttpServletRequest request,  HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		session.invalidate();
		
		
		PrintWriter script = response.getWriter();
		script.println("<script>alert('로그아웃 되었습니다.'); </script>");
		script.println("<script>location.href = '/koala/index'; </script>");
		script.flush();	// 얘 하니까 안뜨던 alert가 뜨지만 return이 안먹어서 location.hrtf로 보냄..
		
		return "index";
	}

	
	@RequestMapping(value = "/navercallback", method = RequestMethod.GET)
	public String naver_callback() {
		
		return "navercallback";
		
	}
}
