package controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import dto.UserDto;
import service.KakaoLoginService;

@Controller
public class KakaoLoginController {

//	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.POST)
//	public String kakaoLogin(String id, String email, String nickname, String gender, String login_type, HttpServletRequest request) {
//		System.out.println(id +"/"+ email + "/"+ nickname + "/"+ gender  + "/"+ login_type );
//		
//		int result = kakaoLoginService.kakaoCheck(id);
//		// 가입 후 세션에 id 등록
//		if(result == 0) {
//			kakaoLoginService.kakaoJoin(id, email, nickname, gender);
//			HttpSession session = request.getSession();
//			session.setAttribute("userID", id);
//			session.setAttribute("logintype", login_type);
//			
//		} else if(result == 1) {
//			// 가입 이미 되어있다면 세션에 id 등록
//			HttpSession session = request.getSession();
//			session.setAttribute("userID", id);
//			session.setAttribute("logintype", login_type);
//		}
//		
//		return "redirect:index";
//	}

	@Autowired
	KakaoLoginService kakaoLoginService;

//	@RequestMapping(value="/kakaoAuthorize",method = RequestMethod.GET)
//	public void kakaoAuthorize() throws Exception{
//		String reqURL=  "https://kauth.kakao.com/oauth/authorize?client_id=9dfadd14a4d5d604a1d9549fac675eb4&redirect_uri=http://localhost:8080/koala/kakaoLogin&response_type=code";
//		URL url = new URL(reqURL);
//		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		conn.setRequestMethod("GET");
//		
//	}

	@RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		UserDto userDto;
		HttpSession session = request.getSession();
		// 카카오 api 통신에 있어 익셉션 발생 가능
		// 카카오 테이블 조회시 익셉션 발생 가능
		try {
			userDto = kakaoLoginService.getKakaoUser(code);
			int kakaoAuth = kakaoLoginService.checkKakaoAuth(userDto.getEmail());
			userDto.setKakaoAuth(kakaoAuth);
			if (kakaoAuth == 0) {
				kakaoLoginService.createKakaoUser(userDto.getEmail(), userDto.getUserName());
				session.setAttribute("userDto", userDto);
				session.setAttribute("loginType", 1);
				// 카카오 회원 생성 환영 페이지
				return "redirect: ../index";
			} else if (kakaoAuth > 0) {
				String userId = kakaoLoginService.checkUserId(kakaoAuth);
				if (userId == null) {
					// 카카오로만 가입되어있음
					session.setAttribute("userDto", userDto);
					session.setAttribute("loginType", 1);// 카카오로그인타입
				} else {
					//통합 가입 회원
					userDto.setUserID(userId);
					session.setAttribute("userDto", userDto);
					session.setAttribute("loginType", 0);// 통합로그인타입
				}
				return "redirect: ../index";
			}
		} catch (Throwable e) {
			e.printStackTrace();
			// 로그인에 오류가 발생했다는 페이지
			return "redirect: ../koala/user/login";
		}

//
//		if (kakaoAuth != 0) {
//			String userId = kakaoLoginService.checkUserId(kakaoAuth);
//			if (userId.equals(null)) {
//				// 카카오로만 가입되어있음
////				session.setAttribute("userId", email);
//				session.setAttribute("loginType", 1);// 카카오로그인타입
//			} else {
//				session.setAttribute("userId", userId);
//				session.setAttribute("loginType", 0);// 통합로그인타입
//			}
//			return "redirect: ../index";
//		} else if (kakaoAuth == 0) {
//			try {
//				// 카카오 테이블에 등록되어 있지 않음
////			kakaoLoginService.createKakaoUser(email, userName);
////			session.setAttribute("userId", email);
//				session.setAttribute("loginType", 1);// 카카오로그인타입
//			} catch (Exception e) {
//				e.printStackTrace();
//				// 카카오 테이블 insert중 익셉션 발생시 로그인 페이지로
//				return "redirect: ../koala/user/login";
//			}
//
//			try {
//				PrintWriter script;
//				script = response.getWriter();
////			script.println("<script>alert('가입된 아이디가 없습니다. 카카오톡으로 회원가입으로 이동합니다.'); </script>");
//				script.println("<script>alert('카카오톡을 통한 회원가입을 환영합니다!!'); </script>");
//				script.println("<script>location.href = '/koala/index'; </script>");
//				script.flush(); // 얘 하니까 안뜨던 alert가 뜨지만 return이 안먹어서 location.hrtf로 보냄..
//
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//				return null;
//			}
//		}

		// 특이사항의 익셉션 경우 다시 로그인 페이지로
		return "redirect: ../koala/user/login";

	}

	@RequestMapping(value = "/kakaoLogout", method = RequestMethod.GET)
	public String kakaoLogout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		session.invalidate();

		PrintWriter script = response.getWriter();
		script.println("<script>alert('로그아웃 되었습니다.'); </script>");
		script.println("<script>location.href = '/koala/index'; </script>");
		script.flush(); // 얘 하니까 안뜨던 alert가 뜨지만 return이 안먹어서 location.hrtf로 보냄..

		return "index";
	}

	@RequestMapping(value = "/kakaoRevoke", method = RequestMethod.GET)
	public String kakaoRevoke() {
		return null;
	}
}
