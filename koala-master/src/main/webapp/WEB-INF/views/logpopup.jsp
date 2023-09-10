<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "java.util.*" %>
     <%@ page import = "com.acorn.koala.dto.UserLogDto" %>
     
     <% ArrayList<UserLogDto> list = (ArrayList<UserLogDto>)request.getAttribute("list"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Jua:400');
*{
	margin:0;
	padding:0;
	font-family: Jua;
}
	header{
		margin-top:40px;
		text-align:center;
	}
	header img{
		width:120px;
		height:68px;
	}
	section{
		margin-bottom:40px;
	}
	section .logtable{
		width:500px;
		padding:20px 20px 40px 40px;
		margin:0 auto;
		border:1px solid green;
		margin-top:25px;
		border-radius: 20px;
	}
	
	section .logtable table{
		margin:0 auto;
		width:400px;
		border-collapse: collapse;
		text-align:center;
		
	}
	section .logtable table td{
		padding:10px;
		border-bottom:1px solid black;
	}
	section .logtable table tr:first-child td{
		
		padding-bottom:15px;

	}
	
	section .logtable table tr:nth-child(2) td{
		padding-top:20px;
	} 
</style>
<body>

<header>

	<img src="https://ifh.cc/g/Zh4z7d.png">
</header>
	
<section>

	<div class="logtable">
		<table>
			<tr>
				<td>
					아이디
				</td>
				<td>
					접속시간
				</td>
			</tr>
			
			<% for(UserLogDto log : list){  %>
			<tr>
				<td><%= log.getId() %></td>
				<td><%= log.getLogintime() %></td>
			
			
			</tr>
			
			<%} %>
		
		</table>
	</div>

</section>
</body>
</html>