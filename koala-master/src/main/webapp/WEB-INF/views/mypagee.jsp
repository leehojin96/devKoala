<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

	let ck = 0;
	let pck =0;
	
	function menu1(){
		let menu1 = document.querySelector(".menu1");
		let menu2 = document.querySelector(".menu2");
		let menu3 = document.querySelector(".menu3");
		
		menu2.classList.remove('menu_select');
		menu3.classList.remove('menu_select');
		
		menu1.classList.add('menu_select');
	}
	
	function menu2(){
		let menu1 = document.querySelector(".menu1");
		let menu2 = document.querySelector(".menu2");
		let menu3 = document.querySelector(".menu3");
		
		menu1.classList.remove('menu_select');
		menu3.classList.remove('menu_select');
		
		menu2.classList.add('menu_select');
		
	}
	
	function menu3(){
		let menu1 = document.querySelector(".menu1");
		let menu2 = document.querySelector(".menu2");
		let menu3 = document.querySelector(".menu3");
		
		menu1.classList.remove('menu_select');
		menu2.classList.remove('menu_select');
		
		menu3.classList.add('menu_select');
		
		
		
	}
	
	function phonePopClose(){
		let pop = document.querySelector(".phone_popup");
		pop.style.display="none";
		
	}
	
	function phonePopOpen(){
		let pop = document.querySelector(".phone_popup");
		pop.style.display="block";
		
	}
	
	function emailPopClose(){
		let pop = document.querySelector(".email_popup");
		pop.style.display="none";
		
	}
	
	function emailPopOpen(){
		let pop = document.querySelector(".email_popup");
		pop.style.display="block";
		
	}
	
	
	function check(){
		let phone = document.querySelector(".rpphone_check input");
		let p = document.querySelector(".rpphone_check p");
		
		if(phone.value == ${phone}){
			ck = 1;
			p.style.color="green";
			p.innerHTML="현재 정보가 확인되었습니다. 변경할 전화번호를 입력해주세요.";
			phone.readOnly = true;
			
		} else {
			ck=0;
			p.style.color="red";
			p.innerHTML="현재 전화번호가 정확한지 확인해 주세요.";
		}
	}
	
	function changePhone(){
		
		if(ck == 0){
			alert("현재 전화번호를 먼저 확인 해주세요");
		} else {
			let frm = document.frm;
			let newphone = frm.newphone;
			
			if(newphone.value == ""){
				alert("변경하실 전화번호를 입력하세요");
			} else{
				frm.submit();
			}
		}
	}
	
	
	function emailCheck(){
		let email = document.querySelector(".rpemail_check input");
		let e = document.querySelector(".rpemail_check p");

		if(email.value == "${email}"){
			pck = 1;
			e.style.color="green";
			e.innerHTML="현재 정보가 확인되었습니다. 변경할 이메일을 입력해주세요.";
			email.readOnly = true;

			
		} else {
			pck=0;
			e.style.color="red";
			e.innerHTML="현재 이메일이 정확한지 확인해 주세요.";
		}
	}
	
	function changeemail(){
		if(pck == 0){
			alert("현재 이메일을 먼저 확인 해주세요");
		} else {
			let frm = document.frm2;
			let newemail = frm.newemail;
			
			if(newemail.value == ""){
				alert("변경하실 이메일을 입력하세요");
			} else{
				frm.submit();
			}
		}
	}
	
	function log_popup(){
		window.open("http://localhost:8090/<c:url value='/logpopup?id=${id}' />","Koala Book Log","width=850, height=650, toolbar=no, menubar=no, scrollbar=yes");
	}

	function unregister(){
		
		
	}

</script>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua:400');

	*{
		font-family:Jua;
	}
	.info_wrap{
		width:1024px;
		height:791px;
		margin:0 auto;
		display: flex;
	}
	
	.info_wrap .subindex{
		border-left:0.1px solid lightgray;
		width:355px;
		height:791px;
		border-right:0.1px solid lightgray;
	}	
	
	.info_wrap .subindex .logo{
		padding: 38px 10px 10px 15px;
		width:289px;
		text-align:center;

	}
	
	.info_wrap .subindex .logo img{
		width:160px;
		height:91px;
		margin-left:30px;
	}
	
	.info_wrap .subindex .profile{
		width:315px;
		padding:42px 20px 20px 20px;
		height:250px;
		text-align:center;
		
	}
	
	.info_wrap .subindex .profile img{
		width:112px;
		height:112px;
		border-radius:50%;
	}
	
	.info_wrap .subindex .profile p{
		font-size:26px;
		font-weight:bold;
	}
	
	.info_wrap .subindex .profile span{
		color: rgba(123,137,148,.8);
	}
	
	.info_wrap .subindex .menu{

		width:315px;
		padding:12px 20px 20px 20px;
		height:300px;
		text-align:center;
	}
	.info_wrap .subindex .menu span{
		display: inline-block;
		font-size: 19px;
    	line-height: 26px;
    	font-weight: 400;
    	letter-spacing: -1.18px;
    	color: #303038;
    	margin-top:30px;
    	cursor:pointer;
    	padding-bottom:7px;
	}
	
	.info_wrap .subindex .menu .menu_select{
		font-weight: 700;
    	color: #1e1e23;
    	border-bottom:2px solid black;
	}
	
	.info_wrap .container{

		width:628px;
		height:791px;
		padding:0 30px;
	}
	
	.info_wrap .container .user_info{
		width:533px;
		height:226px;
		padding:16px 17px 0 17px;
		border:1px solid green;
		border-radius:12px;
		margin-top:25px;
	}
	.info_wrap .container .user_info .user_info_title .title{
		font-size: 20px;
    	font-weight: 700;
    	line-height: 24px;
    	letter-spacing: -.2px;
   	 	color: #303038;
   	 	margin-top:0px;
	}
	
	.info_wrap .container .user_info .myinfo_area{
		
		height: 56px;
		padding:12px 0 12px;
		border-bottom:1px solid lightgray;
		display:flex;
	}
	
	.info_wrap .container .user_info .myinfo_area .img_wrap{
		margin-right:10px;
	}
	
	.info_wrap .container .user_info .myinfo_area .img_wrap img{
		width:56px;
		height:56px;
		border-radius:50%;
	}
	
	.info_wrap .container .user_info .myinfo_area .text_wrap .name{
		width:100%
	}
	.info_wrap .container .user_info .myinfo_area .text_wrap .name button{
		float:right;
		margin-top:6px;
		display: inline-block;
   		min-width: 44px;
    	padding: 2px 9px 3px;
    	border-radius: 4px;
    	border: solid 1px rgba(212,216,229,.5);
   		background-color: rgba(212,216,229,.25);
    	box-sizing: border-box;
    	text-align: center;
	}
	.info_wrap .container .user_info .myinfo_phone{
		padding:12px 0 12px 10px;
		width:523px;
		height:24px;
		border-bottom:1px solid lightgray;
		display:flex;
		
	}
	
	.info_wrap .container .user_info .myinfo_phone .phone_img{
		width:24px;
		height:24px;
		background-image: url("https://ssl.pstatic.net/static/nid/account/m_sp_01_home_849a216f.png");
		background-size: 264px 230px;
		background-position: -121px -164px;
		margin-right:10px;
	}
	
	.info_wrap .container .user_info .myinfo_email{
		padding:12px 0 12px 10px;
		width:523px;
		height:24px;
		display:flex;
		
	}
	
	.info_wrap .container .user_info .myinfo_email .email_img{
		width:24px;
		height:24px;
		background-image: url("https://ssl.pstatic.net/static/nid/account/m_sp_01_home_849a216f.png");
		background-size: 264px 230px;
		background-position: -78px -206px;
		margin-right:10px;
	}
	
	.info_wrap .container .user_info .innertext{
		width:100%;
		font-size:16px;
		font-weight: 500;
   		line-height: 24px;
    	letter-spacing: -.8px;
    	color: #303038;
    	word-break: break-all;
	}
	.info_wrap .container .user_info .innertext button{
		float:right;
		display: inline-block;
   		min-width: 44px;
    	padding: 2px 9px 3px;
    	border-radius: 4px;
    	border: solid 1px rgba(212,216,229,.5);
   		background-color: rgba(212,216,229,.25);
    	box-sizing: border-box;
    	text-align: center;
    	margin-right:20px;
    	cursor:pointer;
	}
	
	.info_wrap .container .user_info .myinfo_area .text_wrap .name{
		width:450px;
		font-size:24px;
		font-weight:bold;
		
	}
	
	.info_wrap .container .user_addr{
		width:533px;
		height:208px;
		padding:26px 17px 0 17px;
		border:1px solid green;
		border-radius:12px;
		margin-top:25px;
	}
	
	.info_wrap .container .user_addr .title h2{
    	font-size: 20px;
    	font-weight: 700;
    	line-height: 24px;
    	letter-spacing: -.2px;
   	 	color: #303038;
   	 	margin:0;
   	 	margin-bottom:5px;
	}
	
	.info_wrap .container .user_addr .title span{
		padding-top: 3px;
    	font-size: 15px;
    	font-weight: 400;
    	line-height: 16px;
    	letter-spacing: -.8px;
    	color: #b0b8bf;
	}
	
	.info_wrap .container .user_addr table{
		margin-top:15px;
		width:100%;
	}
	
	.info_wrap .container .user_addr table tr th:first-child{
		width:80%;
		text-align: center;

	}
	
	.info_wrap .container .user_addr table tr th{
		border-top:1px solid #888;
		border-bottom:1px solid #ebebeb;
		padding:7px 0 7px;
	}
	
	.info_wrap .container .user_addr table tr td{
		text-align:center;
	}
	
	.info_wrap .container .user_addr table tr td:first-child{
		text-align:left;
		padding-left:20px;
	}
	
	.info_wrap .container .user_addr table tr td:first-child span{
		color:black;
	}
	
	.info_wrap .container .user_addr table tr td:first-child span:first-child{
		color: #b0b8bf;
	}
	
	.info_wrap .container .user_addr table tr td button{
		min-width: 44px;
		width:82px;
    	padding: 2px 9px 3px;
    	border-radius: 4px;
    	border: solid 1px rgba(212,216,229,.5);
   		background-color: rgba(212,216,229,.25);
    	box-sizing: border-box;
    	text-align: center;
	}
	
	.info_wrap .container .user_info .myinfo_area .email{
		width:450px;
		font-size:15px;
		color: rgba(123,137,148,.8);
	}
	
	.info_wrap .container .user_log{
		width:533px;
		height:90px;
		padding:16px 17px 17px;
		border:1px solid green;
		border-radius:12px;
		margin-top:25px;
	}
	
	.info_wrap .container .user_log h2{
		font-size: 20px;
    	font-weight: 700;
    	line-height: 24px;
    	letter-spacing: -.2px;
   	 	color: #303038;
   	 	margin:0;
   	 	margin-bottom:20px;
	}
	
	.info_wrap .container .user_log .user_log_inner{
		display:flex;
		width:100%;
		border-top:1px solid lightgray;
		padding:15px 0px 12px 10px;
	}
	
	.info_wrap .container .user_log .user_log_inner .log_icon{
		width:24px;
		height:24px;
		background-image: url("https://ssl.pstatic.net/static/nid/account/m_sp_01_home_849a216f.png");
		background-size: 264px 230px;
		background-position: -218px -130px;
		margin-right:10px;
	}
	
	.info_wrap .container .user_log .user_log_inner .log_inner{
		font-size: 16px;
    	font-weight: 500;
    	line-height: 24px;
    	letter-spacing: -.8px;
    	color: #303038;
   		word-break: break-all;
   		width:100%;
	}
	
	.info_wrap .container .user_log .user_log_inner .log_inner button{
		float:right;
		display: inline-block;
   		min-width: 44px;
    	padding: 2px 9px 3px;
    	border-radius: 4px;
    	border: solid 1px rgba(212,216,229,.5);
   		background-color: rgba(212,216,229,.25);
    	box-sizing: border-box;
    	text-align: center;
    	margin-right:20px;
	}
	
	.info_wrap .container .unregister{
		margin-top:45px;
		text-align:center;
	}
	
	.info_wrap .container .unregister button{
		width:140px;
		height:45px;
		border:1px solid green;
		border-radius: 10px;
	}
	
	
	
	.phone_popup{
    	position: fixed;
    	top: 0;
    	right: 0;
    	bottom: 0;
    	left: 0;
    	background: rgba(0,0,0,.6);
   		z-index: 1500;
    	display: none;
	}
	
	.phone_popup .phone_edit{
		width: 281px;
		height:390px;
    	border-radius: 15px;
    	border: 0.5px solid lightgray;
    	padding: 30px;
    	background: #fff;
    	position: fixed;
    	top: 50%;
    	left: 50%;
    	z-index: 2000;
    	transform: translate(-50%,-50%);
    	position:relative;
	}
	
	.phone_popup .phone_edit .phone_edit_title{
		border-bottom:1px solid black;
	}
	
	.phone_popup .phone_edit .phone_edit_title h4{
		font-size:20px;
		font-weight: 100;
    	line-height: 28px;
    	letter-spacing: -.8px;
    	word-break: break-all;
    	margin-top:30px;
	}
	
	label{
		color:#03c75a;
	}
	
	.phone_popup .phone_edit .userphone{
		margin-top:20px;
		display:flex;
	}
	
	.phone_popup .phone_edit .userphone .userphone_img{
		background-image: url("https://ssl.pstatic.net/static/nid/account/m_sp_01_home_849a216f.png");
		background-size: 264px 230px;
		background-position: -121px -164px;
   		background-repeat: no-repeat;
    	width: 24px;
    	height: 24px;
	}
	.phone_popup .phone_edit .rpphone_check{
		padding-top:30px;
	}
	.phone_popup .phone_edit .rpphone_check input{
		margin-left:10px;
		width:200px;
		height: 36px;
    	font-size: 14px;
    	font-weight: 400;
    	line-height: 16px;
    	letter-spacing: -.46px;
    	border:1px solid black;
    	border-radius: 5px;
    	padding-left:5px;
	}
	
	.phone_popup .phone_edit .rpphone_check button{
		height:38px;
		width:55px;
		background-color: #9C5B36;
		color:white;
		border:none;
		border-radius: 10px;
	}
	
	.phone_popup .phone_edit .rpphone_check p{
		margin:0px;
		margin-left:16px;
		font-size:14px;
		color:red;
		height:18px;
	}
	
	.phone_popup .phone_edit .newphone{
		padding-top:30px;
	}
	.phone_popup .phone_edit .newphone input{
		margin-left:10px;
		width:200px;
		height: 36px;
    	font-size: 14px;
    	font-weight: 400;
    	line-height: 16px;
    	letter-spacing: -.46px;
    	border:1px solid black;
    	border-radius: 5px;
    	padding-left:5px;
	}
	
	.phone_popup .phone_edit .newphone button{
		height:38px;
		width:55px;
		background-color: #9C5B36;
		color:white;
		border:none;
		border-radius: 10px;
	}
	
	.phone_popup .phone_edit .phedit_button{
		position: absolute;
    	left: 0;
    	right: 0;
    	bottom: 0;
    	display: block;
    	text-align: center;
	}
	
	.phone_popup .phone_edit .phedit_button span:first-child{
		width:35%;
		background-color:#959EAE;
		display:inline-block;
		border-radius: 0 0 0 15px;
		padding: 19px 0 18px;
		float: left;
		cursor:pointer;
	}
	
	.phone_popup .phone_edit .phedit_button span:last-child{
		width:65%;
		background-color:#9C5B36;
		display:inline-block;
		border-radius: 0 0 15px 0;
		padding: 19px 0 18px;
		float: left;
		cursor:pointer;
	}
	
	.phone_popup .phone_edit .cancle{
		position:absolute;
		top:20px;
		right:30px;
		font-size:20px;
		cursor:pointer;
	}
	
	.email_popup{
    	position: fixed;
    	top: 0;
    	right: 0;
    	bottom: 0;
    	left: 0;
    	background: rgba(0,0,0,.6);
   		z-index: 1500;
    	display: none;
	}
	
	.email_popup .email_edit{
		width: 281px;
		height:390px;
    	border-radius: 15px;
    	border: 0.5px solid lightgray;
    	padding: 30px;
    	background: #fff;
    	position: fixed;
    	top: 50%;
    	left: 50%;
    	z-index: 2000;
    	transform: translate(-50%,-50%);
    	position:relative;
	}
	
	.email_popup .email_edit .email_edit_title{
		border-bottom:1px solid black;
	}
	
	.email_popup .email_edit .email_edit_title h4{
		font-size:20px;
		font-weight: 100;
    	line-height: 28px;
    	letter-spacing: -.8px;
    	word-break: break-all;
    	margin-top:30px;
	}
	
	.email_popup .email_edit .useremail{
		margin-top:20px;
		display:flex;
	}
	
	.email_popup .email_edit .useremail .useremail_img{
		background-image: url("https://ssl.pstatic.net/static/nid/account/m_sp_01_home_849a216f.png");
		background-size: 264px 230px;
		background-position: -78px -206px;
   		background-repeat: no-repeat;
    	width: 24px;
    	height: 24px;
	}
	.email_popup .email_edit .rpemail_check{
		padding-top:30px;
	}
	.email_popup .email_edit .rpemail_check input{
		margin-left:10px;
		width:200px;
		height: 36px;
    	font-size: 14px;
    	font-weight: 400;
    	line-height: 16px;
    	letter-spacing: -.46px;
    	border:1px solid black;
    	border-radius: 5px;
    	padding-left:5px;
	}
	
	.email_popup .email_edit .rpemail_check button{
		height:38px;
		width:55px;
		background-color: #9C5B36;
		color:white;
		border:none;
		border-radius: 10px;
	}
	
	.email_popup .email_edit .rpemail_check p{
		margin:0px;
		margin-left:16px;
		font-size:14px;
		color:red;
		height:18px;
	}
	
	.email_popup .email_edit .newemail{
		padding-top:30px;
	}
	.email_popup .email_edit .newemail input{
		margin-left:10px;
		width:200px;
		height: 36px;
    	font-size: 14px;
    	font-weight: 400;
    	line-height: 16px;
    	letter-spacing: -.46px;
    	border:1px solid black;
    	border-radius: 5px;
    	padding-left:5px;
    	padding-top:0px;
	}
	
	.email_popup .email_edit .newemail button{
		height:38px;
		width:55px;
		background-color: #9C5B36;
		color:white;
		border:none;
		border-radius: 10px;
	}
	
	.email_popup .email_edit .emedit_button{
		position: absolute;
    	left: 0;
    	right: 0;
    	bottom: 0;
    	display: block;
    	text-align: center;
	}
	
	.email_popup .email_edit .emedit_button span:first-child{
		width:35%;
		background-color:#959EAE;
		display:inline-block;
		border-radius: 0 0 0 15px;
		padding: 19px 0 18px;
		float: left;
		cursor:pointer;
	}
	
	.email_popup .email_edit .emedit_button span:last-child{
		width:65%;
		background-color:#9C5B36;
		display:inline-block;
		border-radius: 0 0 15px 0;
		padding: 19px 0 18px;
		float: left;
		cursor:pointer;
	}
	
	.email_popup .email_edit .cancle{
		position:absolute;
		top:20px;
		right:30px;
		font-size:20px;
		cursor:pointer;
	}
	
	

	footer{
		text-align:center;
		width:100%;
		padding:100px 0 30px;
	}
	footer img{
		width:60px;
		height:34px;
	}
	
	footer span{
		color:gray;
		font-size:12px;
	}
	
</style>
</head>
<body>
	<div class="info_wrap">
		
		<div class="subindex">
			<div class="logo">
				<a href="<c:url value='/index' />"><img src="https://ifh.cc/g/Zh4z7d.png"></a>
			</div>
			
			<div class="profile">
				<img src="https://static.nid.naver.com/images/web/user/default.png?type=s160">
				<p>${id }</p>
				<span>코알라북 일반 회원</span>


			</div>
			
			<div class="menu">
				<span class="menu1 menu_select" onclick="menu1()">내 프로필</span><br>
				<span class="menu2" onclick="menu2()">내 게시글</span> <br>
				<span class="menu3" onclick="menu3()">내 찜목록</span>
			</div>
		
		
		</div>
		
		
		
		<div class="container">
			<div class="user_info">
				<div class="user_info_title">
					<h3 class="title">기본 정보</h3>
				</div>
				
				<div class="myinfo_area">
					<div class="img_wrap">
						<img src="https://static.nid.naver.com/images/web/user/default.png?type=s160">
					</div>
					
					<div class="text_wrap">
						<div class="name">
							${name }
							
						</div>
					
						<div class="email">
							${userID }
						</div>
					</div>
					
				</div>
				
				<div class="myinfo_phone">
					<div class="phone_img">
					
					</div>
					
					<div class="innertext">
						${rpphone }
						<button onclick="phonePopOpen()">수정</button>
					</div>
				</div>
				
				<div class="myinfo_email">
					<div class="email_img">
					
					</div>
					
					<div class="innertext">
						${rpemail }
						<button onclick="emailPopOpen()">수정</button>
					</div>
				</div>
				
			</div>
			
			<div class="user_addr">
				<div class="title">
					<h2>배송지 관리</h2>
					<span>쇼핑에서 사용하신 배송지를 관리할 수 있어요.</span>
					
					<table>
						<tr>
							<th>주소</th>
							<th>수정</th>
						</tr>
						
						<tr>
							<td>
								<span>${addr1 }</span> <br>
								<span>${addr2 }</span> <br>
								<span>${addr3 }</span>
								
							</td>
							<td>
								<button>수정</button>
							</td>
						</tr>
						
						
					</table>
				</div>
			</div>
			
			<div class="user_log">
				<h2>내 활동 기록</h2>
				
				<div class="user_log_inner">
					<div class="log_icon"></div>
					
					<div class="log_inner">
						로그인 기록
						
						<button onclick="log_popup()">전체보기</button>
					</div>
				</div>
				
				
			</div>
			
			<div class="unregister">
					<button onclick="unregister()">회원 탈퇴</button>
			</div>
			
		</div>
	

	</div>
	
	
	<div class="phone_popup">
		<div class="phone_edit">
			<span class="cancle" onclick="phonePopClose()">X</span>
			<div class="phone_edit_title">
				<h4><strong>${id }님</strong>의 회원정보 중 <label>전화번호</label>를 &nbsp; 수정하기 위해 인증절차가 필요합니다.</h4>
			</div>
			
			<div class="userphone">
				<div class="userphone_img">
					
				</div>
				
				<div class="userphone_number">
					${rpphone }
				</div>
			</div>
			<form name="frm" method="post" action="<c:url value='/changephone'/>">
				<div class="rpphone_check">
					<input type="text" placeholder="현재 전화번호 입력"	name="phone"> <button type="button" onclick="check()">확인</button>
					
					<p></p>
				</div>
			
			
				<div class="newphone">
					<input class="newnumber" type="text" placeholder="변경할 전화번호 입력" name="newphone">
				</div>
				
				<div class="phedit_button">
					<span  onclick="phonePopClose()">취소</span>
					<span  onclick="changePhone()">변경</span>
				</div>
			</form>
		</div>
	</div>
	
	
	
	<!--  이메일 팝업 -->
	<div class="email_popup">
		<div class="email_edit">
			<span class="cancle" onclick="emailPopClose()">X</span>
			<div class="email_edit_title">
				<h4><strong>${id }님</strong>의 회원정보 중 <label>이메일</label>을 수정<br>하기 위해 인증절차가 필요합니다.</h4>
			</div>
			
			<div class="useremail">
				<div class="useremail_img">
					
				</div>
				
				<div class="useremail_number">
					${rpemail }
				</div>
			</div>
			
				<div class="rpemail_check">
					<input type="text" placeholder="현재 이메일 입력" name="email"> <button type="button" onclick="emailCheck()">확인</button>
					<p></p>
				</div>
			
			<form name="frm2" method="post" action="<c:url value='/changeemail'/>">
				<div class="newemail">
					<input class="newemail" type="text" placeholder="변경할 이메일 입력" name="newemail">
					<input type="hidden" value ="${id }"name="u_id">
				</div>
				
				<div class="emedit_button">
					<span  onclick="emailPopClose()">취소</span>
					<span  onclick="changeemail()">변경</span>
				</div>
			</form>
		</div>
	</div>
	
<footer>
	<a href="<c:url value='/index' />"><img src="https://ifh.cc/g/2wavoO.png"></a><br><br>
	<span>@Koala Book</span>
</footer>
</body>
</html>