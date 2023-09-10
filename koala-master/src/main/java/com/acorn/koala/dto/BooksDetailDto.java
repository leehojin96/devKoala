package com.acorn.koala.dto;

import org.json.JSONObject;

public class BooksDetailDto {
	String title;
	String link;
	String author;
	String pubDate;
	String description;
	Object isbn;
	Object isbn13;
	Object itemId;
	int priceSales;
	int priceStandard;
	int mileage;
	String cover;
	int categoryId;
	String categoryName;
	String publisher;
	int customerReviewRank;
	
	public BooksDetailDto(JSONObject json) {
		this.title = json.getString("title");
		this.link = json.getString("link");
		this.author = json.getString("author");
		this.pubDate = json.getString("pubDate");
		this.description = json.getString("description");
		this.isbn = json.get("isbn");
		this.isbn13 = json.get("isbn13");
		this.itemId = json.get("itemId");
		this.priceSales = json.getInt("priceSales");
		this.priceStandard = json.getInt("priceStandard");
		this.mileage = json.getInt("mileage");
		this.cover = json.getString("cover");
		this.categoryId = json.getInt("categoryId");
		this.categoryName = json.getString("categoryName");
		this.publisher = json.getString("publisher");
		this.customerReviewRank = json.getInt("customerReviewRank");
	}
	
	

	


	public BooksDetailDto(String title, String link, String author, String pubDate, String description, Object isbn,Object isbn13,Object itemId,
			int priceSales, int priceStandard, int mileage, String cover, int categoryId, String categoryName,
			String publisher, int customerReviewRank) {
		super();
		this.title = title;
		this.link = link;
		this.author = author;
		this.pubDate = pubDate;
		this.description = description;
		this.isbn = isbn;
		this.isbn13 = isbn13;
		this.itemId = itemId;
		this.priceSales = priceSales;
		this.priceStandard = priceStandard;
		this.mileage = mileage;
		this.cover = cover;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
		this.publisher = publisher;
		this.customerReviewRank = customerReviewRank;
	}






	public BooksDetailDto() {
		super();
		// TODO Auto-generated constructor stub
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getLink() {
		return link;
	}



	public void setLink(String link) {
		this.link = link;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getPubDate() {
		return pubDate;
	}



	public void setPubDate(String pubDate) {
		this.pubDate = pubDate;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public int getPriceSales() {
		return priceSales;
	}



	public void setPriceSales(int priceSales) {
		this.priceSales = priceSales;
	}



	public int getPriceStandard() {
		return priceStandard;
	}



	public void setPriceStandard(int priceStandard) {
		this.priceStandard = priceStandard;
	}



	public int getMileage() {
		return mileage;
	}



	public void setMileage(int mileage) {
		this.mileage = mileage;
	}



	public String getCover() {
		return cover;
	}



	public void setCover(String cover) {
		this.cover = cover;
	}



	public int getCategoryId() {
		return categoryId;
	}



	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}



	public String getCategoryName() {
		return categoryName;
	}



	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}



	public String getPublisher() {
		return publisher;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}






	public Object getIsbn() {
		return isbn;
	}






	public void setIsbn(Object isbn) {
		this.isbn = isbn;
	}






	public int getCustomerReviewRank() {
		return customerReviewRank;
	}






	public void setCustomerReviewRank(int customerReviewRank) {
		this.customerReviewRank = customerReviewRank;
	}


	



	public Object getIsbn13() {
		return isbn13;
	}






	public void setIsbn13(Object isbn13) {
		this.isbn13 = isbn13;
	}






	public Object getItemId() {
		return itemId;
	}






	public void setItemId(Object itemId) {
		this.itemId = itemId;
	}






	@Override
	public String toString() {
		return "BooksDetailDto [title=" + title + ", link=" + link + ", author=" + author + ", pubDate=" + pubDate
				+ ", description=" + description + ", isbn=" + isbn + ", isbn13=" + isbn13 + ", itemId=" + itemId
				+ ", priceSales=" + priceSales + ", priceStandard=" + priceStandard + ", mileage=" + mileage
				+ ", cover=" + cover + ", categoryId=" + categoryId + ", categoryName=" + categoryName + ", publisher="
				+ publisher + ", customerReviewRank=" + customerReviewRank + "]";
	}


	


	

}
