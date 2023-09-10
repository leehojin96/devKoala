<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua:400');
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
	
	
	section .result_wrap{
		width:580px;
		height:450px;
		border: 2px solid green;
		border-radius:20px;
		margin:0 auto;
		padding:25px;
		text-align:center;
	}
	
	section .result_wrap h2{
		margin-top:40px;
		font-size:28px;
		font-family:Jua;
	}
	section .result_wrap .result span{
		color:brown;
		font-weight:bold;
		font-family:Jua;
		font-size:18px;
		font-weight:lighter;
	}
	
	section .result_wrap .result{
		padding:42px 0 42px;
		margin:40px 0 40px;
		
	}
	
	section .result_wrap button{
		margin-top:55px;
		padding:17px 0 17px;
		width:407px;
		height:55px;
		text-align:center;
		background-color:#633303;
		color:white;
		font-weight:bold;
		border:none;
		border-radius: 10px;
		cursor:pointer;
	}
	section .result_wrap p{
		font-family:Jua;
		font-size:18px;
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
<header>
	<a href="<c:url value='/index' />"><img src="https://ifh.cc/g/Zh4z7d.png"></a>
</header>

<section>
	<div class="result_wrap">
		<h2>비밀번호 찾기</h2>
		
		<div class="result">
			<span>입력하신 정보와 일치하는 회원정보가 없습니다.</span>
		</div>
		
		<p>
			입력 정보가 정확한지 확인 후 다시 시도 해 주세요. <br>
			정확한 정보 입력에도 검색이 되지 않는다면 고객센터로 문의 해 주세요.
		</p>
		
		<a href="<c:url value='/finder' />"><button>다시 찾기</button></a>
	</div>
</section>


<footer>
	<a href="<c:url value='/index' />"><img src="https://ifh.cc/g/2wavoO.png"></a><br><br>
	<span>@Koala Book</span>
</footer>
</body>
</html>