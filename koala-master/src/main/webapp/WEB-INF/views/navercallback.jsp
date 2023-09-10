<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- (1) LoginWithNaverId Javscript SDK -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<form id="form-naver-login" method="post" action="naverLogin">
               			<input type="hidden" name="id"/>
		    			<input type="hidden" name="name"/>
		    			<input type="hidden" name="email"/>
		    			<input type="hidden" name="gender"/>
		    			<input type="hidden" name="mobile"/>
		    			<input type="hidden" name="login_type" value="2">
	</form>




	<!-- (2) LoginWithNaverId Javscript 설정 정보 및 초기화 -->
	<script>
		var naverLogin = new naver.LoginWithNaverId(
			{
				clientId: "a8aA2wlSgmuntljovu6o",
				callbackUrl: "http://localhost:8090/<c:url value='/navercallback' />",
				isPopup: false,
				callbackHandle: true
				/* callback 페이지가 분리되었을 경우에 callback 페이지에서는 callback처리를 해줄수 있도록 설정합니다. */
			}
		);

		/* (3) 네아로 로그인 정보를 초기화하기 위하여 init을 호출 */
		naverLogin.init();

		/* (4) Callback의 처리. 정상적으로 Callback 처리가 완료될 경우 main page로 redirect(또는 Popup close) */
		window.addEventListener('load', function () {
			naverLogin.getLoginStatus(function (status) {
				if (status) {

					//let token = naverLogin.accessToken.accessToken;
					let id = naverLogin.user.getId();
					let name = naverLogin.user.getName();
					let email = naverLogin.user.getEmail();
					let gender = naverLogin.user.getGender();
					let birthday = naverLogin.user.getBirthday();
					let birthyear = naverLogin.user.getBirthyear();
					let mobile = naverLogin.user.getMobile();
		
					//$('#form-naver-login input[name=token]').val(token);
					$('#form-naver-login input[name=id]').val(id);
					$('#form-naver-login input[name=name]').val(name);
					$('#form-naver-login input[name=email]').val(email);
					$('#form-naver-login input[name=gender]').val(gender);
					$('#form-naver-login input[name=birthday]').val(birthday);
					$('#form-naver-login input[name=birthyear]').val(birthyear);
					$('#form-naver-login input[name=mobile]').val(mobile);
					
					document.querySelector('#form-naver-login').submit();
					
				} else {
					console.log("callback 처리에 실패하였습니다.");
				}
			});
		});
	</script>
</body>
</html>