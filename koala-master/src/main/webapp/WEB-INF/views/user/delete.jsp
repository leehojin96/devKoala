<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function delect_form(val){
	if(val == "1"){
		location.href ="/resources/js/join.js";
	}
}
	function deleteUser() {
		let data = {
			userID: $('#userID').val(),
			userPassword: $('#userPassword').val()
		};
		
		$.ajax({
			method: 'POST',
			url: '/user/userDelete',   
			headers: {
				'Accept': 'application/json',
				'Content-Type': 'application/json',
			},
			data: JSON.stringify(data),    
			success: function(response) {
				if (response.status == true) {
					alert("회원탈퇴가 완료되었습니다");
					location.href="/user/join";  // 메인으로 변경하기
				} else {
					alert("비밀번호를 정확히 입력해주세요.");
				}
			},
			error: function(reason) {
				console.error(reason);
			},
		});
	}
</script>
</head>
<body>
<form name ="del_form" method ="post" autocomplete="off">
<div>
	<div>
		<h4>아이디</h4>
		<input type="text" name="userID" id="userID" >
		
		<h4>비밀번호 재확인</h4>
		<div>
		<input type = "password" name = "userPassword" id="userPassword" >	
		</div>
	</div>
		<input type = "button" value ="회원탈퇴" onClick="deleteUser()">
</div>

</form>

</body>
</html>