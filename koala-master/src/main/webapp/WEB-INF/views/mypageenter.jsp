<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
	section{
		width:100%;
		height:100%;
		margin:0 auto;
		font-family: Jua;
	}

	.mypage_wrap{
		width:755px;
		margin:0 auto;
		border:0.1px solid lightgray;
		border-radius:40px;
		padding:40px;
		margin-top:100px;
		margin-bottom:100px;
		text-align:center;

	}
	.mypage_wrap .title{
		text-align:center;
		font-size:20px;
		margin-bottom:20px;

	}
	
	.mypage_wrap .login{
		width:400px;
		padding:20px;
		margin:0 auto;
	}
	.mypage_wrap .login input{
		width:300px;
		padding:8px 24px;
		height:31px;
		margin-bottom:20px;
		border-radius: 10px;
		border:1px solid lightgray;
	}
	
	.mypage_wrap .login .id_input{
		outline:none;
	}
	
	.mypage_wrap .login input::placeholder{
		color: #cacaca;
		font-family: Jua;
		font-size:16px;
	}
	
	.mypage_wrap button{
	
		width:350px;
		height:50px;
		border: none;
    	color: white;
    	background-color: #9C5B36;
    	font-weight: bold;
    	font-size: 18px;
    	border-radius: 5px;
    	cursor:pointer;
	}
</style>
</head>
<body>
	
<section>
	<div class="mypage_wrap">
		<div class="title">
			회원님의 정보를 안전하게 보호하기 위해 비밀번호를 다시 한 번 확인해주세요.
		</div>
		<form method="post" action="<c:url value='/mypageenter' />"  onsubmit="">
			<div class="login">
				<input type="text" name="id" readonly value="${userID }" class="id_input">
				<input type="password" name="pw" placeholder="Enter PW">
			</div>
		
			<button>확인</button>
		</form>
		
		
	</div>
</section>
	
	
	 <%@include file="footer.jsp" %>
</body>
</html>