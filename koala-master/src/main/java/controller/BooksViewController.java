package controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import dto.BooksDetailDto;
import service.ApiBooksService;

@Controller
public class BooksViewController {

	@Autowired
	ApiBooksService apiBooksService;

	// 도서 종합 이동
	@RequestMapping(value = "/books", method = RequestMethod.GET)
	public String booksView() {

		return "/books/books";
	}

	// 베스트셀러 이동
	@RequestMapping(value = "/Bestseller", method = RequestMethod.GET)
	public String bestsellerView() {

		return "/books/bestseller";
	}

	// 베스트셀러 리스트
	@ResponseBody
	@RequestMapping(value = "/books/Bestseller", method = RequestMethod.GET)
	public HashMap<String, Object> getbestsellerListView(int start, int categoryId) {

		return apiBooksService.getBestseller(start, categoryId);
	}

	// 신간도서 이동
	@RequestMapping(value = "/ItemNewAll", method = RequestMethod.GET)
	public String itemNewAllView() {

		return "/books/itemNewAll";
	}

	// 신간도서 리스트
	@ResponseBody
	@RequestMapping(value = "/books/ItemNewAll", method = RequestMethod.GET)
	public HashMap<String, Object> getItemNewAllData(int start, int categoryId) {

		return apiBooksService.getItemNewAll(start, categoryId);
	}

	// 신간 인기 도서 이동
	@RequestMapping(value = "/ItemNewSpecial", method = RequestMethod.GET)
	public String itemNewSpecialView() {

		return "/books/itemNewSpecial";
	}

	// 신간 인기 도서 리스트
	@ResponseBody
	@RequestMapping(value = "/books/ItemNewSpecial", method = RequestMethod.GET)
	public HashMap<String, Object> getItemNewSpecial(int start, int categoryId) {

		return apiBooksService.getItemNewSpecial(start, categoryId);
	}

	// 검색 도서 이동
	@RequestMapping(value = "/Search", method = RequestMethod.GET)
	public String booksSearchView(String query) {

		return "/books/booksSearch";
	}

	// 검색 도서 리스트
	@ResponseBody
	@RequestMapping(value = "/books/Search", method = RequestMethod.GET)
	public HashMap<String, Object> getSearch(int start, int categoryId, String query) {

		return apiBooksService.getSearch(start, categoryId, query);
	}

	// 도서 상세 이동
	@RequestMapping(value = "/books/Detail", method = RequestMethod.GET)
	public String booksDetailView() {

//		BooksDetailDto booksDetail = apiBooksService.getDetail(isbn);
//
//
//		m.addAttribute("title", booksDetail.getTitle());
//		m.addAttribute("link", booksDetail.getLink());
//		m.addAttribute("author", booksDetail.getAuthor());
//		m.addAttribute("pubDate", booksDetail.getPubDate());
//		m.addAttribute("description", booksDetail.getDescription());
//		m.addAttribute("isbn", booksDetail.getIsbn());
//		m.addAttribute("isbn13", booksDetail.getIsbn13());
//		m.addAttribute("itemId", booksDetail.getItemId());
//		m.addAttribute("priceSales", booksDetail.getPriceSales());
//		m.addAttribute("priceStandard", booksDetail.getPriceStandard());
//		m.addAttribute("mileage", booksDetail.getMileage());
//		m.addAttribute("cover", booksDetail.getCover());
//		m.addAttribute("categoryId", booksDetail.getCategoryId());
//		m.addAttribute("categoryName", booksDetail.getCategoryName());
//		m.addAttribute("publisher", booksDetail.getPublisher());

		return "/books/detail";
	}
	
	@ResponseBody
	@RequestMapping(value="/books/detail/model" , method = RequestMethod.GET)
	public BooksDetailDto getBooksDetailView(String isbn) {
		return apiBooksService.getDetail(isbn);
	}

}
