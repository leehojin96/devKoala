package dto;

public class KakaoUserDto {

	private int kakaoAuth;
	private String email;
	private String userName;

	public int getKakaoAuth() {
		return kakaoAuth;
	}

	public void setKakaoAuth(int kakaoAuth) {
		this.kakaoAuth = kakaoAuth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public KakaoUserDto() {
	}

}
