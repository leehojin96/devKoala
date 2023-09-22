package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.ChangePwService;

@Controller
public class ChangePwController {
	
	@Autowired
	private ChangePwService changePwService;
	
	//비밀번호 변경
	@RequestMapping(value = "/chpw", method = RequestMethod.POST)
	public String finder(String newpwd, String id, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		
		changePwService.pwChangeService(newpwd, id);
	
		
		
		return "redirect:index";
	}
}
