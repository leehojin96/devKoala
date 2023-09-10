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




$(document).ready( function(){


	
	var userID = "${userID }";
	var w_number = ${list[0] };
	//var comments = $("#comments").val();
	
	$.ajax({
		type:"POST",
		url:"/koala/add_comments",
		 data : {
			 userID : userID,
			 w_number : w_number,
			 //comments : comments
          },
		success:function(data){
			//alert("success");
			//console.log(data);
			var showcom = toHtml(data);
			$("#show_comments").html(showcom);
			
			
		},
		error: function(){
			alert("error");
		}
	});

	
	
	$("#add_comments").click( function(){
		//alert("click");
		
		var userID = "${userID }";
		var w_number = ${list[0] };
		var comments = $("#comments").val();
		
		console.log(userID);

		
		$.ajax({
			type:"POST",
			url:"/koala/add_comments",
			 data : {
				 userID : userID,
				 w_number : w_number,
				 comments : comments
              },
			success:function(data){
				//alert("success");
				//console.log(data);
				var showcom = toHtml(data);
				$("#show_comments").html(showcom);
				
				
			},
			error: function(){
				alert("error");
			}
		});
		
	});
	
	
});




function toHtml(data){
	
	let str="";
	for(let i=0; i<data.length; i++){
	let item = data[i];
	
	 str += "<tr><td><p>"+item.userID+"  :<span>"+item.comments+"</span></p></td><td id = "+"'daytd'"+">"+item.comments_dy+"</td></tr>";
	
	}
	return str;
}






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
		window.location.href="/koala/showDetail?w_number=" + w_number;
	}

}

function linkBoard(){
	window.location.href="/koala/board";
	
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
}

#title_wrap{

	//background-color: red;
	width: 800px;
	height : 70px;
	margin: auto;
	line-height: 70px;
	text-align: center;
}

#id_wrap{
	margin: auto;
	width: 800px;
	height : 30px;
	text-align: right;
	padding-right: 150px;
	font-size: 20px;
}

#contents_wrap{
	margin : auto;
	width: 800px;
	height : 400px;
	border: 1px solid black;
	//padding: 50px;
	margin-bottom: 30px;
}

#add_comments{
	width: 68px;
    height: 44px;
	margin: 0px;; 
	position: absolute;
	background-color: gray;
	color: white;
    bottom: -1px;
    right: -1px;
    border: 0.5px solid black;

}
#add_comments:hover {
	background-color: white;
	color: black;
}

#show_comments{

	//background-color: red;
	width: 100%;
	//border: 1px solid black;
	text-align: left;
	//text-align: center;
	margin: auto;
}

#show_comments p{
	margin-left: 80px;
}
#show_comments span{
	margin-left: 10px;
}

#show_comments  td{
	border-bottom: 1px solid gray;
	height: 50px;
}

#daytd{
	text-align: center;
}




</style>
</head>
<body>
<%@ include file ="header.jsp" %>



<section>
<%
String path = request.getContextPath();
String[] list =  (String[])request.getAttribute("list");
%>




	
<div id="title_wrap">
	<h1 style="margin: auto; font-size: 30px;">${list[2] }</h1>
</div>

<div id ="id_wrap" >ID : ${list[1] }</div>
	
	
<div id ="contents_wrap">
	<div style="width:700px; height: 300px; margin: auto; margin-top: 30px; ">
		${list[4] }
	</div>
</div>



<div id ="bottom_wrap" style="width: 800px; height:100%; display: flex;  margin: auto; ">
	<div id ="Comments_wrap" style="width: 60%;">
		<h1>의견쓰기</h1>

		<div id ="write_comments" style = " width: 95%; margin-top: 20px; border: 1px solid black; height: 161px; position: relative;">
			<span style="margin-left: 17px; margin-top: 10px; display: block;">${userID }</span>
			
			<textarea id = "comments" name = "comments" placeholder="댓글을 작성해주세요" style="width: 454px; height: 87px; margin: 0px; "></textarea>
			<button id="add_comments">등록</button>
		</div>
		
	</div>
	
	
	
	<div id ="list_box" style="width: 40%; height: 100%;">
		<h1>다른게시물</h1>
		<a href ="javascript:linkBoard();" style="margin-left: 270px;">더보기</a>
		
		
		
		<table style="width: 100%; border: 1px solid gray; height: 100%">
	
		<tr>
			<th style="height: 30px;">아이디</th>
			<th style="height: 30px;">제목</th>
			<th style="height: 30px;">날짜</th>
		</tr>
		
		
		<c:forEach var="str" items = "${list2}" varStatus = "st" >
			<tr style="text-align: center;">
				<td style="height: 30px;">${ str.userID}</td>
				<td><a href="javascript:Gocontent(${str.w_number},${str.passward });">${ str.title}</a></td>
				<td>${ str.writeday}</td>
			</tr>
		</c:forEach>
		</table>
	
	</div>
</div>

<div style="width: 800px;  margin: auto;  margin-bottom: 50px; margin-top: 20px;">
	<table id ="show_comments"></table>
</div>


</section>


<%@ include file="footer.jsp"%>
</body>
</html>