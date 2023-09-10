package com.acorn.koala.dto;

public class BoarderDTO {
	
	String w_number;
	String userID;
	String title;
	String passward;
	String content;
	String writeday ;
	
	String comments;
	String comments_num;
	
	
	public BoarderDTO() {
		// TODO Auto-generated constructor stub
	}


	public BoarderDTO(String w_number, String userID, String title, String passward, String content, String writeday) {
		super();
		this.w_number = w_number;
		this.userID = userID;
		this.title = title;
		this.passward = passward;
		this.content = content;
		this.writeday = writeday;
	}
	
	public BoarderDTO(String userID, String w_number, String comments) {
		this.w_number = w_number;
		this.comments = comments;
		this.userID = userID;
	}
	
	public void boarderDetailDto( ) {
		
	}


	public String getW_number() {
		return w_number;
	}


	public void setW_number(String w_number) {
		this.w_number = w_number;
	}


	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getPassward() {
		return passward;
	}


	public void setPassward(String passward) {
		this.passward = passward;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public String getWriteday() {
		return writeday;
	}


	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
	
	


	public String getComments() {
		return comments;
	}


	public void setComments(String comments) {
		this.comments = comments;
	}


	public String getComments_num() {
		return comments_num;
	}


	public void setComments_num(String comments_num) {
		this.comments_num = comments_num;
	}


	@Override
	public String toString() {
		return "BoarderDTO [w_number=" + w_number + ", userID=" + userID + ", title=" + title + ", passward=" + passward
				+ ", content=" + content + ", writeday=" + writeday + "]";
	}


	

	




	
	
	
	
	

}
