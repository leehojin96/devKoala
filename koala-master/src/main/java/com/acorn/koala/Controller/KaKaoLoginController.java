package com.acorn.koala.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.acorn.koala.dao.KaKaoDao;
import com.acorn.koala.service.KaKaoLoginService;

@Controller
public class KaKaoLoginController {
	@Autowired
	KaKaoDao dao;
	

	
	
	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.POST)
	public String kakaoLogin(String id, String email, String nickname, String gender, String login_type, HttpServletRequest request) {
		System.out.println(id +"/"+ email + "/"+ nickname + "/"+ gender  + "/"+ login_type );
		
		KaKaoLoginService service = new KaKaoLoginService(dao);
		int result = service.kakaoCheck(id);
		// 가입 후 세션에 id 등록
		if(result == 0) {
			service.kakaoJoin(id, email, nickname, gender);
			HttpSession session = request.getSession();
			session.setAttribute("userID", id);
			session.setAttribute("logintype", login_type);
			
		} else if(result == 1) {
			// 가입 이미 되어있다면 세션에 id 등록
			HttpSession session = request.getSession();
			session.setAttribute("userID", id);
			session.setAttribute("logintype", login_type);
		}
		
		return "redirect:index";
	}
	
	@RequestMapping(value = "/kakaoLogout", method = RequestMethod.GET)
	public String kakaoLogout( HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		session.invalidate();
		
		PrintWriter script = response.getWriter();
		script.println("<script>alert('로그아웃 되었습니다.'); </script>");
		script.println("<script>location.href = '/koala/index'; </script>");
		script.flush();	// 얘 하니까 안뜨던 alert가 뜨지만 return이 안먹어서 location.hrtf로 보냄..
		
		return "index";
	}
}
