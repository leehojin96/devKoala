package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	@RequestMapping( value = "/chat" , method = RequestMethod.GET )
    public String join() throws Exception{
        return "chat/chatView2";
    }
	
}
