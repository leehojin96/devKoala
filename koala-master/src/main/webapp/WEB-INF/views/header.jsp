<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js"
	charset="utf-8"></script>
<script>
	$(document).ready(function() {
		$(".menu").mouseenter(function() {
			$(".menu").stop().animate({
				height : "280px"
			}, 300, 'swing');
			$(".header_sl").stop().animate({
				height : "280px"
			}, 300);
			$(".header_section").stop().animate({
				height : "280px"
			}, 300);
			$(".header_wrap").stop().animate({
				height : "280px"
			}, 300);
			$("header").stop().animate({
				height : "280px"
			}, 300);
			$(".submenu").show();
		});

		$(".header_sl").mouseleave(function() {
			$(".menu").stop().animate({
				height : "65px"
			}, 500);
			$(".header_sl").stop().animate({
				height : "80px"
			}, 300);
			$(".header_section").stop().animate({
				height : "160px"
			}, 300);
			$(".header_wrap").stop().animate({
				height : "160px"
			}, 300);
			$("header").stop().animate({
				height : "160px"
			}, 300);
			$(".submenu").hide();
		});

	});
	Kakao.init('cd19a2be4e5a00bdbf0cb07a178907dc');

	function kakaoLogout() {
		if (Kakao.Auth.getAccessToken()) {
			Kakao.API.request({
				url : '/v1/user/unlink',
				success : function(response) {
					location.href = "/koala/kakaoLogout";

				},
				fail : function(error) {
					console.log("error : "+error)
				},
			})
			Kakao.Auth.setAccessToken(undefined);
		}
	}
	
	function chatPopupOpen() {
		var popUrl = "/koala/chat";
        var popOption = "scrollbars=no,resizable=no,status=no,menubar=no,width=550, height=710, top=0,left=0";
        window.open(popUrl,"chatt", popOption);
	}
</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Jua:400');

* {
	margin: 0px;
	padding: 0px;
}

header {
	width: 1250px;
	height: 160px;
	margin: 0 auto;
	padding-bottom: 10px;
	border-bottom: 1px solid green;
}

.header_wrap {
	display: flex;
}

.header_logo {
	width: 300px;
	height: 160px;
	/*border:1px solid black; */
}

.header_logo img {
	width: 290px;
	height: 160px;
}

.header_login {
	width: 948px;
	height: 45px;
	/*border:1px solid black; */
}

header .header_sl {
	width: 948px;
	height: 80px;
	/*border:1px solid black; */
	margin-top: 30px;
	display: flex;
}

header .header_section .header_login {
	text-align: right;
}

header .header_section .header_login .home_icon {
	width: 12px;
	height: 12px;
	margin-right: 5px;
}

header .header_section .header_login span {
	margin-left: 4px;
	margin-right: 4px;
	line-height: 40px;
	color: gray;
	font-size: 11px;
	font-weight: bold;
	font-family: Jua;
}

header .header_section .header_login span a {
	text-decoration: none;
	font-size: 15px;
	color: gray;
	font-family: Jua;
	font-weight: lighter;
}

header .header_section .header_sl .searchbar {
	width: 210px;
	height: 35px;
	margin: 13px 0 0 295px;
	display: flex;
	border: 2px solid lightgray;
	border-radius: 20px;
	padding-left: 20px;
	padding-top: 10px;
}

header .header_section .header_sl .searchbar input {
	height: 27px;
	width: 140px;
	border: none;
	outline: 0;
	font-size: 15px;
	padding-left: 10px;
}

header .header_section .header_sl .list {
	width: 730px;
}

header .header_section .header_sl .searchbar img {
	height: 27px;
	weight: 27px;
	padding-left: 20px;
}

header .menu {
	margin-top: 15px;
	margin-right: 180px;
}

header .header_sl .menu ul {
	list-style: none;
}

header .menu .menu_wrap .mainmenu .submenu {
	display: none;
}

header .menu .menu_wrap .mainmenu:hover .submenu { //
	display: block;
}

header .menu .menu_wrap {
	display: flex;
}

header .menu .menu_wrap .mainmenu {
	text-align: center;
	height: 50px;
	line-height: 50px;
}

header .menu .menu_wrap .mainmenu a {
	text-decoration: none;
	color: black;
	display: block;
	width: 100px;
	font-weight: lighter;
	font-size: 18px;
	font-family: Jua;
}
</style>
</head>
<body>
	<header>
		<div class="header_wrap">
			<div class="header_logo">
				<a href="/koala/index"><img src="https://i.ibb.co/j5RbKT0/Kakao-Talk-20221229-151143932.jpg"></a>
			</div>

			<div class="header_section">
				<div class="header_login">
					<span><a href="/koala/index"><img
							src="https://www.data4library.kr/resources/img/background/g_home_icon.gif"
							class="home_icon">home</a> </span> <span>|</span>
					<c:choose>
						<c:when test="${userID == null }">
							<span><a href="/koala/login">로그인</a></span>
							<span>|</span>
							<span><a href="/koala/user/join">회원가입 </a></span>
						</c:when>
						
						
						<c:when test="${userID != null && logintype == '0' }">
						<span><a href="/koala/mypageenter">마이페이지</a></span>
						<span>|</span>
							<span><a href="/koala/logout">로그아웃</a></span>
							<span>|</span> <span><a href="javascript:chatPopupOpen();">고객센터</a></span>
						</c:when>

						<c:when test="${userID != null && logintype == '1' }">
						<span><a href="/koala/mypageenter">마이페이지</a></span>
						<span>|</span>
							<span><a style="cursor: pointer" onclick="kakaoLogout()">카카오
									로그아웃</a></span>
									<span>|</span> <span><a href="javascript:chatPopupOpen();">고객센터</a></span>
						</c:when>

						<c:when test="${userID != null && logintype == '2' }">
						<span><a href="/koala/mypageenter">마이페이지</a></span>
						<span>|</span>
							<span><a style="cursor: pointer" onclick="naverLogout()"
								id="btn_logout">네이버 로그아웃</a></span>
								<span>|</span> <span><a href="javascript:chatPopupOpen();">고객센터</a></span>
						</c:when>
					</c:choose>
					
				</div>

				<div class="header_sl">

					<div class="menu">
						<ul class="menu_wrap">
							<li class="mainmenu"><a href="#">도서</a>
								<ul class="submenu">
									<li><a href="/koala/Bestseller">베스트셀러</a></li>
									<li><a href="/koala/ItemNewAll">신간 도서</a></li>
									<li><a href="/koala/ItemNewSpecial">신간 인기 도서</a></li>
								</ul></li>

							<li class="mainmenu"><a href="/koala/board">게시판</a>
								<ul class="submenu">
								</ul></li>
<!--  
							<li class="mainmenu"><a href="#">메뉴3</a>
								<ul class="submenu">
									<li><a href="#">서브메뉴1</a></li>
									<li><a href="#">서브메뉴2</a></li>
								</ul></li>

							<li class="mainmenu"><a href="#">메뉴4</a>
								<ul class="submenu">
									<li><a href="#">서브메뉴1</a></li>
									<li><a href="#">서브메뉴2</a></li>
								</ul></li>-->
						</ul>
					</div>


					<div class="searchbar">
						<input id="searchInput" type="text"> <a
							href="javascript:search();" id="searchEnter"><img
							src="https://thumb.ac-illust.com/61/61843482164d65671d718c86101fa2a7_t.jpeg"></a>
					</div>
				</div>
			</div>
		</div>
	</header>
</body>
<script>
	var testPopUp;
	function openPopUp() {
		testPopUp = window.open("https://nid.naver.com/nidlogin.logout",
				"_blank",
				"toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
	}
	function closePopUp() {
		testPopUp.close();
	}

	function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			location.href = "/koala/naverLogout";
		}, 10);

	}
	function search() {
		let query = document.getElementById("searchInput").value;
		window.location.href = "/koala/Search?query=" + query;
	}
</script>
</html>