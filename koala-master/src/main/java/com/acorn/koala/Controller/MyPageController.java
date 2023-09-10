package com.acorn.koala.Controller;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.koala.dao.MyPageDao;
import com.acorn.koala.dao.UserDao;
import com.acorn.koala.dto.UserLogDto;
import com.acorn.koala.dto.UserMypageDto;
import com.acorn.koala.service.LoginService;
import com.acorn.koala.service.MypageService;

@Controller
public class MyPageController {

	@Autowired
	UserDao dao;
	
	//주석
	
	/*주석*/
	
	@RequestMapping(value = "/mypageenter", method = RequestMethod.GET)
	public String mypage( HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		HttpSession session = request.getSession();
		
		String userID = (String) session.getAttribute("userID");
		String logintype = (String) session.getAttribute("logintype");
		
		
			if(userID == null ) {
				return "redirect:login";
			} else if(userID != null && logintype.equals("0")) {
				return "mypageenter";
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>alert('네이버회원과 카카오회원은 이용하실수 없는 서비스입니다.');</script>");
				script.println("<script> location.href = '/koala/index' </script>");
				script.close();
				
				return null;
			}
		
	
	}
	
	@RequestMapping(value = "/mypageenter", method = RequestMethod.POST)
	public String mypage2( String id, String pw, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		LoginService service = new LoginService(dao);
		int result = service.loginUser(id, pw);
		
		if(result==1) {
			return "redirect:mypagee";
		}else if (result == 0){
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
	
	@Autowired
	MyPageDao mdao;
	
	@RequestMapping(value = "/mypagee", method = RequestMethod.GET)
	public String mypagee( HttpServletRequest request) {
		
		
		HttpSession session = request.getSession();
		
		String userID = (String) session.getAttribute("userID");
		String logintype = (String) session.getAttribute("logintype");
		
		
		
		if(userID != null && logintype.equals("0") ) {	// 로그인함
			
			MypageService service = new MypageService(mdao);
			UserMypageDto user = service.MypageInfo(userID);
			
			
			
			String name = user.getUserName();
			String rpemail = user.getRpemail();
			String email = user.getEmail();
			String rpphone = user.getRpphoneNumber();
			String phone = user.getPhoneNumber();
			String addr1 = user.getAddr1();
			String addr2 = user.getAddr2();
			String addr3 = user.getAddr3();
			
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			request.setAttribute("rpemail", rpemail);
			request.setAttribute("rpphone", rpphone);
			request.setAttribute("phone", phone);
			request.setAttribute("addr1", addr1);
			request.setAttribute("addr2", addr2);
			request.setAttribute("addr3", addr3);
			
			
			
			
			return "mypagee";
		} else if(userID == null) {		// 로그인함
			
			
			return "redirect:login";
		}
		
		
		return null;
	}
	
	@RequestMapping(value = "/changephone", method = RequestMethod.POST)
	public String changephone(String phone, String newphone, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		MypageService service = new MypageService(mdao);
		int result = service.phonecheck(newphone);
		
		if(result == 1) {
			PrintWriter script = response.getWriter();
			script.println("<script>alert('변경할 수 없는 전화번호입니다'); history.back(); </script>");
			script.close();
		} else {
			service.changephone(phone, newphone);
			PrintWriter script = response.getWriter();
			script.println("<script>location.href = '/koala/mypagee'; </script>");
			script.close();
		}
		
		
		return null;
		
	}
	
	@RequestMapping(value = "/changeemail", method = RequestMethod.POST)
	public String changeemail(String newemail, String u_id, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		MypageService service = new MypageService(mdao);
		service.changeemail(newemail, u_id);
			
		PrintWriter script = response.getWriter();
		script.println("<script>location.href = '/koala/mypagee'; </script>");
		script.close();

		
		
		return null;
		
	}
	
	
	@RequestMapping(value = "/logpopup", method = RequestMethod.GET)
	public ArrayList<UserLogDto> logpopup(String id, HttpServletRequest request) {
		
		ArrayList<UserLogDto> list = mdao.LogView(id);
		request.setAttribute("list", list);
		
		
		return null;
		
	}
}
