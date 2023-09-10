package com.acorn.koala.Controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.koala.dto.UserDTO;
import com.acorn.koala.service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	MailSender mailSender;
    
    @RequestMapping( value = "/join" , method = RequestMethod.GET )
    public String join() throws Exception{
        return "user/join";
    }
    
    @ResponseBody
    @RequestMapping( value = "/create", method = RequestMethod.POST )
    public Map<String, Object> joinSubmit(@RequestBody UserDTO userDTO) {
    	//System.out.println("!!!");
    	Map<String, Object> map = userService.join(userDTO); 
    	return map;
    }
    
    @ResponseBody
    @RequestMapping( value = "/verify", method = RequestMethod.POST )
    public Map<String, Object> verify(@RequestBody UserDTO userDTO) {
    	Map<String, Object> map = new HashMap<String, Object>(); 
    	System.out.println("verify 도착");
    	map.put("status", userService.verifyUserID(userDTO.getUserID()));
    	//userService통해 회원가입요청
    	return map;
    }
    
    @RequestMapping( value = "/myPage" , method = RequestMethod.GET )
    public String myPage() throws Exception{
        return "user/myPage";
    }
    
    @RequestMapping(value = "/delete" , method = RequestMethod.GET )
    public String delete(String userId) {
    //	System.out.println("userId는 : " +userId);
    	return "user/delete";
    }
    
    @ResponseBody
    @RequestMapping( value = "/userDelete", method = RequestMethod.POST )
    public Map<String, Object> userDelete(@RequestBody UserDTO userDTO) {
    	Map<String, Object> map = new HashMap<String, Object>(); 
    	map.put("status", userService.verifyUserPassword(userDTO));
    	
    	return map;
    }
    
  
    @ResponseBody
    @RequestMapping( value = "/userlist", method = RequestMethod.GET )
    public UserDTO myPage(  String userID  ) {
  	
    	UserDTO userDTO =   userService.list(userID);
    	
    	return userDTO;
    }
    
    @ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public String sendMail(String userEmail) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		// 이메일 보내기 
        String setFrom = "silverlight153@naver.com";
        String toMail = userEmail;
        String title = "코알라북 회원가입 인증 이메일 입니다.";
        String content = 
                "KOALA BOOK 회원가입을 축하합니다!!" +
                "\n"+"\n"+
                "인증 번호는 " +"\s"+ checkNum +"\s"+"\s"+ "입니다." + 
                "\n"+"\n"+
                "회원가입 인증을 완료해주세요!";
        
        	SimpleMailMessage message= new SimpleMailMessage();
            message.setFrom(setFrom);
            message.setTo(toMail);
            message.setSubject(title);
            message.setText(content);
            mailSender.send(message);
        
        return Integer.toString(checkNum);
 
	}
}