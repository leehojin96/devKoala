package com.acorn.koala.Controller;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.acorn.koala.dao.FindDao;
import com.acorn.koala.service.FindService;



@Controller
public class FindController {

	@Autowired
	FindDao dao;
	
	
	@RequestMapping(value = "/finder", method = RequestMethod.GET)
	public void finder() {
	}
	
	@RequestMapping(value = "/finder", method = RequestMethod.POST)
	public String finder2(String id, String name, String date, String email, String domain, String phone1, String phone2, String phone3, HttpServletRequest request) throws UnsupportedEncodingException {
		

		String useremail = email+domain;
		
		String userphone = phone1+phone2+phone3;
		
		FindService service = new FindService(dao);
		String result = service.idFindService(name, date, useremail, userphone);
		
		String result2 = service.pwFindService(id, name, date, useremail, userphone);
		
		
		if(id==null) {	// 아이디찾기
			
			
			if(result == null) {	// 아이디가 없음
				return "idfindfail";
			} else {
				
				request.setAttribute("id", result);
				return "idfindsuccess";
			}
			
		} else{	// 비밀번호 찾기
			
			if(result2 == null) {	// 정보가 일치하지않음
				return "pwfindfail";
			} else {
				request.setAttribute("id", id);
				request.setAttribute("email", useremail);
				return "pwfindsuccess";	// 비밀번호 변경 페이지
			}
			
		}
		

		
	}
	
}
