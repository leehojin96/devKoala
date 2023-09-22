package controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.UserDTO;
import service.JoinService;

@Controller
@RequestMapping(value = "/user")
public class JoinController {
	
	@Autowired
	JoinService joinService;
	   
    @RequestMapping( value = "/join" , method = RequestMethod.GET )
    public String join() throws Exception{
        return "user/join";
    }
    
    
    @ResponseBody
    @RequestMapping( value = "/create", method = RequestMethod.POST )
    public Map<String, Object> joinSubmit(@RequestBody UserDTO userDTO) {
    	//System.out.println("!!!");
    	Map<String, Object> map = joinService.join(userDTO); 
    	return map;
    }
    
    
    @ResponseBody
	@RequestMapping(value = "/sendMail", method = RequestMethod.GET)
	public int sendMail(String userEmail) {		
		
    	int checkNum = joinService.joinMailService(userEmail);
        
        return checkNum;
 
	}

}
