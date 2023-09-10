<%@ page contentType="text/html; charset=UTF-8"
	trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
 <%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>  
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	var wsocket;
	var today = new Date();
	var year = today.getFullYear(); // 년도
	var month = today.getMonth() + 1; // 월
	var date = today.getDate(); // 날짜
	var day = today.getDay(); // 요일
	var week = new Array('일', '월', '화', '수', '목', '금', '토'); //요일 배열
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var time = today.toLocaleTimeString() // 로컬시간

	//alert( "time"  + time);

	function connect() {

		wsocket = new WebSocket("ws://localhost:8090/koala/chat-ws2");

		wsocket.onopen = onOpen;
		wsocket.onmessage = onMessage;
		wsocket.onclose = onClose;

	}

	function disconnect() {
		wsocket.close();
	}

	function onOpen(evt) {
		//  appendMessage("연결되었습니다.");
		alert("연결되었습니다");
	}

	function onMessage(evt) {
		var data = evt.data;
		if (data.substring(0, 4) == "msg:") { // msg:소영:나도

			appendRecvMessage(data.substring(4));

		}
	}

	function onClose(evt) {
		// appendMessage("연결을 끊었습니다.");
		alert("연결을 끊었습니다");
	}

	function send() {
		var nickname = $("#nickname").val();
		var msg = $("#message").val();
		
		wsocket.send("msg:" + nickname + ":" + msg );
		$("#message").val("");

		//채팅창에 자신이 쓴 메시지 추가 
		appendSendMessage(msg);

	}

	//받는 메시지 채팅창에 추가
	function appendRecvMessage(msg) {

		let msgs = msg.split(":");
		let name = msgs[0];
		let message = msgs[1];
		$("#chatMessageArea").append(
				"<div class='recv'>" + "<span id='name_span'>" + name + "</span>"
						+ "<br>" + "<span id='message_span'>" + message + "</span>"
						+ "</div>");

		

			scrollTop();
	}

	function scrollTop() {
		var chatAreaHeight = $("#chatArea").height();
		var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
		$("#chatArea").scrollTop(maxScroll);
	}

	//보내는 메시지 채팅창에 추가
	function appendSendMessage(msg) {

		$("#chatMessageArea").append(
				"<div class='send' > " + "<span id='send_msg'>" + msg
						+ "</span>" + "<br>" + "<span id='send_time'>" + time
						+ "</span>" + "</div>");
		scrollTop();

	}

	$(document).ready(function() {

				$("#todayVal").text(year + '/' + month + '/' + date + '('+ week[day] + ')');

				$('#message').keypress(function(event) {
					var keycode = event.keyCode;

					if (keycode == '13') {
						send();
					}
					event.stopPropagation(); // 상위로 이벤트 전파 막음
				});

				$('#sendBtn').click(function() {
					send();
				});
				$('#enterBtn').click(function() {
					connect();
				});
				$('#exitBtn').click(function() {
					disconnect();
				});

			});
</script>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua:400');

* {
	font-family: Jua;
	font-weight: lighter;
}
p{ border-bottom: 1px solid gray; font-size: 18px;
}
#chatArea {
	width: 70%;
	height: 380px;
	overflow-y: auto;
	border: 0px solid black;
	margin: 0 auto;
	margin-bottom: 10px
}

.send {
	border: 0px solid green;
	border-radius: 3px;
	text-align: right;
	padding: 20px;
}



#send_time {
	display: flex; 
	font-size : 10px;
	font-weight: lighter;
	padding-left: 80.5%;
	padding-top: 5px;
}

.recv {
	border: 0px solid yellow;
	border-radius: 3px;
	padding: 4 4 4 4px; 
	text-align : left;
}

#name_span {
	font-size: 13px;
	font-weight: bold;
}

#message {
	position: absolute;
    top: 14px;
    left: 30px;
    width: 65%;
    height: 50px;
    border: 0px;
    font-size: 17px;
}

#nickname {
	border-bottom: 1px solid gray;
    border-radius: 3px;
    margin-bottom: 1px;
    margin-top: 15px;
    font-size: large;
}

.wrap1 {
	background-color: #e1e1e1;
	text-align: center;
	width: 100%;
	height: 710px;
	overflow-y: auto;
}

.wrap2 {
	background-color: white;
	width: 80%;
	height: 80%;
	margin: 0 auto;
}

.title {
	display: flex;
	padding-left: 10px;
}

#enterBtn {
	background-color: transparent;
    border: 0.5px solid darkgray;
    border-radius: 4px;
    margin-left: auto;
    font-size: 17px;
}

#exitBtn {
	background-color: transparent;
    border: 0px;
    margin-left: 50%;
    font-size: 18px;
}

.message_btn {
	display: flex;
	border-top:0.5px solid gray;
	margin: 0 auto;
	position: relative;
}

.btn-img {
    width: 70.5px;
    height: 70.5px;
    position: absolute;
    /* top: 0px; */
    right: 15px;
}

#sendBtn {
	border: 0px;
	background-color: white;
}
#send_msg{ background-color: #9fdef8; border-radius: 4px; padding: 4px;
}
#message_span{ background-color: #e1e1e1; border-radius: 4px; padding: 4px;
}
</style>
</head>
<body>
	<div class="wrap1">
		<div class="title">
			<h2></h2><img src="<spring:url value=''/>">
			<input type="button" id="exitBtn" value="상담종료">

		</div>
		<div class="wrap2">
			<input type="text" id="nickname" placeholder=${userID }> <input
				type="button" id="enterBtn" value="상담연결">
			<p id="todayVal"></p>

			<div id="chatArea">
				<div id="chatMessageArea"></div>
			</div>
			<div class="message_btn">
				<input type="text" id="message" placeholder="문의사항을 입력하세요">
				<button class="btn" id="sendBtn" value="전송">
					<img class="btn-img"
						src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSZb3kfPssUvQsltFF1bcXENcC7DGfyeNCEA&usqp=CAU">
				</button>
			</div>

		</div>
	</div>
</body>
</html>