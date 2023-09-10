<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script>
 

	function idclick(){
		
		let idbtn = document.querySelector(".idselbtn");
		let pwbtn = document.querySelector(".pwselbtn");
		let iddiv = document.querySelector(".idfind_wrap");
		let pwdiv = document.querySelector(".pwfind_wrap");
		
		idbtn.style.cssText="border:2px solid green; border-bottom:none; color:#633303; font-weight:bold";
		pwbtn.style.cssText="border:1px solid lightgray; border-bottom:2px solid green; color:black; font-weight:normal";
		iddiv.style.cssText="display:block";
		pwdiv.style.cssText="display:none";

	}
	
	function pwclick(){
		
		let idbtn = document.querySelector(".idselbtn");
		let pwbtn = document.querySelector(".pwselbtn");
		let iddiv = document.querySelector(".idfind_wrap");
		let pwdiv = document.querySelector(".pwfind_wrap");
		
		pwbtn.style.cssText="border:2px solid green; border-bottom:none; color:#633303; font-weight:bold";
		idbtn.style.cssText="border:1px solid lightgray; border-bottom:2px solid green; color:black; font-weight:normal";
		pwdiv.style.cssText="display:block";
		iddiv.style.cssText="display:none";
	}
	
	
	function check(type){
		
		
		var nameReg = /^[가-힣]{2,10}|[a-zA-Z]{2,10}/;
		

		
		
		let frm = document.frm;

		let name = frm.name;
		let date = frm.date;
		let email = frm.email;
		let domain = frm.domain;
		
		let phone1 = frm.phone1;
		let phone2 = frm.phone2;
		let phone3 = frm.phone3;
		
		if(name.value == ""){
			alert("이름을 입력하세요");
			name.focus();
		
		} else if (!nameReg.test(name.value)) {
	        alert("성명은 한글, 영문으로만 입력 가능합니다.");
	        name.focus();
	    } else if(date.value == ""){
			alert("생년월일을 입력하세요");
			date.focus();
		
		} else if(email.value == ""){
			alert("이메일을 입력하세요");
			email.focus();
		
		} else if(domain.value == ""){
			alert("이메일을 입력하세요");
			domain.focus();
		;
		} else if(phone1.value == ""){
			alert("휴대폰 번호를 입력하세요");
			phone1.focus();
			
		} else if(phone2.value == ""){
			alert("휴대폰 번호를 입력하세요");
			phone2.focus();
			
		} else if(phone3.value == ""){
			alert("휴대폰 번호를 입력하세요");
			phone3.focus();
			
		} else {
			frm.submit();
		}
	}
	
	function check2(type){
		
		var nameReg = /^[가-힣]{2,10}|[a-zA-Z]{2,10}/;
		
		let frm = document.frm2;
		
		let id = frm.id;
		let name = frm.name;
		let date = frm.date;
		let email = frm.email;
		let domain = frm.domain;
		
		let phone1 = frm.phone1;
		let phone2 = frm.phone2;
		let phone3 = frm.phone3;
		
		if(id.value == ""){
			alert("아이디를 입력하세요");
			id.focus();
			
		} else if(name.value == ""){
			alert("이름을 입력하세요");
			name.focus();
			
		} else if (!nameReg.test(name.value)) {
	        alert("성명은 한글, 영문으로만 입력 가능합니다.");
	        name.focus();
	    } else if(date.value == ""){
			alert("생년월일을 입력하세요");
			date.focus();
			
		} else if(email.value == ""){
			alert("이메일을 입력하세요");
			email.focus();
			
		} else if(domain.value == ""){
			alert("이메일을 입력하세요");
			domain.focus();
			
		} else if(phone1.value == ""){
			alert("휴대폰 번호를 입력하세요");
			phone1.focus();
			
		} else if(phone2.value == ""){
			alert("휴대폰 번호를 입력하세요");
			phone2.focus();
			
		} else if(phone3.value == ""){
			alert("휴대폰 번호를 입력하세요");
			phone3.focus();
			
		} else {
			frm.submit();
		}
	}
 </script>
<style>


	*{
		margin:0;
		padding:0;

	}
	
	header{
		text-align:center;
		padding:80px 0 50px;
		width:100%;
	}
	header img{

		width:160px;
		height:91px;
	}
	
	
	.selectbtn {
		width:374px;
		height:50px;
		margin:0 auto;
		display:flex;
		margin-bottom:30px;
		
	}
	
	.selectbtn .idselbtn{
		width:50%;
		text-align:center;
		line-height:50px;
		border:2px solid green;
		border-bottom:none;
		border-top-left-radius: 7px;
		border-top-right-radius: 7px;
		font-size:14px;
		color:#633303;
		font-weight:bold;
		cursor:pointer;
	}
	
	.selectbtn .pwselbtn{
		width:50%;
		text-align:center;
		line-height:50px;
		border:1px solid lightgray;
		border-bottom:2px solid green;
		border-top-left-radius: 7px;
		border-top-right-radius: 7px;
		font-size:14px;
		cursor:pointer;
		
		
	}
	
	.cont>input{
		border:1px solid lightgray;
		padding:0 15px 0 15px;
		width:282px;
		height:44px;
		border-radius: 10px;
	}
	.cont {
		margin:10px 0 10px;
	}
	
	.title{
		margin:10px 0 10px;
	}
	
	section .find_wrap{
		width:320px;
		height:436px;
		border: 2px solid green;
		border-radius:20px;
		margin:0 auto;
		padding:25px;
	}

	
	section .find_wrap p{
		border:1px solid lightgray;
		width:314px;
		border-radius: 10px;
	}
	
	section .find_wrap p input{
		border:none;
		width:92px;
		height:44px;
		outline:none;
		text-align:center;
		border-radius: 10px;
	}
	
	section .find_wrap .cont .emailinput{
		width:151px;
	}
	
	section .find_wrap .cont select {
		width:125px;
		height:46px;
		border:1px solid lightgray;
		border-radius: 10px;
		padding: 0 15px 0 15px;
		color:gray;
	}
	
	section .find_wrap button{
		margin-top:20px;
		width:314px;
		height:46px;
		background-color:#633303;
		border:none;
		color:white;
		font-weight:bold;
		border-radius: 10px;
	}
	
	
	
	section .pwfind_wrap .find_wrap{
		width:320px;
		height:526px;
		border: 2px solid green;
		border-radius:20px;
		margin:0 auto;
		padding:25px;
	}
	
	section .pwfind_wrap{
		display:none;
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


<body>
<header>
	<a href="<c:url value='/index' />"><img src="https://ifh.cc/g/Zh4z7d.png"></a>
</header>

<section>

	<div class="selectbtn">
		<div class="idselbtn" onclick="idclick()">
			아이디 찾기
		</div>
		
		<div class="pwselbtn" onclick="pwclick()">
			비밀번호 찾기
		</div>
	</div>
	
<div class="idfind_wrap" id="test">
	<div class="find_wrap">
	
	<form name="frm" action="<c:url value='/finder' />" method="post" onsubmit="return check('I')">
		<div class="title">
			<label>이름</label> 
		</div>
		
		<div class="cont">
			<input type="text" name="name" placeholder="이름을 입력해 주세요."> 
		</div>
		
		<div class="title">
			<label>생년월일</label> 
		</div>
		
		<div class="cont">
			<input type="text" name="date" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8"> 
		</div>
		
		<div class="title">
			<label>이메일</label> 
		</div>
		
		<div class="cont">
			<input type="text" name="email" class="emailinput" placeholder="이메일을 입력해 주세요."> 
			
			<select name="domain">
				<option value="">선택</option>
				<option value="@naver.com">naver.com</option>
				<option value="@google.com">google.com</option>
				<option value="@daum.net">daum.net</option>
			</select>
		</div>
		
		<div class="title">
			<label>휴대폰번호</label>
		</div>
		<div class="cont">
			<p>
				<input type="text" name="phone1"  maxlength="3"> <span>-</span> <input type="text" name="phone2"  maxlength="4"> <span>-</span> <input type="text" name="phone3"  maxlength="4">
			</p>
		</div>
		
		<button  type="button" onclick="check()">확인</button>
		
		</form>
	</div>
</div>

<div class="pwfind_wrap">
	<div class="find_wrap">
	
	<form name="frm2" action="<c:url value='/finder' />" method="post">
		<div class="title">
			<label>아이디</label> 
		</div>
		
		<div class="cont">
			<input type="text" name="id" placeholder="아이디를 입력해 주세요."> 
		</div>
	
	
		<div class="title">
			<label>이름</label> 
		</div>
		
		<div class="cont">
			<input type="text" name="name" placeholder="이름을 입력해 주세요."> 
		</div>
		
		<div class="title">
			<label>생년월일</label> 
		</div>
		
		<div class="cont">
			<input type="text" name="date" placeholder="생년월일 8자리를 입력해 주세요." maxlength="8"> 
		</div>
		
		<div class="title">
			<label>이메일</label> 
		</div>
		
		<div class="cont">
			<input type="text" name="email" class="emailinput" placeholder="이메일을 입력해 주세요."> 
			
			<select name="domain">
				<option value="">선택</option>
				<option value="@naver.com">naver.com</option>
				<option value="@google.com">google.com</option>
				<option value="@daum.net">daum.net</option>
			</select>
		</div>
		
		<div class="title">
			<label>휴대폰번호</label>
		</div>
		<div class="cont">
			<p>
				<input type="text" name="phone1"maxlength="3"> <span>-</span> <input type="text" name="phone2" maxlength="4"> <span>-</span> <input type="text" name="phone3"maxlength="4">
			</p>
		</div>
		
		<button type="button" onclick="check2('I')">확인</button>
	</form>
	</div>
</div>
</section>

<footer>
	<a href="<c:url value='/index' />"><img src="https://ifh.cc/g/2wavoO.png"></a><br><br>
	<span>@Koala Book</span>
</footer>
</body>
</html>