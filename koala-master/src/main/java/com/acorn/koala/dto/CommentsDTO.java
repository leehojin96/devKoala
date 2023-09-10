package com.acorn.koala.dto;

public class CommentsDTO {
	
	String userID;
	String w_number;
	String comments;
	String comments_num;
	String comments_dy;
	
	
	public CommentsDTO() {
		// TODO Auto-generated constructor stub
	}

	
	


	public CommentsDTO(String userID, String w_number, String comments) {
		super();
		this.userID = userID;
		this.w_number = w_number;
		this.comments = comments;
	}


	


	public String getComments_dy() {
		return comments_dy;
	}





	public void setComments_dy(String comments_dy) {
		this.comments_dy = comments_dy;
	}





	public String getUserID() {
		return userID;
	}


	public void setUserID(String userID) {
		this.userID = userID;
	}


	public String getW_number() {
		return w_number;
	}


	public void setW_number(String w_number) {
		this.w_number = w_number;
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
		return "CommentsDTO [userID=" + userID + ", w_number=" + w_number + ", comments=" + comments + ", comments_num="
				+ comments_num + ", comments_dy=" + comments_dy + "]";
	}


	
	
	
	
	
	
}
