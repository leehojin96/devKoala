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
						
						//검색 String						
						let query = '${param.query}' ;
						
						//페이지 번호
						let start = 1;
						let startPart = 0;
						let totalPage;
						
						//카테고리 번호
						let categoryId = 0;
						
						//데이터 권수 변수
						//let data_totalBooks=0;

						//메인 함수
						function showList(start,categoryId) {
							//alert("showList() 실행");
							$.ajax({
								type : "GET",
								url : "/koala/books/Search",
								data : {start : start, categoryId : categoryId, query:query},
								success : function(data) {	
									
									//console.log(data);
									
									let data_item = data.list;
									let data_totalBooks = data.totalCnt;
									console.log(data_totalBooks);
									
									let dataHtml = toHtml(data_item);

									$("#bookEmpty").html(dataHtml);
									
									let dataPageHtml = pageNumberCreate(data_totalBooks);
									
									$("#paging").html(dataPageHtml);
									$("#selectState1").html("'"+query+"' 검색 결과 ("+data_totalBooks+")");
								},
								error : function() {
									$("#bookEmpty").html("");
									$("#selectState1").html("'"+query+"' 검색 결과 (0)");
									$("#selectState4").html("도서를 지원하지 않습니다... ");
									$("#paging").html("");
								}
							});
							
						}

						
						//ArrayList<BooksDto> 타입 -> 반복분 통해 한권씩 데이터 뽑아내고 html 형식으로 변환
						function toHtml(data) {
							//alert("toHtml" + data);
							
							let str = "";
							for (let i = 0; i < data.length; i++) {
								let item = data[i];
									str += "<a href="
										+ "javascript:detail('" + item.isbn + "') "
										+ "onmouseenter='zoomIn(event)' onmouseleave='zoomOut(event)'>" // 마우스 호버 애니메이션
										+ "<div id='book'>"
										+ "<div id='bookImg'>"
										+ "<img id='cover' src='" +item.cover + "'>"
										+ "</div>" + "<div id='bookInfo'>"
										+ "<div id='title'>" + item.title
										+ "</div>" + "<div id='author'>"
										+ item.author + "</div>"
										+ "<div id='priceStandard'>"
										+ item.priceStandard + " 원</div>"
										+ "</div> </div> </a>";
							}
							return str;
						}
						
						//권수에 따라 페이지 번호 생성
						function pageNumberCreate(data_totalBooks) {
							totalPage = data_totalBooks / 50;
							if (totalPage % 1 != 0)
								totalPage++;
							
							totalPage = totalPage/1;
							console.log(totalPage);
							
							
							let str = "";
							
							// 한 파트에 6개 이상 페이지 보일 수 있는 경우
							if((startPart+1)*6 <= totalPage){				
								for (let i = 1+(startPart*6); i <= 6+(startPart*6) ; i++) {
									if(start==i)
									str += "<input class='pageBtn' type='button' style='font-weight : 900 ;' value='"+i+"'/>";
									else
									str += "<input class='pageBtn' type='button' value='"+i+"'/>";
									}
							}else{ // 한 파트에 6개 미만 페이지 보일 수 있는 경우 : 마지막 파트를 위한 코드
								for (let i = 1+(startPart*6); i <= totalPage ; i++) {
									if(start==i)
									str += "<input class='pageBtn' type='button' style='font-weight : 900 ;' value='"+i+"'/>";
									else
									str += "<input class='pageBtn' type='button' value='"+i+"'/>";
									}
							}
							return str;
							}
						
						//첫 로드
						showList(start,categoryId);
						 
						//페이지 번호 클릭시 
						$(document).on('click', '.pageBtn', function() {
							start = this.value;
							showList(start, categoryId);
							window.scrollTo(0, 0);
						});
						
						//partBtn 클릭시
						$(document).on('click', '.partBtn', function() {
							
							if(this.value == '<'){
								//첫번째 part일 경우 1페이지로								
								if(startPart == 0){
									start=1;
									window.scrollTo(0, 0);
									showList(start, categoryId);
									
								}else{ //그 외 이전 파트의 첫번째 페이지로
									startPart--;
									start = startPart*6 + 1;
									showList(start, categoryId);
									window.scrollTo(0, 0);
								}
							}else{
								if(this.value == '>'){
									//마지막 part일 경우 마지막 페이지로
									if(1 > totalPage/6 - startPart){
										start = totalPage;
										showList(start, categoryId);
										window.scrollTo(0, 0);
										
									}else{ // 그 외 다음 파트의 첫번째 페이지로
										startPart++;
										start = startPart*6 + 1;
										showList(start, categoryId);
										window.scrollTo(0, 0);
									}
								}
							}
						});
							
						
						//대분류 카테고리 클릭시
						$(document).on('click', ".selectInput", function() {
							$(".Middle").hide();
							categoryId = this.value;
							start = 1;
							window.scrollTo(0,0); 	
							showList(start,categoryId);
							$("."+this.value).show();
							$("#"+this.value+"Middle").prop('checked',true);
							$("#selectState2").html(" > "+$("#"+this.value+"Top").next().text());
							if(categoryId == '0'){								
							$("#selectState3").html("");
							}else{
								$("#selectState3").html(" > 전체");
							}
						});
						
						//소분류 카테고리 클릭시
						$(document).on('click', ".selectMiddle", function() {
							categoryId = this.value;
							start = 1;
							window.scrollTo(0,0); 	
							showList(start,categoryId);
							let a = $("input[id="+this.value+"Middle]:checked").next().text();
							$("#selectState3").html(""+a);
						});
					});
	//도서 클릭시 실행 함수
	function detail(isbn) {
		window.location.href = "/koala/books/Detail?isbn=" + isbn;
	}
	
</script>


</head>
<body>

	
	<%@ include file="booksList.jsp"%>
	

	<%@ include file="../footer.jsp"%>

</body>
</html>