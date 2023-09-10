<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	$(document).ready(
			function() {

				//도서 고유 번호
				//let isbn13 = '${param.isbn13}';
				//console.log('${title}');

				//판매가 콤마 작업
				let priceSales = ${priceSales};
				let priceSalesCommas = priceSales.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#priceSales").html(priceSalesCommas + " 원");

				//정가 콤마 작업
				let priceStandard = ${priceStandard};
				let priceStandardCommas = priceStandard.toString().replace(	/\B(?=(\d{3})+(?!\d))/g, ",");
				$("#priceStandard").html(priceStandardCommas + " 원");

				// 총 금액 권수에 따라 실시간 금액 변경
				$("#booksVolume").on("propertychange change keyup paste input",function() {
							//총 금액 콤마 작업 
							let totalPrice = priceSales * this.value;
							let totalPriceCommas = totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
							$("#totalPriceH2").html(totalPriceCommas + " 원");
						});
				$("#totalPriceH2").html(priceSalesCommas + " 원");

				function toHtml(data) {
					let str = "";
				}

				$(".btn_right").click(function() {
					window.open("${link}");
				});

				let itemId = "${itemId}";
				console.log(itemId);

			});
</script>

<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Jua:400');

* {
	margin: 0px;
	padding: 0px;
}

section {
	display: bolck;
	margin: 0px auto;
	width: 1250px; //
	font-family: Jua;
}

#info_warp {
	width: 770px;
}

#detail_top {
	margin-top: 30px;
	padding-bottom : 20px;
	display: flex;
	width: 1250px;
	border-bottom: 1px solid #d3d3d3;
}

#img_wrap {
	width: 300px;
	height: 450px;
	box-shadow: 5px 5px 5px 5px #8b8b8b;
	border-radius: 15px 15px 15px 15px;
	margin: 30px 100px 0px 30px;
}

#img_wrap #img_cover {
	width: 300px;
	height: 450px;
	border-radius: 15px 15px 15px 15px;
}

#prev_img {
	width: 20px;
	height: 20px;
}

#prev_box {
	text-align: center;
	margin: 15px 0px 15px 0px;
}

#prev_box a {
	text-decoration: none;
	color: black;
	padding: 3px;
	border: 1px solid #c1c1c1;
	border-radius: 3px;
}

#prev_box a img {
	padding-top: 2px;
}

#book_info_top {
	width: 100%;
	overflow: hidden;
	height: auto;
	border-bottom: 2px solid black;
	padding-bottom: 25px;
}

#book_info_top p {
	color: gray;
}

#book_info_top h1 {
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 30px;
	font-weight: 500;
}

#book_info_mid {
	width: 100%;
	height: 190px;
}

#book_info_mid table {
	margin-top: 30px;
}

#book_info_mid #priceSales {
	font-size: 25px;
	font-weight: 500;
}

#book_info_mid #priceStandard {
	font-size: 14px;
	text-decoration: line-through;
}

#book_info_mid th {
	color: gray;
	text-align: left;
	width: 100px;
	height: 40px;
}

#book_info_mid span {
	color: gray;
}

#book_info_bottom {
	width: 100%;
	height: 160px; //
	background-color: purple;
}

#book_info_bottom select {
	width: 100%;
	height: 45px;
	margin-bottom: 20px;
}

#add_book {
	display: flex;
	background-color: #F2F2F2;
	width: 100%;
	height: 50px;
	line-height: 50px;
}

#total_price {
	display: flex;
	width: 100%;
	height: 50px;
	line-height: 50px;
}

#total_left {
	margin-right: 30px;
}

#booksVolume {
	width: 30px;
	height: 25px;
	margin-right: 20px;
}

input[type=number]::-webkit-inner-spin-button, input[type=number]::-webkit-outer-spin-button
	{
	opacity: 1;
}

#totalPrice {
	display: flex;
}

#totalPriceH2 {
	font-size: 30px;
	line-height: 45px;
	margin-left: 10px;
}

#button_wrap {
	width: 100%;
	height: 90px; //
	background-color: red;
	display: flex;
}

#button_wrap button {
	width: 380px;
	height: 60px;
	margin: auto;
	display: block;
	border: 0px;
	color: white;
}

#button_wrap .btn_left {
	background-color: gray;
}

#button_wrap .btn_right {
	background-color: black;
}
#detail_mid{
width: 1100px;
margin : 0px auto;
padding-top: 25px;
margin-bottom: 30px;

}
.midList{
display: flex;
}
.midList1{
}
.booksIntroduceLeft{
width: 15%;
font-size: 25px;
font-weight: normal;
}
.booksIntroduceRight{
width: 85%;
}
</style>
</head>
<body>



	<section>
		<div id="detail_top">
			<div id="img_wrap">
				<img id="img_cover" src="${cover}">
				<div id="prev_box">
					<a
						href="https://www.aladin.co.kr/shop/book/wletslookViewer.aspx?ItemId=${itemId}"
						onclick="window.open(this.href,'_blank','width=1800 , height=1050');return false;">
						<img id="prev_img"
						src="//image.aladin.co.kr/img/shop/2018/icon_prev_book.png">
						미리보기
					</a>
				</div>
			</div>
			<div id="info_warp">
				<div id="book_info_top">
					<p id="categoryName">${categoryName}</p>
					<h1 id="title">${title}</h1>
					<span id="author">${author} | ${publisher} | 출판 ${pubDate}</span>
				</div>

				<div id="book_info_mid">
					<table>
						<tr>
							<th>정가</th>
							<td id="priceStandard"></td>
						</tr>
						<tr>
							<th>판매가</th>
							<td id="priceSales"></td>
						</tr>

						<tr>
							<th>배송비</th>
							<td>무료배송 <span>*만원이상 구매 시</span></td>
						</tr>

						<tr>
							<th>도착 예정일<br> *
							</th>
							<td>2일 이내 도착 예정 <br> <span>(주말 및 공휴일 및 연휴 제외)</span></td>
						</tr>

					</table>
				</div>

				<div id="book_info_bottom">
					<!-- 
			<select>
				<option>연관도서</option>
				<option>영어</option>
				<option>국어</option>
				<option>사탐,과탐</option>
			</select>
			
			<div id ="add_book">
				<div id ="add_left">
					<span>한권으로 시작하는 수학: 수학(중)</span>
					<button type ="button">-</button>
					<input type = "text" value="1">
					<button type ="button">+</button>	
				</div>
				
				<div id ="add_right">
					<span>23,000원</span>
				</div>
			</div>
			-->
					<div id="total_price">
						<div id="total_left">수량</div>

						<div id="total_right">
							<input id="booksVolume" type="number" min="1" max="9" value="1">
						</div>
						<div id="totalPrice">
							총
							<h2 id="totalPriceH2"></h2>
						</div>
					</div>

					<div id="button_wrap">
						<button type="button" class="btn_left">장바구니</button>
						<button type="button" class="btn_right">구매하기</button>
					</div>

				</div>


			</div>
		</div>

		<div id="detail_mid">
			<div class="midList1 midList">
				<div class="booksIntroduceLeft">책 소개</div>
				<div class="booksIntroduceRight">${description}</div>
			</div>

		</div>


	</section>


	<%@ include file="../footer.jsp"%>
</body>
</html>