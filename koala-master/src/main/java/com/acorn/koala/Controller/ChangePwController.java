package com.acorn.koala.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.acorn.koala.dao.ChangePwDao;
import com.acorn.koala.service.ChangePwService;

@Controller
public class ChangePwController {
	
	@Autowired
	ChangePwDao dao;
	
	//비밀번호 변경
	@RequestMapping(value = "/chpw", method = RequestMethod.POST)
	public String finder(String newpwd, String id, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		ChangePwService service = new ChangePwService(dao);
		service.pwChangeService(newpwd, id);
	
		
		
		return "redirect:index";
	}
}
