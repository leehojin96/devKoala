<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.acorn.koala.dto.BoarderDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
	var w_number;
	var passward;
	
	
	function Gocontent(w_number,passward){
		//alert( passward);
		if(passward !=null){
			var inpput = prompt("비밀번호를 입력해주세요");	
			if(inpput==passward){
				//alert("성공");
				window.location.href="/koala/showDetail?w_number=" + w_number;
			}else{
				alert("비밀번호가 다릅니다.");
			}
		}else{
			//alert("click");
			window.location.href="/koala/showDetail?w_number=" + w_number;
		}

	}
	
	function WriteBoard(){
		window.location.href="/koala/writeBoard";
	}
	
</script>
<style>

@import url('https://fonts.googleapis.com/css?family=Jua:400');

* {
	font-family: Jua;
}
	

section{
	display: bolck;
	margin: 0px auto;
	width: 1250px;
	height: 600px;
	
}

table{
	width: 800px;
	border-collapse: collapse;
	margin: auto;
	margin-bottom: 30px;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	
}
th,td{
	margin-top: 20px;
	//border: 1px solid black;
	height: 40px;
	text-align: center;
	
}

caption{
	font-size: 30px;
	margin: 30px 0px 30px 0px;
}
#side_button_wrap{
	width: 1250px;
	height: 50px;
	margin : auto;
	//background-color: gray;
	position: relative;
	//right: 300px;
}
#side_button_wrap a{
	position: absolute;
	right: 250px;
}


</style>
</head>
<body>
<%@ include file ="header.jsp" %>




<section>



<table>
	<caption>게시판</caption>
	
	<tr>
		<th style="width: 40px;"> </th>
		<th style="width: 130px;">아이디</th>
		<th style="width: 400px;">제목</th>
		
		<th style="width: 130px;">날짜</th>
	</tr>
	



<c:forEach var="str" items = "${list}" varStatus = "st" >
	<tr>
		<td id="${ str.w_number}">${ st.count}</td>
		<td>${ str.userID}</td>
		<td><a href="javascript:Gocontent(${str.w_number},${str.passward });">${ str.title}</a></td>
		
		<td>${ str.writeday}</td>
	</tr>
</c:forEach>
</table>

<div id ="side_button_wrap">
	<a href ="javascript:WriteBoard();" style=" ">글쓰기</a>
</div>


</section>







<%@ include file="footer.jsp"%>
</body>
</html>