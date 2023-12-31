package controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.UserDto;
import service.UserService;

@Controller
@RequestMapping(value = "/user")
public class UserController {
	
	@Autowired
	UserService userService;
	

    @ResponseBody
    @RequestMapping( value = "/verify", method = RequestMethod.POST )
    public Map<String, Object> verify(@RequestBody UserDto userDto) {
    	Map<String, Object> map = new HashMap<String, Object>(); 
    	System.out.println("verify 도착");
    	map.put("status", userService.verifyUserID(userDto.getUserID()));
    	//userService통해 회원가입요청
    	return map;
    }
    
    @RequestMapping( value = "/myPage" , method = RequestMethod.GET )
    public static String myPage() throws Exception{
        return "user/myPage";
    }
    
    @RequestMapping(value = "/delete" , method = RequestMethod.GET )
    public String delete(String userId) {
    //	System.out.println("userId는 : " +userId);
    	return "user/delete";
    }
    
    @ResponseBody
    @RequestMapping( value = "/userDelete", method = RequestMethod.POST )
    public Map<String, Object> userDelete(@RequestBody UserDto userDto) {
    	Map<String, Object> map = new HashMap<String, Object>(); 
    	map.put("status", userService.verifyUserPassword(userDto));
    	
    	return map;
    }
    
  
    @ResponseBody
    @RequestMapping( value = "/userlist", method = RequestMethod.GET )
    public UserDto myPage(  String userID  ) {
  	
    	UserDto userDto =   userService.list(userID);
    	
    	return userDto;
    }
   
    
}