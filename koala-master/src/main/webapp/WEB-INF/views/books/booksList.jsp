<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
@import url('https://fonts.googleapis.com/css?family=Jua:400');

* {
	margin: 0px;
	padding: 0px;
}

section {
	display: bolck;
	margin: 0px auto;
	width: 1300px;
	font-family: Jua;
}

#selectType {
	padding: 20px;
	text-align: Left;
	display: flex;
}



#bookEmpty a {
	text-decoration: none;
	color: black;
}

#bookEmpty a:visited {
	color: black;
}

#bookEmpty a:active {
	color: black;
}

#bookEmpty {
	display: flex;
	flex-flow: wrap;
	width: 1300px;
}

@keyframes fadein {from { opacity:0;}
to{opacity: 1;}}
@-moz-keyframes fadein { /* Firefox */ from { opacity:0;}
to{opacity: 1;}}
@-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;}
to{opacity: 1;}}
@-o-keyframes fadein { /* Opera */ from { opacity:0;}
to{opacity: 1;}}

#book {
	padding: 30px;
	width: 200px;
	animation: fadein 1s;
	-moz-animation: fadein 1s; /* Firefox */
	-webkit-animation: fadein 1s; /* Safari and Chrome */
	-o-animation: fadein 1s; /* Opera */
}

#bookImg {
	width: 200px;
	height: 300px;
	border-radius: 15px 15px 15px 15px;
	overflow: hidden;
	box-shadow: 5px 5px 5px 5px #8b8b8b;
	margin-bottom: 20px;
}

#book img {
	width: 200px;
	height: 300px;
	object-fit: cover;
}

#title {
	font-size: 18px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
}

#author {
	font-size: 13px;
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}

#pagingBox1 {
	display: flex;
	margin-top: 50px;
	margin-bottom: 100px;
	
}

#pagingBox2{
display : flex;
margin: 0px auto;
}
#paging{
	display: flex;
}

#pagingBox1 input {
	padding: 10px 5px 10px 5px;
	margin-right: 20px;
	border-style: none;
	outline-style: none;
	outline: none;
	background: none;
	cursor: pointer;
}

#categoryDiv {
	padding: 30px;
}

#selectTop , #selectMiddle {
	list-style: none;
	display: flex;
	text-align: center;
	width: 1250px;
	flex-flow: wrap;
	border-bottom: 1px solid gray;
}
#selectTop {
padding-bottom: 20px;
}
#selectMiddle{
padding-top: 20px;
padding-bottom: 20px;
}


.selectBtn {
	margin-right: 5px;
	margin-bottom: 5px;
}

input[type=radio] {
	display: none;
	margin: 10px;
}

input[type=radio]+label {
	display: inline-block;
	margin: 2px;
	padding: 8px 19px;
	border-radius: 50px;
	background-color: #f2f2f2;
	text-align: center;
	cursor: pointer;
	
}

input[type=radio]:checked+label {
	background-color: #744326;
	color: white;
}
#selectTop label:hover{
background-color: #744326;
	color: white;
}

.Middle{
display: none;
}

#selectState1 , #selectState2 , #selectState3{
margin-right: 10px;
}

section .right_menu{
		position:fixed;
		right:5%;
		
	}
	
	section .right_menu img{
		width:60px;
		height:60px;
		filter: drop-shadow(0px 3px 5px #81c147);
	}
	
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

</script>
</head>
<body>
	
<section>
<div class="right_menu">
		<a href="<c:url value='/mypageenter' />"><img src="https://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_my@2x.png"></a>
	</div>
		<div id="categoryDiv">
			<ul id="selectTop">
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="0Top" name="top" value="0" checked="checked" /><label
					for="0Top">전체</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="55890Top" name="top" value="55890" /><label
					for="55890Top">건강/취미</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="170Top" name="top" value="170"><label
					for="170Top">경제경영</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="987Top" name="top" value="987" /><label
					for="987Top">과학</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="2551Top" name="top" value="2551" /><label
					for="2551Top">만화</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="798Top" name="top" value="798" /><label
					for="798Top">사회과학</label></li>
					<li class="selectBtn"><input type="radio" class="selectInput"
					id="1Top" name="top" value="1" /><label
					for="1Top">소설/시/희곡</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="1383Top" name="top" value="1383" /><label
					for="1383Top">수험서/자격증</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="55889Top" name="top" value="55889" /><label
					for="55889Top">에세이</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="1196Top" name="top" value="1196" /><label
					for="1196Top">여행</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="517Top" name="top" value="517" /><label
					for="517Top">예술/대중문화</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="1322Top" name="top" value="1322" /><label
					for="1322Top">외국어</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="13789Top" name="top" value="13789" /><label
					for="13789Top">유아</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="656Top" name="top" value="656" /><label
					for="656Top">인문학</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="336Top" name="top" value="336" /><label
					for="336Top">자기계발</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="17195Top" name="top" value="17195" /><label
					for="17195Top">잡지</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="1237Top" name="top" value="1237" /><label
					for="1237Top">종교/역학</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="1137Top" name="top" value="1137" /><label
					for="1137Top">청소년</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="351Top" name="top" value="351" /><label
					for="351Top">컴퓨터/모바일</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="50246Top" name="top" value="50246" /><label
					for="50246Top">초등학교 참고서</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="76000Top" name="top" value="76000" /><label
					for="76000Top">중학교 참고서</label></li>
				<li class="selectBtn"><input type="radio" class="selectInput"
					id="76001Top" name="top" value="76001" /><label
					for="76001Top">고등학교 참고서</label></li>
			</ul>
			<div class="55890 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="55890Middle" name="55890Middle" checked="checked" value="55890" /><label
					for="55890Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="53516Middle" name="55890Middle" value="53516" /><label
					for="53516Middle">건강운동</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="53521Middle" name="55890Middle" value="53521" /><label
					for="53521Middle">건강정보</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="53532Middle" name="55890Middle" value="53532" /><label
					for="53532Middle">공예</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="53525Middle" name="55890Middle" value="53525" /><label
					for="53525Middle">구기</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="53534Middle" name="55890Middle" value="53534" /><label
					for="53534Middle">반려동물</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="53518Middle" name="55890Middle" value="53518" /><label
					for="53518Middle">질병치료와 예방</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="53535Middle" name="55890Middle" value="53535" /><label
					for="53535Middle">취미기타</label></li>
				</ul>
			</div>
			<div class="170 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="170Middle" name="170Middle" checked="checked" value="170" /><label
					for="170Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="3057Middle" name="170Middle" value="3057" /><label
					for="3057Middle">경제학/경제일반</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2172Middle" name="170Middle" value="2172" /><label
					for="2172Middle">기업 경영</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2028Middle" name="170Middle" value="2028" /><label
					for="2028Middle">기업/경영자 스토리</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="261Middle" name="170Middle" value="261" /><label
					for="261Middle">마케팅/세일즈</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="263Middle" name="170Middle" value="263" /><label
					for="263Middle">트렌드/미래전망</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="172Middle" name="170Middle" value="172" /><label
					for="172Middle">재테크/투자</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="177Middle" name="170Middle" value="177" /><label
					for="177Middle">창업/취업/은퇴</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="3049Middle" name="170Middle" value="3049" /><label
					for="3049Middle">CEO/비즈니스맨을 위한 능력계발</label></li>
					</ul>
			</div>
			
			<div class="987 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="987Middle" name="987Middle"checked="checked" value="987" /><label
					for="987Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51005Middle" name="987Middle" value="51005" /><label
					for="51005Middle">과학의 이해</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51013Middle" name="987Middle" value="51013" /><label
					for="51013Middle">뇌과학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51015Middle" name="987Middle" value="51015" /><label
					for="51015Middle">생명과학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51022Middle" name="987Middle" value="51022" /><label
					for="51022Middle">동물과 식물</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51024Middle" name="987Middle" value="51024" /><label
					for="51024Middle">물리학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51027Middle" name="987Middle" value="51027" /><label
					for="51027Middle">천문학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51030Middle" name="987Middle" value="51030" /><label
					for="51030Middle">지구과학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51033Middle" name="987Middle" value="51033" /><label
					for="51033Middle">수학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51035Middle" name="987Middle" value="51035" /><label
					for="51035Middle">화학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51038Middle" name="987Middle" value="51038" /><label
					for="51038Middle">공학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51045Middle" name="987Middle" value="51045" /><label
					for="51045Middle">농업</label></li>
					
			</ul></div>
			
			<div class="2551 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2551Middle" name="2551Middle" checked="checked" value="2551" /><label
					for="2551Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="3728Middle" name="2551Middle" value="3728" /><label
					for="3728Middle">본격장르만화</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="3727Middle" name="2551Middle" value="3727" /><label
					for="3727Middle">소년만화</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="3741Middle" name="2551Middle" value="3741" /><label
					for="3741Middle">순정만화</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2561Middle" name="2551Middle" value="2561" /><label
					for="2561Middle">스포츠만화</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="7443Middle" name="2551Middle" value="7443" /><label
					for="7443Middle">인터넷 연재 만화</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2552Middle" name="2551Middle" value="2552" /><label
					for="2552Middle">코믹/명랑만화</label></li>
					</ul></div>
					
			<div class="798 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="798Middle" name="798Middle" checked="checked" value="798" /><label
					for="798Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50992Middle" name="798Middle" value="50992" /><label
					for="50992Middle">비평/칼럼</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50995Middle" name="798Middle" value="50995" /><label
					for="50995Middle">사회문제</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50997Middle" name="798Middle" value="50997" /><label
					for="50997Middle">환경/생태문제</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51016Middle" name="798Middle" value="51016" /><label
					for="51016Middle">정치학/외교학/행정학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51026Middle" name="798Middle" value="51026" /><label
					for="51026Middle">사회학</label></li>
					</ul></div>
					
					<div class="1 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1Middle" name="1Middle" checked="checked" value="1" /><label
					for="1Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50917Middle" name="1Middle" value="50917" /><label
					for="50917Middle">한국소설</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50918Middle" name="1Middle" value="50918" /><label
					for="50918Middle">일본소설</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50919Middle" name="1Middle" value="50919" /><label
					for="50919Middle">영미소설</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50921Middle" name="1Middle" value="50921" /><label
					for="50921Middle">프랑스소설</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50926Middle" name="1Middle" value="50926" /><label
					for="50926Middle">추리/미스터리소설</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50927Middle" name="1Middle" value="50927" /><label
					for="50927Middle">라이트 노벨</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50928Middle" name="1Middle" value="50928" /><label
					for="50928Middle">판타지/환상문학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50930Middle" name="1Middle" value="50930" /><label
					for="50930Middle">과학소설(SF)</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50940Middle" name="1Middle" value="50940" /><label
					for="50940Middle">시</label></li>
					</ul></div>
					
					<div class="1383 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1383Middle" name="1383Middle" checked="checked" value="1383" /><label
					for="1383Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="178951Middle" name="1383Middle" value="178951" /><label
					for="178951Middle">국가기술자격</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="178952Middle" name="1383Middle" value="178952" /><label
					for="178952Middle">국가전문자격</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="34582Middle" name="1383Middle" value="34582" /><label
					for="34582Middle">공무원 수험서</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="34704Middle" name="1383Middle" value="34704" /><label
					for="34704Middle">취업/상식/적성</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="34690Middle" name="1383Middle" value="34690" /><label
					for="34690Middle">공인중개사/주택관리사</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="34921Middle" name="1383Middle" value="34921" /><label
					for="34921Middle">운전면허</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="35777Middle" name="1383Middle" value="35777" /><label
					for="35777Middle">컴퓨터 활용능력</label></li>
					</ul></div>
					
					<div class="55889 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="55889Middle" name="55889Middle" checked="checked" value="55889" /><label
					for="55889Middle">전체</label></li>
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51371Middle" name="55889Middle" value="51371" /><label
					for="51371Middle">한국에세이</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51373Middle" name="55889Middle" value="51373" /><label
					for="51373Middle">외국에세이</label></li>
					</ul></div>
					
					<div class="1196 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1196Middle" name="1196Middle" checked="checked" value="1196" /><label
					for="1196Middle">전체</label></li>
					</ul></div>
					
					<div class="517 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="517Middle" name="517Middle" checked="checked" value="517" /><label
					for="517Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50965Middle" name="517Middle" value="50965" /><label
					for="50965Middle">미술</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50966Middle" name="517Middle"  value="50966" /><label
					for="50966Middle">음악</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50967Middle" name="517Middle"  value="50967" /><label
					for="50967Middle">영화/드라마</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50972Middle" name="517Middle"  value="50972" /><label
					for="50972Middle">디자인/공예</label></li>
					</ul></div>
					
					<div class="1322 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1322Middle" name="1322Middle" checked="checked" value="1322" /><label
					for="1322Middle">전체</label></li>
						<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49846Middle" name="1322Middle"  value="49846" /><label
					for="49846Middle">토익</label></li>
						<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49845Middle" name="1322Middle"  value="49845" /><label
					for="49845Middle">영어회화</label></li>
						<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49874Middle" name="1322Middle"  value="49874" /><label
					for="49874Middle">영어시험대비</label></li>
						<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49834Middle" name="1322Middle"  value="49834" /><label
					for="49834Middle">영문법</label></li>
						<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49833Middle" name="1322Middle"  value="49833" /><label
					for="49833Middle">영어학습법</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49949Middle" name="1322Middle"  value="49949" /><label
					for="49949Middle">영작문</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49837Middle" name="1322Middle"  value="49837" /><label
					for="49837Middle">영어듣기/말하기</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49884Middle" name="1322Middle"  value="49884" /><label
					for="49884Middle">일본어</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49903Middle" name="1322Middle"  value=49903 /><label
					for="49903Middle">중국어</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="49904Middle" name="1322Middle"  value=49904 /><label
					for="49904Middle">한자</label></li>
					</ul></div>
					
					<div class="13789 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="13789Middle" name="13789Middle" checked="checked" value="13789" /><label
					for="13789Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="70125Middle" name="13789Middle"  value="70125" /><label
					for="70125Middle">주제별 책읽기</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="35088Middle" name="13789Middle" value="35088" /><label
					for="35088Middle">0~3세</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="35089Middle" name="13789Middle"  value="35089" /><label
					for="35089Middle">4~7세</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="48861Middle" name="13789Middle"  value="48861" /><label
					for="48861Middle">그림책</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="35092Middle" name="13789Middle"  value="35092" /><label
					for="35092Middle">놀이책</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="35094Middle" name="13789Middle"  value="35094" /><label
					for="35094Middle">유아 교양/학습</label></li>
					
					</ul></div>
					
					
					<div class="656 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="656Middle" name="656Middle" checked="checked" value="656" /><label
					for="656Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51378Middle" name="656Middle" value="51378" /><label
					for="51378Middle">교양 인문학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51381Middle" name="656Middle" value="51381" /><label
					for="51381Middle">인문 에세이</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51387Middle" name="656Middle" value="51387" /><label
					for="51387Middle">철학 일반</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51390Middle" name="656Middle" value="51390" /><label
					for="51390Middle">서양철학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51395Middle" name="656Middle" value="51395" /><label
					for="51395Middle">심리학/정신분석학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="56640Middle" name="656Middle" value="56640" /><label
					for="56640Middle">책읽기/글쓰기</label></li>
					
					</ul></div>
					
					
					
					<div class="336 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="336Middle" name="336Middle" checked="checked" value="336" /><label
					for="336Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="70214Middle" name="336Middle"  value="70214" /><label
					for="70214Middle">성공</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2951Middle" name="336Middle"  value="2951" /><label
					for="2951Middle">인간관계</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="70236Middle" name="336Middle"  value="70236" /><label
					for="70236Middle">힐링</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="70224Middle" name="336Middle"  value="70224" /><label
					for="70224Middle">협상/설득/화술</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="70220Middle" name="336Middle"  value="70220" /><label
					for="70220Middle">시간관리/정보관리</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="70223Middle" name="336Middle"  value="70223" /><label
					for="70223Middle">창의적사고/두뇌계발</label></li>
					</ul></div>
					
					
					
					
					<div class="17195 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="17195Middle" name="ㅍMiddle" checked="checked" value="17195" /><label
					for="17195Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="7605Middle" name="ㅍMiddle" value="7605" /><label
					for="7605Middle">경제/경영</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="7607Middle" name="ㅍMiddle" value="7607" /><label
					for="7607Middle">건강/의학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="11282Middle" name="ㅍMiddle" value="11282" /><label
					for="11282Middle">과학/기술</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="148481Middle" name="ㅍMiddle" value="148481" /><label
					for="148481Middle">교양/문예/인문</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2925Middle" name="ㅍMiddle" value="2925" /><label
					for="2925Middle">대중문화/예술</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="3560Middle" name="ㅍMiddle" value="3560" /><label
					for="3560Middle">어린이/청소년</label></li>
					</ul></div>
					
					<div class="1237 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1237Middle" name="1237Middle" checked="checked" value="1237" /><label
					for="1237Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51564Middle" name="1237Middle" value="51564" /><label
					for="51564Middle">기독교(개신교)</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51565Middle" name="1237Middle" value="51565" /><label
					for="51565Middle">가톨릭</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51566Middle" name="1237Middle" value="51566" /><label
					for="51566Middle">불교</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="51567Middle" name="1237Middle" value="51567" /><label
					for="51567Middle">세계의 종교</label></li>
					</ul></div>
					
					<div class="1137 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1137Middle" name="1137Middle" checked="checked" value="1137" /><label
					for="1137Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50758Middle" name="1137Middle" value="50758" /><label
					for="50758Middle">청소년 문학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1143Middle" name="1137Middle" value="1143" /><label
					for="1143Middle">청소년 수학/과학</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="4410Middle" name="1137Middle" value="4410" /><label
					for="4410Middle">청소년 영어</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1141Middle" name="1137Middle" value="1141" /><label
					for="1141Middle">청소년 문화/예술</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="32399Middle" name="1137Middle" value="32399" /><label
					for="32399Middle">청소년 자기계발</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="1139Middle" name="1137Middle" value="1139" /><label
					for="1139Middle">청소년 철학</label></li>
					
					</ul></div>
					
					<div class="351 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="351Middle" name="351Middle" checked="checked" value="351" /><label
					for="351Middle">전체</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2630Middle" name="351Middle" value="2630" /><label
					for="2630Middle">그래픽/멀티미디어</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="55977Middle" name="351Middle" value="55977" /><label
					for="55977Middle">모바일 프로그래밍</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="55055Middle" name="351Middle" value="55055" /><label
					for="55055Middle">스마트폰/태블릿/SNS</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="2599Middle" name="351Middle" value="2599" /><label
					for="2599Middle">오피스(엑셀/파워포인트)</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="6348Middle" name="351Middle" value="6348" /><label
					for="6348Middle">웹디자인/홈페이지</label></li>
					<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="437Middle" name="351Middle" value="437" /><label
					for="437Middle">프로그래밍 언어</label></li>
					</ul></div>
					
					<div class="50246 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="50246Middle" name="50246Middle" checked="checked" value="50246" /><label
					for="50246Middle">전체</label></li>
					</ul></div>
					<div class="76000 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="76000Middle" name="76000Middle" checked="checked" value="76000" /><label
					for="76000Middle">전체</label></li>
					</ul></div>
					<div class="76001 Middle">
			<ul id = "selectMiddle">
			<li class="selectBtn"><input type="radio" class="selectMiddle"
					id="76001Middle" name="76001Middle" checked="checked" value="76001" /><label
					for="76001Middle">전체</label></li>
					</ul></div>
		</div>

		<!-- 도서 리스트 -->
		<div id="bookList">

			<div id="selectType">
			
			<span id="selectState1"></span>
			<span id="selectState2"></span>
			<span id="selectState3"></span>
				

			</div>
			<div>
			<p id ="selectState4"></p>
			</div>
			

			<div id="bookEmpty">

				<!-- 도서 빈칸 -->
			</div>




		</div>
		<div id="pagingBox1">
		<div id ="pagingBox2">
		<input class="partBtn" type="button" value="<">
		<div id="paging">
		<!-- 페이지 번호 빈칸 -->
		</div>
		<input class="partBtn" type="button" value=">">
		</div>
		</div>
	</section>
<!-- 책 마우스 확대/축소 애니메이션 -->
	<script>
		function zoomIn(event) {
			event.target.style.transform = "scale(1.1)";
			event.target.style.zIndex = 1;
			event.target.style.transition = "all 0.5s";
		}

		function zoomOut(event) {
			event.target.style.transform = "scale(1)";
			event.target.style.zIndex = 0;
			event.target.style.transition = "all 0.5s";
		}
	</script>

</body>
</html>