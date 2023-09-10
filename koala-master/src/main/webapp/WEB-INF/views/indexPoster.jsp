<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.12.4.js"></script>
  <script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  
  
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Jua:400');
@import url('https://fonts.googleapis.com/css2?family=Indie+Flower&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Abril+Fatface&display=swap');
//@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Nanum+Myeongjo:wght@800&display=swap');
*{
	//font-family: 'Indie Flower', cursive;
	//font-family: 'Abril Fatface', cursive;
	font-family: 'Nanum Myeongjo', serif;
	
}
#section_wrap{
	display: flex;
	margin: auto;
	width: 1450px;	
	height:750px;
	background-position : center;
	background-size: cover;
}

#top{
	margin: auto;
	width: 1450px;
}


#nav_wrap{
	display: none;
	margin: auto;
	width: 1450px;
}
#logo{
	width:270px;
	height:135px;
	background-image: url("https://i.ibb.co/j5RbKT0/Kakao-Talk-20221229-151143932.jpg");
	background-position: center;
	background-size: cover;
	margin: 0px 100px 0px 100px;
}
#nav_wrap ul{
	display: flex;
}
#nav_wrap ul li{
	//font-family:Jua;
	height: 110px;
	width: 210px;
	font-size: 30px;
	line-height: 110px;
	list-style: none;
}


#nav_wrap ul li a{
	text-decoration: none;
	color: #653300;
	//color: black;
}



#message_wrap{
	width: 100%;
	height: 800px;
	background-color: black;
	padding-top: 200px;
	margin: auto;
}
#message{
	width: 1100px;
	//font-family:Jua;
	//font-family: 'Indie Flower', cursive;
	height: 500px;
	margin: auto;
	background-color: white; //#b0f5b0;
	text-align: center;
	font-size: 110px;
	font-weight: 900;
	line-height: 500px;
	display: none;
	
	

	
}

#message span{
	font-size:130px;
	//font-family:Jua;
	//color: #563124;
	font-weight: 900;
	
	
}


.first{
	width: 1450px;
	height: 600px;
	margin: auto;
	text-align: center;
	font-size: 80px;
	position: relative;
	padding-top: 120px;
	background-size:cover;
  	background-position:center;
}

.first h1{
	margin:0px;
}

.first p{
	font-size: 30px;
	line-height: 20px;
}

.first::after{
  width: 1450px;
  height: 600px;
  content: "";
  background: url("https://img.freepik.com/premium-photo/pile-of-books-on-the-table-at-the-library_130388-600.jpg?size=626&ext=jpg&ga=GA1.1.512915506.1671419081&semt=sph");
  //background-color:red;
  background-size:contain;
  background-position:center;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.4;

}
 
.second{
	width: 1450px;
	height: 600px;
	margin: auto;
	text-align: center;
	font-size: 80px;
	position: relative;
	padding-top: 120px;
	background-size:cover;
  	background-position:center;
  	//display: none;
}
.second h1{
	margin:0px;
}

.second::after{
  width: 1450px;
  height: 600px;
  content: "";
   background: url("https://img.freepik.com/free-photo/book-in-library-with-open-textbook_1150-5916.jpg?size=626&ext=jpg&ga=GA1.1.512915506.1671419081&semt=sph");
  //background-color:red;
  background-size:contain;
  background-position:center;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  opacity: 0.4;

}

#second p{
	font-size: 30px;
	line-height: 20px;
}














#section_wrap img{
	width:0px;
	height:0px;
	margin: 80px 0px 0px 100px;
	border-radius: 100px;
}
#section_wrap img.grow-img{
	width: 600px;
	height: 600px;
}


#book_text{
	width:600px;
	height:600px;
	//background-color: yellow;
	margin-top: 80px;
	//text-align: center;
	padding-left: 100px; 
	//display: none;
}

#book_text h1{
	margin : 100px 0px 40px 0px;
	font-size: 80px;
	//text-decoration: underline;
	color: #653300;
	
}

#book_text p{
	font-size: 30px;
}
#book_text input{
	//font-family:Jua;
	width: 250px;
	height: 80px;
	margin-top: 30px; 
	background-color: #eac896;
	border: 0px;
	border-radius: 20px;
	font-size: 20px;
	//display: block;
}

.animate, .grow-img{
	transition: 2s; 
}

@keyframes fadeIn{
	0%{opacity:0;}
	100%{opacity:1;}
}


#members{
	width: 1450px;
	height: 300px;
	//background-color: red;
	text-align: center;
	font-size: 40px;
	margin: auto;
}

#member_wrap{
	width: 1450px;
	height: 500px;
	margin: auto;
	display: flex;

}

#member{
	width: 100%;
	height: 350px;
	text-align: center;
	//border: 1px solid black;
	margin: 0px 20px;
	
	
}
#member img{
	width: 250px;
	height: 200px;
	background-size: cover;
	background-position: center;
}



	
	
	


</style>

<script>

// 윈도우 준비
$(document).ready( function(){
	
	//시작시 나타났다 사라지는 화면
	$("#message").show("fold",2000,function(){
		setTimeout(function(){
			//$("#message").css("margin-top","11%");
			$("#message").hide("explode",2000, function(){
				$("#message_wrap").css("display","none");
				$("#nav_wrap").css("display","flex");
				$("#Goup").css("display","block");
			});
		},1000);
		
	});
	
	
	
	/*	위에있는 사진 바뀌는거 실패
	
	setTimeout( function(){
		$("");
		 $( ".first" ).toggleClass( "second", 3000, "slide");
	},6000);
	
	*/
	
	
	

	//맨위로 버튼
	$("#Goup").click( function(){
		//console.log("위로갑니다");
		window.scrollTo({ top: 0, behavior: "smooth" });
	});

		
		var $menu = $("#nav_wrap ul li"); //네비에있는 li하나하나를 담은 변수?
				
		var $contents = $("section > #section_wrap"); //section에 있는 #section_wrap <div>들을 담은 변수?
		
		//네비에 있는 카테고리로 이동하는 코드
		$menu.click(function(x){  
			x.preventDefault();		// li에있는 a href 변수제거
			var idx = $(this).index(); // $menu의 인덱스 번호   즉, 클릭한 li가 몇번째인지 알기위한 변수
			//console.log(idx); // 네비에 있는 li를 눌르면서 console창 확인
			
			var section = $contents.eq(idx);  //이동할 section의 개수를 확인 ★★★★ 네비에 있는 li의 개수와 누르면 이동할 section의 개수가 동일해야한다.
			//console.log(section);   //마찬가지로 li를 누르면서 인덱스 확인
					
			var section_distance = section.offset().top;  //sectioin이 맨위로 부터 얼마나 떨어져있는지 확인하는 코드
			//console.log(section_distance);	//이것도 마잔가지로 li를 누르면서 나오는 값 확인하기
			$("html").stop().animate({ scrollTop:section_distance }); //클릭시 이동할 거리를 전에 확인한  section_distance으로 이동시키는 코드
		});
		
		
		
		
		//이미지 나오게하기
		var $offset = 1300;		//그림이 나오는걸 눈으로 볼수있게 section의 값보다 살짝 밑에서 효과를 보이기위한 값(변수)
		
		var $device =$(".section01"); 	//첫번째 section				//이건제가 해보고싶었는데 실패한거 신경쓰지 말것 {$(".section01"),$(".section02"),$(".section03")};
		var $device2 =$(".section02");	//두번째 section
		var $device3 =$(".section03");	//세번째 section
		var $device4 =$(".section04");	//네번째 section
		
		var $deviceOST = $device.offset().top - $offset;		//section의 길이보다 1500 을 빼면서 효과가 나타날 변수 설정
		var $deviceOST2 = $device2.offset().top - $offset;
		var $deviceOST3 = $device3.offset().top - $offset;
		var $deviceOST4 = $device4.offset().top - $offset;
		
		
		$(window).scroll( function (){	
			/* 이것도 내가 실패한거 나중에 해볼게요
			
			$contents.each( function(content){
				if( $(window).scrollTop() > $deviceOST){ //스크롤이 $deviceOST를 넘어설때 실행
					$(content).find("img").addClass("grow-img");
					console.log($(".grow-img"));
				}
			});
			*/
			
			if( $(this).scrollTop() > $deviceOST){ 		//스크롤이 OST를 넘어서면 실행
				$device.find("img").addClass("grow-img",function(){   	//$device 즉 ".section01"에서 img를 찾아서 addClass를 한 코드
					setTimeout(function(){
					$device.find("#book_text").find("h1").show( "blind", 500 ,function(){
						$device.find("#book_text").find("p").show( "blind", 500,function(){
							$device.find("#book_text").find("input").show( "blind", 500 );
						} );
					});
					},1500);
				});			
				
			}
			
			if($(window).scrollTop() > $deviceOST2){
				$device2.find("img").addClass("grow-img", function(){
					setTimeout(function(){
					$device2.find("#book_text").find("h1").show( "slide", 1000 );
					$device2.find("#book_text").find("p").show( "slide", 2000 );
					$device2.find("#book_text").find("input").show( "slide", 2000 );
					},1000);
				});	
			}
			
			if($(window).scrollTop() > $deviceOST3){
				$device3.find("img").addClass("grow-img");
			}
			if($(window).scrollTop() > $deviceOST4){
				$device4.find("img").addClass("grow-img");
			}
			if($(window).scrollTop() > $deviceOST4+300){
				$device4.find("#book_text").find("h1").show( "clip", 1000 );
				$device4.find("#book_text").find("p").show( "clip", 2000 );
				$device4.find("#book_text").find("input").show( "clip", 2000 );
			}
			if($(window).scrollTop() > $deviceOST4+600){
				$("#members").find("h1").show("slide", 1000 );
			}
			if($(window).scrollTop() > $deviceOST4+1000){
				$(".leehojin").show("slide", 500, function(){
					$(".limyeongbin").show("slide", 500, function(){
						$(".kimjunsou").show("slide", 500, function(){
							$(".kimsoyoung").show("slide", 500);
						});
					});
				});
				
			}
		});
		
		$("#books").click(function() {
			window.location.href = "/koala/Bestseller";
		});

});







</script>
</head>
<body>



<section>

<div id ="message_wrap">
	<div id = "message">
	<div></div>
		Rest with <span>'Koala'</span>
	</div>
</div>

<div id ="top">
	<div id ="nav_wrap">
	
		<div id="logo">	</div>
		
		<ul>
			
			<li><a href="#">Books</a></li>
			<li><a href="#">Store</a></li>
			<li><a href="#">Delivery</a></li>
			<li><a href="#">Koala Premium</a></li>
			
		</ul>
	</div>
</div>




<div class ="first">
	<div class = "first_text">
		<h1>Rest With <span>'Koala'</span></h1>
		<p> 'Koala'는 E-Book이상의 서비스를 제공합니다. </p>
		<p> 지친 일상으로 부터 벗어나고 싶을때 koala와 함께하세요 </p>
	</div>
</div>






<div id="section_wrap" class ="section01" >

	<img class ="" alt="" src="https://newsimg.hankookilbo.com/cms/articlerelease/2020/04/21/202004211422083541_3.jpg">	
	<div id ="book_text">
		<h1 style="display: none;">Books</h1>
		<p style="display: none;">Koala의 책은 매일매일 업데이트 됩니다</p>
		<p style="display: none;">신규도서 찾을때는 Koala!</p>
		<input id="books" type="button" value = "책 찾으러가기" style ="display: none;">
	</div>	
</div>

<div id ="section_wrap" class ="section02" >
	<div id ="book_text"  >
		
		<h1 style="color: green; display: none;">Store</h1>
		<p style="display: none;">Koala는 오프라인으로도 만날수있어요</p>
		<p style="display: none;" >오프라인매장에서 숲속을 느껴보세요!</p>
		<input id="store" type="button" value = "가까운 오프라인매장 찾기" style="background-color: #a5df61; display: none;">
	</div>
	
	<img alt="" src="https://img.freepik.com/premium-photo/green-forest-trees-nature-green-wood-sunlight-backgrounds_87394-14873.jpg?w=2000" style="margin-right:100px; ">
</div>

<div id ="section_wrap" class ="section03">

	<img alt="" src="https://img.freepik.com/free-photo/delivery-truck-with-gift-box-present-surprise-or-free-shipping-fast-delivery-car-deliver-express-delivery-transportation-logistics-concept-background-3d-rendering-illustration_56104-2062.jpg?size=626&ext=jpg&ga=GA1.2.512915506.1671419081&semt=sph">
	<div id="book_img"></div>
	
	<div id ="book_text">
		<h1 style="color:#e98484; ">Delivery</h1>
		<p >Koala는 구매 즉시 배송이 시작됩니다</p>
		<p >책 읽는 시간은 길게, 기다리는 시간은 짧게!</p>
		<input id = "delivery" type="button" value = "책 구매하러가기" style="background-color: #f0baba; ">
	</div>	

</div>

<div id ="section_wrap" class ="section04">

	<div id ="book_text">
		<h1 style="color: #6a6a6a; display: none;">Koala<br>Premium</h1>
		<p style="display: none;">프리미엄 구매시 E-Book, 배송비 무료!</p>
		<input id="Premium" type="button" value = "1개월 무료체험하기" style="background-color: #434242; color: white; display: none;">
	</div>

	<img alt="" src="https://img.freepik.com/premium-vector/smile-logo-template_8163-40.jpg?size=338&ext=jpg&ga=GA1.2.512915506.1671419081" style="margin-right:100px; ">
</div>


<div id ="members">
	<h1 style="display: none;">임원진 소개</h1>
</div>

<div id ="member_wrap">
<div style="width:390px; ">
	<div id="member" class="leehojin" style=" display: none;" >
		<img src="https://file.namu.moe/file/17aab671deedb3a743a473a1a8e9ea26793fbf3171d50e43b13a82adf65b5ccf6a651e1a13dd4c8ee92499f2dc68486e">
		<h1>이호진</h1>
	</div>
</div>
	
<div style="width:335px; ">
	<div id="member" class="limyeongbin" style="display: none;">
		<img src="https://cdn.ilyoseoul.co.kr/news/photo/200801/15672_2267_0701.gif">
		<h1>임영빈</h1>
	</div>
</div>

<div style="width:335px; ">
	<div id="member" class="kimjunsou" style="display: none;">
		<img src="https://w.namu.la/s/e49cec3f1eb38939799f76537bdfcb5d18c539d19a817fcfaba6c4ecdf0c9e33fc18af8bc780e2ac36e3ef6af8d21533fdc39e0b7fa6d840e9b22895b3671f520b32d3e39458a9885c24c000a533db556401242db3ada539d73365fd2bce893c695704ea4fb755112d7af100cad22b56">
		<h1>김준서</h1>
	</div>
</div>
	
<div style="width:390px; ">
	<div id="member" class="kimsoyoung" style="margin-right: 120px; display: none;">
		<img src="https://images.squarespace-cdn.com/content/v1/5f98dd49fc08965e7b06cfac/1618506418948-HR75F331VLD3NM6NGA37/download.jpg?format=750w">
		<h1>김소영</h1>
	</div>
</div>
</div>





<div id ="Goup" style="position: fixed; right: 40px; bottom: 40px; display: none;">
<input type = "button" value="UP" style="width: 40px; height: 40px; background-color:#8f9c8f; color: black; border-radius: 20px; border: 0px;">
</div>


</section>



<%@ include file="footer.jsp"%>
</body>
</html>