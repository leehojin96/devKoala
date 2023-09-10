package com.acorn.koala.dto;

public class UserLogDto {
	String id;
	String logintime;
	
	public UserLogDto(String id, String logintime) {

		this.id = id;
		this.logintime = logintime;
	}
	public UserLogDto() {
		
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLogintime() {
		return logintime;
	}
	public void setLogintime(String logintime) {
		this.logintime = logintime;
	}
	
	
}
