package controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.ApiBooks;
import dao.KoalaDao;
import dto.BoarderDTO;
import service.KoalaService;

@Controller
public class KoalaController {

	
	@Autowired
	ApiBooks apiBooks;

	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index( ) {
		
		/**
		 * 임시로 주석처리
		KoalaService s = new KoalaService(dao);
		
		ArrayList<BoarderDTO> list2 = s.selectBoard();
		m.addAttribute("list2",list2);
		*/
		
		return "index";
	}
	

	
	@RequestMapping(value = "/indexPoster", method = RequestMethod.GET)
	public String indexPoster() {
		
		return "indexPoster";
	}

	

}
