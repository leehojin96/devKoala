 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"
	language="java"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>회원가입</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
    @import url('https://fonts.googleapis.com/css?family=Jua:400');
* {
	font-family: Jua; 
    font-weight: lighter;
}
.wrap1 {
	margin: 70 0 60 0px;
}
.sun{ border: 1px solid brown;}
.wrap2 {
	margin: 0 auto;
	padding-left: 380px;
	max-width: 768px;
	min-width: 460px;
	display: block;
}

.table {
	margin: 0 auto;
	width: 100%;
	display: block;
	top: 50%;
	left: 50px;
}
input {
    margin-top: 7px;
    padding-left: 10px;
	display: block;
	position: relative;
	width: 50%;
	height: 35px;
	font-size: 18px;
	box-sizing: border-box;
	line-height: 25px;
	border: 1.5px solid rgb(198, 195, 195);
	border-radius: 3px;
}
input:focus {
	border: 2px solid rgb(154, 123, 13);
	outline: none;
}
p {
	margin-top: 0px;
	padding: 0px;
}
label {
	cursor: pointer;
	font-weight: 700;
	font-size: 15px;
}
button, #mailCheckNumConfirm{ 
    border: 1px;
    background-color:  rgb(64, 193, 64);
    color: white;
    border-radius: 3px;
}
#userID{ 
    width: 36.5%; }
#id_btn{ 
    width: 13%;
    height: 35.1px; 
}
#birth , #select_option{ color: gray; }
#emailName, #emailDomain {
	display: inline-block;
	vertical-align: middle;
	width: 23.5%;
}
#emailDomainSelect, #email_btn{
    display: inline-block;
	vertical-align: middle;
	width: 25%;
    height: 37px;
    margin-top: 10px;
}
#emailName+span {
	display: inline-block;
	vertical-align: middle;
	margin: 0;
}
#phoneNumber1, #phoneNumber2, #phoneNumber3{
    display: inline-block;
	vertical-align: middle;
	width: 15.8%;
}
#addr1, #post_btn{
    display: inline-block;
	vertical-align: middle;
	width: 36.7%;
    height: 37px;
    margin-top: 10px;
}
#addr2{ margin-bottom: 12px; }
#formBtn{
    width: 50%;
    height: 37px;
    margin-right: 50%;
    margin-top: 10px;
}
img{
    padding-right: 330px;
    margin-bottom: 35px;
}
.error {
	color: red
}
</style>

<%@ include file="postcode.jsp"%>


<script>
	var sendCheckNum = "";	//이메일 전송 시 보낸 인증번호.
	function sendMail() {
		let userEmail = $("#emailName").val() + "@" + $("#emailDomain").val();
		if ($("#emailName").val() == '') {
			alert("이메일 아이디를 입력해주세요.");
			return false;
		}
		if ($("#emailDomain").val() == '') {
			alert("도메인 주소를 입력해주세요.");
			return false;
		}

		$.ajax({
			method : 'GET',
			url : '/koala/user/sendMail',
			headers : {
				'Accept' : 'application/json',
				'Content-Type' : 'application/json'
			},
			data : {
				'userEmail' : userEmail
			},
			success : function(response) {
				sendCheckNum = response;	//이메일 전송 시 보낸 인증번호.
				alert("인증번호가 발송되었습니다.");
				$("#mailCheckNum").css("display", "block");
				$("#mailCheckNumConfirm").css("display", "block");

			},
			error : function(reason) {
				//alert(userEmail);
				alert("이메일 전송을 실패하였습니다.");
			}
		});

	}

	function checkMail() {
		if (sendCheckNum == $("#mailCheckNum").val()) {
			$("#confirmYn").val('1');
			$("#error-email").css("color", 'green');
			$("#error-email").text('인증이 완료되었습니다');
			$("#mailCheckNum").css("display", "none");
			$("#mailCheckNumConfirm").css("display", "none");
		}else{
			alert("인증번호가 일치하지 않습니다");
			return false;
		}
	}
</script>

</head>
<body>

	<div class="wrap1">     
		<div class="wrap2">       
			<h4 style="text-align: center">
				<img src="https://ifh.cc/g/BKg92h.jpg" style="width: 245px"
					height="140px" >
			</h4>
			<div id="table">
				<form id="userForm" name="userForm" autocomplete="off">
					<div class="formTr">
						<label>아이디</label>
						<div>
							<input type="text"  name="userID" id="userID"
								maxlength="10" style="display: inline">
							<button onClick="CheckUserID();" type="button" id="id_btn">중복확인</button>
							<input type="hidden" id="verifyUserID" value="0">
						</div>
						<p class="error" id="error-userID"></p>
					</div>
					<div class="formTr">
						<label>비밀번호</label>
						<div>
							<input type="password" name="userPassword"
								id="userPassword" maxlength="20" autocomplete="off">
						</div>
						<p class="error" id="error-userPassword"></p>
					</div>
					<div class="formTr">
						<label>비밀번호 확인</label>
						<div>
							<input type="password"
								name="userPasswordConfirm" id="userPasswordConfirm"
								maxlength="20" autocomplete="off">
						</div>
						<p class="error" id="error-userPasswordConfirm"></p>
					</div>

					<div class="formTr">
						<label>이름</label>
						<div>
							<input type="text"  name="userName" id="userName"
								maxlength="20" autocomplete="off">
						</div>
						<p class="error" id="error-userName"></p>
					</div>

					<div class="formTr">
						<label>생년월일</label>
						<div>
							<input type="date"  name="birth" id="birth"
								autocomplete="off">
						</div>
						<p class="error" id="error-birth"></p>
					</div>

					<div class="formTr">
						<label>이메일</label>
						<div>
							<input type="text"  name="emailName"
								id="emailName" maxlength="20" autocomplete="off"> <span>@</span>
							<input type="text" placeholder="" name="emailDomain"
								id="emailDomain" maxlength="20" autocomplete="off"></div>
                            <div><select name="emailDomainSelect" id="emailDomainSelect">
								<option selected id="select_option">직접입력</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="nate.com">nate.com</option>
								<option value="google.com">google.com</option></select> 
                            <input type="text" id="mailCheckNum" style="display: none" placeholder="인증번호입력" autocomplete="off">
							<input type="button" id="mailCheckNumConfirm" value="인증번호 확인"
								style="display: none" onClick="javascript:checkMail()">
							<button type="button" id="email_btn" class="email_btn"
								onClick="javascript:sendMail()">인증번호 받기</button>
							<input type="hidden" id="confirmYn" name="confirmYn" value="0">
						</div>
						<p class="error" id="error-email"></p>
					</div>
					<div class="formTr">
						<label>휴대전화</label>
						<div>
							<input type="text" maxlength="3"
								name="phoneNumber1" id="phoneNumber1"><span>-</span> <input
								type="text"  maxlength="4" name="phoneNumber2"
								id="phoneNumber2"><span>-</span> <input type="text"
								 maxlength="4" name="phoneNumber3"
								id="phoneNumber3">
						</div>
						<p class="error" id="error-phoneNumber"></p>
					</div>

					<div class="formTr">
						<label>우편번호</label>
						<div>
							<input type="text" id="addr1" name="addr1" placeholder="우편번호" 
								style="display: inline;" readonly="readonly" />
							<button onClick="DaumPostcode();"
								style="width: 100px" type="button" id="post_btn">주소 검색</button>
						</div>
						<p class="error" id="error-addr1"></p>
					</div>

					<div class="formTr">
						<div>
							<input type="text" id="addr2" name="addr2"
								readonly="readonly" size="40" maxlength="30" placeholder="주소"  />
						</div>
					</div>

					<div class="formTr">
						<input type="text" id="addr3" name="addr3" placeholder="상세주소"  />
					</div>

				</form>
			</div>
			<div style="text-align: center">
				<button type="button" onclick="formSubmit();" id="formBtn">회원가입</button>
			</div>
			<br>

		</div>
	</div>

	<script src="${path}/resources/js/join.js"></script>
	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	
</body>
</html>
