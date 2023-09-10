<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.box1 {
	width: 100%;
	height: 100%;
	position: fixed;
	background: rgba(0, 0, 0, 0.5);
	z-index: 5;
	padding: 30px;
	display: none;
}

.box2 {
	background: white;
	border-radius: 5px;
	padding: 30px;
}

.show {
	display: block;
}
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(document).ready(function() {

		//회원탈퇴 버튼 클릭
		$("#del_btn").on("click", function() {
			$(".box1").show();
		});

		//회원탈퇴 여부 모달에서 취소버튼 클릭
		$(".box_btn2").on("click", function() {
			$(".box1").hide();
		});
	});

	function selectMypage() {
		if ($("#hiddenUserInfo").val() == '0') { // 반복을 멈춤
			$.ajax({
				method : 'GET',
				url : '/user/userlist',
				headers : {
					'Accept' : 'application/json',
					'Content-Type' : 'application/json'
				},
				data : {
					'userID' : 'est4'
				},
				success : function(response) {
					//console.log( response);
					$("tbody").append("<tr id='userInfo'>"+		
	                        "<td>"+response.userID+"</td>"+
	                        "<td>"+response.userName+"</td>"+
	                        "<td>"+response.email+"</td>"+
	                        "<td>"+response.phoneNumber+"</td>"+
	                    "</tr>");

					$("#hiddenUserInfo").val('1');
					$("#hideUserId").val(response.userID);
					
				},
				error : function(reason) {
					alert("회원정보페이지실패");
				}
			});
		}
	}
	
	function chatPopupOpen() {
		var popUrl = "/joinus/chat";
        var popOption = "scrollbars=no,resizable=no,status=no,menubar=no,width=550, height=710, top=0,left=0";
        window.open(popUrl,"chatt", popOption);
	}

	/*function test(userid) {
	 alert(userid);*/
</script>
</head>
<body>

	<input type="hidden" id="hiddenUserInfo" value="0">
	<input type="hidden" id="hideUserId" value="0">
	<div class="box1" id="box1">
		<div class="box2">
			<h4>회원탈퇴를 하면 서비스를 더 이상 이용할수 없습니다 회원탈퇴를 진행하겠습니까?</h4>
			<button class="box_btn1" onClick="location.href='/user/delete'">확인</button>
			<button class="box_btn2">취소</button>
		</div>

	</div>
	<button id="mypage_btn" onClick="selectMypage()">마이페이지</button>
	<button id="del_btn">회원탈퇴</button>
	<button id="chat_btn" onClick="chatPopupOpen();">채팅하기</button>





	<div>
		<table>
			<h3>기본정보</h3>
			<thead>
				<tr>
					<td>ID</td>
					<td>NAME</td>
					<td>E-mail</td>
					<td>Phone Number</td>
				</tr>
			</thead>

			<tbody>
			</tbody>

		</table>
	</div>

	<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>