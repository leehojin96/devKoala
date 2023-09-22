package service;

import java.util.ArrayList;
import java.util.HashMap;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import api.ApiBooks;
import dto.BooksDetailDto;
import dto.BooksDto;

public class ApiBooksService {
	
	@Autowired
	ApiBooks apiBooks;
	
	public HashMap<String,Object> getBestseller(int start, int categoryId) {
		return fromJSONtoItems(apiBooks.getBestseller(start, categoryId));
	}
	
	public HashMap<String,Object> getItemNewAll(int start, int categoryId) {
		return fromJSONtoItems(apiBooks.getItemNewAll(start, categoryId));
	}

	public HashMap<String, Object> getItemNewSpecial(int start, int categoryId) {
		return fromJSONtoItems(apiBooks.getItemNewSpecial(start, categoryId));
	}

	public HashMap<String, Object> getSearch(int start, int categoryId, String query) {
		return fromJSONtoItems(apiBooks.getSearch(start, categoryId, query));
	}

	public BooksDetailDto getDetail(String isbn) {
		return fromJSONtoItems2(apiBooks.getDetail(isbn));
	}


	// 도서권수량 , 도서List -> map에 넣어서 return
	public HashMap<String, Object> fromJSONtoItems(String result) {

		JSONObject rjson = new JSONObject(result);
		// System.out.println("rjson = "+ rjson);

		int count = rjson.getInt("totalResults");
		// System.out.println("count = "+ count);

		JSONArray item = rjson.getJSONArray("item");
		// System.out.println("item = "+ item);

		HashMap<String, Object> map = new HashMap<>();

		ArrayList<BooksDto> booksDtoList = new ArrayList<BooksDto>();
		for (int i = 0; i < item.length(); i++) {
			JSONObject Json = item.getJSONObject(i);
			BooksDto booksDto = new BooksDto(Json);

			booksDtoList.add(booksDto);
		}

		map.put("list", booksDtoList);
		map.put("totalCnt", count);

		return map;
	}

	public BooksDetailDto fromJSONtoItems2(String result) {

		JSONObject rjson = new JSONObject(result);

		JSONObject item = rjson.getJSONObject("item");
		// System.out.println(item);

		BooksDetailDto booksDetail = new BooksDetailDto(item);

		return booksDetail;

	}



	
	
}
