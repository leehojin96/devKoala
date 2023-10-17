package api;

import java.io.BufferedWriter;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;

public class KakaoLoginApi {

	@Autowired
	DataSource ds;

	// 인가코드 이용하여 토큰 가져오기
	public HttpURLConnection getAccessToekn(String authorize_code) throws Throwable {

		String reqURL = "https://kauth.kakao.com/oauth/token";
		URL url = new URL(reqURL);

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
		conn.setRequestMethod("POST");
		conn.setDoOutput(true);
		// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=5dc3fb6bc3e67d507cc996e1a4a49ec6"); // REST_API키 본인이 발급받은 key 넣어주기
		sb.append("&redirect_uri=http://localhost:8080/koala/kakaoLogin"); // REDIRECT_URI 본인이 설정한 주소 넣어주기
		sb.append("&code=" + authorize_code);
		
		bw.write(sb.toString());
		bw.flush();

		// 결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);

		return responseCode == 200?conn:null;
	}

	public HttpURLConnection getUserInfo(String access_Token) throws Throwable {

		String reqURL = "https://kapi.kakao.com/v2/user/me";

		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();

		conn.setRequestMethod("GET");

		// 요청에 필요한 Header에 포함될 내용
		conn.setRequestProperty("Authorization", "Bearer " + access_Token);

		// 결과 코드가 200이라면 성공
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);
			return responseCode == 200?conn:null;
		
	}

	

}
