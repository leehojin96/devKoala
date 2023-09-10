package com.acorn.koala.dto;


public class UserDTO {
	
	private String userID;
	private String userPassword;
	private String userName;
	private String result;
	private String email;
	private String phoneNumber;
	private String birth;	
	private String addr1;
	private String addr2;
	private String addr3;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
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
	
	
	
	@Override
	public String toString() {
		return "UserDTO [userID=" + userID + ", userPassword=" + userPassword + ", userName=" + userName + ", result="
				+ result + ", email=" + email + ", phoneNumber=" + phoneNumber + ", birth=" + birth + ", addr1=" + addr1
				+ ", addr2=" + addr2 + ", addr3=" + addr3 + "]";
	}
	
	

	
	
}
