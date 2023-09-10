<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file ="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

//로그인 팝업창
function popUp(){
 let popup_open = document.querySelector(".popup_wrap");
 popup_open.style.display="block";

}
//로그인 팝업창 닫기
function popUpClose(){
 let popup_Close = document.querySelector(".popup_wrap");
 popup_Close.style.display="none";
}

function popUpLogin(){
	popUpClose();
	window.open("http://localhost:8090/<c:url value='/poplogin' />","Koala Book Login","width=350, height=300, toolbar=no, menubar=no, scrollbar=no");
	
}

function buy(){
	alert("구매창");
}
</script>

<style>
.popup_wrap{
    position: fixed;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;
    background: rgba(0,0,0,.6);
    z-index: 1500;
    display: none;
}


.popup_login{
    width: 340px;
    border-radius: 5px;
    border: 0.5px solid lightgray;
    padding: 30px;
    text-align: center;
    font-weight: 400;
    background: #fff;
    position: fixed;
    height: auto;
    top: 50%;
    left: 50%;
    z-index: 2000;
    transform: translate(-50%,-50%);
}

.popup_loginText p{
    text-align: left;
    font-size: 15px;
}

.popup_loginBtn{
    margin-top: 40px;
}

.popup_loginBtn button{
    min-width: 85px;
    height: 36px;
    font-size: 14px;
    border-radius: 5px;
    border: 1px solid #bebebe;
    color: #484848;
    outline: none;
    background-color: white;
    cursor: pointer;
    margin: 0px 5px;
}

.popup_loginBtn button:hover{
    border: 1px solid #3f3fff;
    color: #3f3fff;
}
</style>
</head>
<body>
<c:choose>
	<c:when test="${id == null }">
		<a href="#" onclick="popUp()">구매</a>
	</c:when>
	
	<c:when test="${id != null }">
		<a href="#" onclick="buy()">구매</a>
	</c:when>
</c:choose>

<!-- 마지막 섹션 로그인팝업 -->
	<div class="popup_wrap">            
		<div class="popup_login">            
			<div class="popup_loginText">
				<p>
                    로그인이 필요한 서비스입니다.<br>
                    로그인 하시겠습니까?
				</p>
			</div>
            
			<div class="popup_loginBtn">
				<button type="button" onclick="popUpClose()">취소</button>
				<button type="button" id="loginBtn_right" onclick="popUpLogin()">확인</button>
			</div>                        
		</div>            
	</div>
</body>
</html>