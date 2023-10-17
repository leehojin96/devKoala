package service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import api.KakaoLoginApi;
import dao.UserDao;
import dto.UserDto;
import exception.CustomException;

@Service
public class KakaoLoginService {

	private static final Logger logger = LoggerFactory.getLogger(KakaoLoginService.class);

	@Autowired
	private KakaoLoginApi kakaoLoginApi;

	@Autowired
	private UserDao userDao;

	public UserDto getKakaoUser(String authorize_code) throws Throwable {

		HttpURLConnection conn = null;
		UserDto userDto = new UserDto();

		try {

			// 토큰 받기
			conn = kakaoLoginApi.getAccessToekn(authorize_code);
			String tokenResult = bufferedReader(conn);
			conn.disconnect();

			// JSON 파싱
			JSONObject tokenJson = new JSONObject(tokenResult);
			String accessToken = tokenJson.optString("access_token");
			String refreshToken = tokenJson.optString("refresh_token");

			// 검증 optString()은 값이 없을때 null대신 ""를 넣음 그래서 isEmpty()를 사용
			if (accessToken.isEmpty() || refreshToken.isEmpty()) {
				new Exception("Access token or refresh token is empty.");
			}

			// 토큰 이용하여 회원 정보 받기
			conn = kakaoLoginApi.getUserInfo(accessToken);
			String userResult = bufferedReader(conn);
			conn.disconnect();

			// JSON 파싱
			JSONObject userJson = new JSONObject(userResult);
			JSONObject kakaoAccount = userJson.optJSONObject("kakao_account");
			JSONObject kakaoProfile = kakaoAccount != null ? kakaoAccount.optJSONObject("profile") : null;

			// 검증 optJSONObject()는 객체없을시 null을 넣음
			if (kakaoProfile == null) {
				new Exception("Kakao profile or kakao_account is not found in the response.");
			}

			String nickname = kakaoProfile.optString("nickname");
			String email = kakaoAccount.optString("email");

			// 검증 optString()은 값이 없을때 null대신 ""를 넣음 그래서 isEmpty()를 사용
			if (nickname.isEmpty() || email.isEmpty()) {
				new Exception("Nickname or email is empty.");
			}

			logger.info("nickname : " + nickname + " / email : " + email);

			userDto.setUserName(nickname);
			userDto.setEmail(email);

			return userDto;

		}
//		catch (Throwable e) {
//			// 예외가 발생하면 로그를 남기고 예외를 다시 던질 수 있습니다.
//			logger.error("Kakao API 통신 중 오류 발생: " + e.getMessage(), e);
//			return userDto;
//		}
		finally {
			if (conn != null) {
				conn.disconnect();
			}
		}

	}

	public String bufferedReader(HttpURLConnection conn) throws Throwable {

		try (BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
			String line;
			StringBuilder result = new StringBuilder();
			while ((line = br.readLine()) != null) {
				result.append(line);
				System.out.println(line);
			}
			logger.info("response body : " + result);
			logger.info("result type : " + result.getClass().getName()); // java.lang.String

			return result.toString();
		} catch (IOException e) {
			// 예외 발생 시 로깅하고 예외를 던집니다.
			logger.error("응답을 읽는 중 오류 발생: " + e.getMessage(), e);
			throw new CustomException("API 응답 읽기 중 오류 발생");
		}
	}

	public int checkKakaoAuth(String email) throws Throwable{
		int kakaoAuth = userDao.getKakaoAuthByEmail(email);
		if(kakaoAuth>=0) {
			return kakaoAuth;
		}else if(kakaoAuth==-1) {
			logger.error("SQL con 익셉션");
			throw new Throwable("SQL con 익셉션");
		}else if(kakaoAuth==-2) {
			logger.error("카카오 테이블 중복 회원 존재 익셉션");
			throw new Throwable("카카오 테이블 중복 회원 존재 익셉션");
		}
			
		return kakaoAuth;
	}

	public String checkUserId(int kakaoAuth) throws Exception {

		String userId = userDao.getUserIdByKakaoAuth(kakaoAuth);
		return userId == null ? null : userId;

	}

	public void createKakaoUser(String email, String userName) throws Exception {
		if (email != null || userName != null)
			userDao.insertKakaoUser(email, userName);
	}

}

//	public Map<String, Object> jsonToMap(String resultJson) throws Throwable {
//
//		// jackson objectmapper 객체 생성
//		ObjectMapper objectMapper = new ObjectMapper();
//		// JSON String -> Map
//		Map<String, Object> result = objectMapper.readValue(resultJson, new TypeReference<Map<String, Object>>() {
//		});
//
//		return result;
//	}
