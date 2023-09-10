package service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import dao.KoalaDao;
import dto.BoarderDTO;
import dto.CommentsDTO;

public class KoalaService {

	@Autowired
	KoalaDao dao;
	String w_number;
	
	public KoalaService() {
		// TODO Auto-generated constructor stub
	}
	public KoalaService(KoalaDao dao) {
		this.dao = dao;
	}
	
	
	
	
	
	
	
	
	public ArrayList<BoarderDTO> selectBoard(){
		return dao.selectBoard();
		
	}

	public String[] showDetail(String w_number) {
		return dao.showDetail(w_number);
		
	}
	
	
	public void insertContent(BoarderDTO dto) {
		dao.insertContent(dto);
	}
	
	public void add_comments(CommentsDTO dto) {
		dao.add_comments(dto);
	}
	
	public ArrayList<CommentsDTO> show_comments(String w_number) {
		return dao.show_comments(w_number);
	}
	
}
