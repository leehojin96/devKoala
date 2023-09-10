package com.acorn.koala.Controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.acorn.koala.dao.KoalaDao;
import com.acorn.koala.dto.BoarderDTO;
import com.acorn.koala.dto.CommentsDTO;
import com.acorn.koala.service.KoalaService;

@Controller
public class BoarderController {
	
	@Autowired
	KoalaDao dao;
	
	//게시판 이동
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model m) {	
		KoalaService s = new KoalaService(dao);
		ArrayList<BoarderDTO> list = s.selectBoard();
		//System.out.println(list);
		//System.out.println("abc");
		m.addAttribute("list",list);			
		return "board";
	}
	
	//게시글 작성 이동
	@RequestMapping(value = "/writeBoard", method = RequestMethod.GET)
	public String writeBoard() {
		return "write_board";	
		
	}
	
	//게시글 등록
	@RequestMapping(value = "/insertContent", method = RequestMethod.POST)
	public String insertContent( HttpServletRequest request,String w_number, String userID, String title, String passward,String content,String writeday) {
		
		HttpSession session = request.getSession();
		userID = (String)session.getAttribute("userID");
		
		
		KoalaService s = new KoalaService(dao);
		BoarderDTO dto = new BoarderDTO(w_number,userID,title,passward,content,writeday);
		s.insertContent(dto);
		
		return "redirect:board";
		
	}
	
	
	
	
	
	
	
	//댓글 등록
	@ResponseBody
	@RequestMapping(value = "/add_comments", method = RequestMethod.POST)
	public ArrayList<CommentsDTO> add_comments(HttpServletRequest request, String userID, String w_number, String comments) {
		
		HttpSession session = request.getSession();
		userID = (String)session.getAttribute("userID");
		
		System.out.println("세션에서 넘어온 아이디"+userID);
		
		
		KoalaService s = new KoalaService(dao);
		//String str = comments;
		
		//댓글 insert
		if(comments!=null) {
		CommentsDTO dto = new CommentsDTO(userID,w_number,comments);
		s.add_comments(dto);

		//댓글 저장하기
		ArrayList<CommentsDTO> list = s.show_comments(w_number);
		System.out.println("여기에러"+list);
		
		return list;
		}else {
			ArrayList<CommentsDTO> list = s.show_comments(w_number);
			System.out.println(list);
			
			return list;
			
			
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	//게시글 이동
	@RequestMapping(value = "/showDetail", method = RequestMethod.GET)
	public String showDetail(HttpServletRequest httpServletRequest, Model m) {
		
		HttpSession session = httpServletRequest.getSession();
		String userID = (String)session.getAttribute("id");
		
		String w_number = httpServletRequest.getParameter("w_number");
		KoalaService s = new KoalaService(dao);
		String[] list = s.showDetail(w_number);
		m.addAttribute("list",list);
		
		m.addAttribute("userID",userID);
		
		
		//////////////////////////////////////////////////
		
		ArrayList<BoarderDTO> list2 = s.selectBoard();
		m.addAttribute("list2",list2);
		
		return "showDetail";
	}
	
	
	
	
	
	

}
