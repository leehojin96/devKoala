package com.acorn.koala.dto;

public class UserMypageDto {
	
	String userID;
	String userName;
	String rpemail;
	String email;
	String rpphoneNumber;
	String phoneNumber;
	String addr1;
	String addr2;
	String addr3;
	
	

	
	public UserMypageDto(String userID, String userName, String rpemail, String email, String rpphoneNumber,
			String phoneNumber, String addr1, String addr2, String addr3) {
		this.userID = userID;
		this.userName = userName;
		this.rpemail = rpemail;
		this.email = email;
		this.rpphoneNumber = rpphoneNumber;
		this.phoneNumber = phoneNumber;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
	}




	public UserMypageDto() {
	}




	public String getUserID() {
		return userID;
	}




	public void setUserID(String userID) {
		this.userID = userID;
	}




	public String getUserName() {
		return userName;
	}




	public void setUserName(String userName) {
		this.userName = userName;
	}




	public String getRpemail() {
		return rpemail;
	}




	public void setRpemail(String rpemail) {
		this.rpemail = rpemail;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getRpphoneNumber() {
		return rpphoneNumber;
	}




	public void setRpphoneNumber(String rpphoneNumber) {
		this.rpphoneNumber = rpphoneNumber;
	}




	public String getPhoneNumber() {
		return phoneNumber;
	}




	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}




	public String getAddr1() {
		return addr1;
	}




	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}




	public String getAddr2() {
		return addr2;
	}




	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}




	public String getAddr3() {
		return addr3;
	}




	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}



	
	
	
}
