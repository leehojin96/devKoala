<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	let id = $("#id").val();
	let pw = $("#pw").val();
	
	if(id == ""){
		alert("아이디를 입력하세요");
		$("#id").focus();
		return false;
	} else if(pw == ""){
		alert("비밀번호를 입력하세요");
		$("#pw").focus();
		return false;
	} else {
		return true;
	}
}

function snslogin(){
	opener.location.href="<c:url value='/login' />";
	self.close();
}
</script>
<style>
	
.popup_login{
    width: 340px;
    border-radius: 10px;
    border: 0.5px solid lightgray;
    padding: 20px;
    text-align: center;
    font-weight: 400;
    background: #fff;
    position: fixed;
    height: 300px;
    top: 50%;
    left: 50%;
    z-index: 2000;
    transform: translate(-50%,-50%);
}
.popup_loginText{
	position:relative;
}
.popup_loginText .title {

	font-weight:bold;
	font-size:20px;
	margin:30px 0 30px 0;
	
}
.popup_loginText .close{
	position:absolute;
	font-weight:bold;
	font-size:22px;
	top:-30px;
	right:5px;
	cursor:pointer;
}

.login{
		width:340px;
		margin:0 auto;
		display:flex;
	}

 .login .input_wrap{
		width:180px;
		margin:0 auto;
	}
	
.login .input_wrap input{
	width:152px;
	height:36px;
	margin-bottom:10px;
	border-radius: 5px;
	border:1px solid lightgray;
	padding:0 10px 0 10px;
	
	
}
 .login .loginbtn{
 		width:75px;
		height:87px;
		margin-left:-42px;
		margin-right:30px;
		border-radius: 10px;
		border:1px solid lightgray;
	}
.sns_login{
	margin-top:10px;
	}
.sns_login .naver_btn{
		width:125px;
		height:45px;
		margin-right:10px;
		margin-left:20px;
}

.sns_login .kakao_btn{
		height:47px;
}

.sns_login img{
		cursor:pointer;	
	}
</style>
</head>
<body>
           
		<div class="popup_login">            
			<div class="popup_loginText">
				<p class="title">
                    Koala Book Login
				</p>
				
			<form method="post" action="<c:url value='/poplogin' />" name="frm" onsubmit="return check()">
				<div class="login">
					<div class="input_wrap">
						<input type="text" placeholder="ID" name="id" id="id">
						<input type="password" placeholder="PW" name="pw" id="pw">
						<input type="hidden" name="login_type" value="0">
					</div>
					<button class="loginbtn">로그인</button>
				</div>
			</form>
				
					<div class="sns_login">
						<img class="naver_btn" src="https://ifh.cc/g/n3XC6n.png" onclick="snslogin()">
						<img class="kakao_btn" src="https://ifh.cc/g/JGDMRw.png" onclick="snslogin()">
					</div>
			</div>
                           
		</div>            

</body>
</html>