package api;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.json.XML;

public class ApiBooks {

	// 베스트셀러 API
	public String getBestseller(int start, int categoryId) {

		// http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbst20352313001&QueryType=Bestseller&MaxResults=50&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big&CategoryId=0;
		String apiURL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx" + "?" + "ttbkey=ttbst20352313001" + "&"
				+ "QueryType=Bestseller" + "&" + "MaxResults=50" + "&" + "start=" + start + "&" + "SearchTarget=Book"
				+ "&" + "output=xml"// xml or JS
				+ "&" + "Version=20131101" + "&" + "Cover=Big" + "&" + "CategoryId=" + categoryId;

		// 결과
		Map<String, String> requestHeaders = new HashMap<String, String>();
		String responseBody = get(apiURL, requestHeaders);

		// XML -> JSONObecjt
		JSONObject resultObj = XML.toJSONObject(responseBody);

		// "object" key를 JSONObjext 객체로 생성
		JSONObject result = resultObj.getJSONObject("object");
		// System.out.println(result);

		return result.toString();
	}

	// 신간 도서 API
	public String getItemNewAll(int start, int categoryId) {

		// http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbst20352313001&QueryType=ItemNewAll&MaxResults=50&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big&CategoryId=0;
		String apiURL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx" + "?" + "ttbkey=ttbst20352313001" + "&"
				+ "QueryType=ItemNewAll" + "&" + "MaxResults=50" + "&" + "start=" + start + "&" + "SearchTarget=Book"
				+ "&" + "output=xml"// xml or json
				+ "&" + "Version=20131101" + "&" + "Cover=Big" + "&" + "CategoryId=" + categoryId;

		// 결과
		Map<String, String> requestHeaders = new HashMap<String, String>();
		String responseBody = null;
		try {
			responseBody = get(apiURL, requestHeaders);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// XML -> JSONObecjt
		JSONObject resultObj = XML.toJSONObject(responseBody);

		// "object" key를 JSONObjext 객체로 생성
		JSONObject result = resultObj.getJSONObject("object");

		return result.toString();
	}

	// 신간 인기 도서 API
	public String getItemNewSpecial(int start, int categoryId) {

		// http://www.aladin.co.kr/ttb/api/ItemList.aspx?ttbkey=ttbst20352313001&QueryType=ItemNewSpecial&MaxResults=50&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big&CategoryId=0;
		String apiURL = "http://www.aladin.co.kr/ttb/api/ItemList.aspx" + "?" + "ttbkey=ttbst20352313001" + "&"
				+ "QueryType=ItemNewSpecial" + "&" + "MaxResults=50" + "&" + "start=" + start + "&"
				+ "SearchTarget=Book" + "&" + "output=xml"// xml or json
				+ "&" + "Version=20131101" + "&" + "Cover=Big" + "&" + "CategoryId=" + categoryId;

		// 결과
		Map<String, String> requestHeaders = new HashMap<String, String>();
		String responseBody = get(apiURL, requestHeaders);

		// XML -> JSONObecjt
		JSONObject resultObj = XML.toJSONObject(responseBody);

		// "object" key를 JSONObjext 객체로 생성
		JSONObject result = resultObj.getJSONObject("object");

		return result.toString();
	}

	// 도서 검색 api
	public String getSearch(int start, int categoryId, String query) {

		// http://www.aladin.co.kr/ttb/api/ItemSearch.aspx?ttbkey=ttbst20352313001&Query=물고기&QueryType=Title&MaxResults=50&start=1&SearchTarget=Book&output=xml&Version=20131101&Cover=Big&CategoryId=0
		String apiURL = "http://www.aladin.co.kr/ttb/api/ItemSearch.aspx" + "?" + "ttbkey=ttbst20352313001" + "&"
				+ "Query=" + query + "&" + "QueryType=Title" + "&" + "MaxResults=50" + "&" + "start=" + start + "&"
				+ "SearchTarget=Book" + "&" + "output=xml" + "&" + "Version=20131101" + "&" + "Cover=Big" + "&"
				+ "CategoryId=" + categoryId;

		// 결과
		Map<String, String> requestHeaders = new HashMap<String, String>();
		String responseBody = get(apiURL, requestHeaders);

		// XML -> JSONObecjt
		JSONObject resultObj = XML.toJSONObject(responseBody);

		// "object" key를 JSONObjext 객체로 생성
		JSONObject result = resultObj.getJSONObject("object");

		return result.toString();
	}

	// 도서 상세 페이지
	public String getDetail(String isbn) {

		// http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx?ttbkey=ttbst20352313001&itemIdType=ISBN&ItemId=9791169472807&output=xml&Version=20131101&OptResult=ebookList,usedList,reviewList&Cover=Big
		String apiURL = "http://www.aladin.co.kr/ttb/api/ItemLookUp.aspx" + "?" + "ttbkey=ttbst20352313001" + "&"
				+ "itemIdType=ISBN" + "&" + "ItemId=" + isbn + "&" + "output=xml" + "&" + "Version=20131101" + "&"
				+ "OptResult=ebookList,usedList,reviewList" + "&" + "Cover=Big";

		// 결과
		Map<String, String> requestHeaders = new HashMap<String, String>();
		String responseBody = get(apiURL, requestHeaders);

		// XML -> JSONObecjt
		JSONObject resultObj = XML.toJSONObject(responseBody);

		// "object" key를 JSONObjext 객체로 생성
		JSONObject result = resultObj.getJSONObject("object");

		return result.toString();
	}

	//
	public static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 오류 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	
	public static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	
	//
	public static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line = null;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
		}
	}


}
