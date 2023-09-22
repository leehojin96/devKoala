package service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import dao.BoardDao;
import dto.BoarderDTO;
import dto.CommentsDTO;

public class BoardService {

	@Autowired
	BoardDao boardDao;
	String w_number;
	
	public ArrayList<BoarderDTO> selectBoard(){
		return boardDao.selectBoard();
		
	}

	public String[] showDetail(String w_number) {
		return boardDao.showDetail(w_number);
		
	}
	
	
	public void insertContent(BoarderDTO dto) {
		boardDao.insertContent(dto);
	}
	
	public void add_comments(CommentsDTO dto) {
		boardDao.add_comments(dto);
	}
	
	public ArrayList<CommentsDTO> show_comments(String w_number) {
		return boardDao.show_comments(w_number);
	}
	
}
