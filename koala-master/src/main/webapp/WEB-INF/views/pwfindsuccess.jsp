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

function check(){
	
	if($(".newpwd").val() == ""){
		alert("비밀번호를 입력하세요.");
		$(".newpwd").focus();
		return false;
	} else if($(".newpwd").val().length<8){
		alert("비밀번호는 8자리 이상으로 입력해주세요");
		$(".newpwd").focus();
		return false;
	} else if($(".newpwdok").val() == ""){
		alert("비밀번호를 입력하세요.");
		$(".newpwdok").focus();
		return false;
	} else if ($.trim($(".newpwdok").val()) != $.trim($(".newpwd").val())){
		alert("비밀번호가 동일하지 않습니다..");
		$(".newpwdok").focus();
		return false;
	} else{
		alert("변경되었습니다.");
		return true;
	}
	

}
</script>
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
		height:600px;
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
		margin:20px 0 20px;
		
	}
	
	section .result_wrap .re-btn{
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
	section .result_wrap table{
		margin:0 auto;
		width:550px;
		height:300px;
		color:gray;
		text-align:left;
	}
	
	section .result_wrap table td span{
		font-size:10px;
		margin-left:10px;
	}
	
	section .result_wrap table tr button{
		width:80px;
		height:33px;
		font-size:5px;
		border-radius:5px;
		border:1px solid lightgray;
	}
	section .result_wrap table tr input{
		margin-right:10px;
		margin-left:10px;
		border-radius:10px;
		height:25px;
		padding:8px;
		width:290px;
		border:1px solid lightgray;
		outline: none;
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
			<span>회원가입 시 입력한 이메일로 인증을 받으시면, 비밀번호를 새롭게 설정할 수 있습니다.</span>
		</div>
		
		<form method="post" action="<c:url value='/chpw'/>"  onsubmit="return check()">
			<table>
				<tr>
					<td>이메일</td>
					<td><input type="text" disabled value="${email}"> <button>인증번호받기</button></td>
					
				</tr>
				
				<tr>
					<td>인증번호</td>
					<td><input type="text" class="verification"> <button>확인</button>   </td>
				</tr>
				
				<tr>
					<td>새 비밀번호</td>
					<td><input type="password" name="newpwd" class="newpwd"><br>
						<span>8자 이상의 영문, 숫자, 특수 문자 중 2가지 조합</span>
					</td>
					
				</tr>
				
				<tr>
					<td>새 비밀번호 확인</td>
					<td><input type="password" name="newpwdok" class="newpwdok"></td>
				</tr>
			</table>
			
			
			<button class="re-btn">확인</button>
			<input type="hidden" value="${id }" name="id">
		</form>
	</div>
</section>


<footer>
	<a href="<c:url value='/index' />"><img src="https://ifh.cc/g/2wavoO.png"></a><br><br>
	<span>@Koala Book</span>
</footer>
</body>
</html>