let userForm = document.userForm;
let userID = userForm.userID;
let verifyUserID = userForm.verifyUserID;
let userPassword = userForm.userPassword;
let userPasswordConfirm = userForm.userPasswordConfirm;
let userName = userForm.userName;
let userBirth = userForm.birth;
let userEmailName = userForm.emailName;
let userEmailDomain = userForm.emailDomain;
let userEmailDomainSelect = userForm.emailDomainSelect;
let verifyConfirmYn = userForm.confirmYn;
let userPhoneNumber = "";
let userPhoneNumber1 = userForm.phoneNumber1;
let userPhoneNumber2 = userForm.phoneNumber2;
let userPhoneNumber3 = userForm.phoneNumber3;
let userAddr1 = userForm.addr1;
let userAddr2 = userForm.addr2;
let userAddr3 = userForm.addr3;

// 아이디 중복 확인 함수
function CheckUserID() {
	if (CheckVerifyUserID() !== true) {
		// 아이디가 올바른 정보가 아니면 취소
		return false;
	}
	
	// 데이터 작성
	let data = {
		userID: userID.value,
	};
	$.ajax({
		method: 'POST',
		
		url: '/koala/user/verify',    // AJAX 통신 시도할 URL 주소,컨트롤러
		headers: {
			'Accept': 'application/json',   //컨트롤러에서  @RequestBody 불러올 때
			'Content-Type': 'application/json',    //사용해야하는 요청데이터를 정의하는영역(Request Header), (Accept / Content-Type -> 제이슨의 MIME 타입)
		}, 
		data: JSON.stringify(data),    //js함수를 제이슨문자열로변환하는 제이슨내함수
		async: false,
		success: function(response) {
			if (response.status == true) {
				verifyUserID.value = '';
				alert("이미 존재하는 아이디입니다.");
			} else {
				verifyUserID.value = userID.value;
				alert("사용 가능한 아이디입니다.");
				
			}
		},
		error: function(reason) {
			console.error(reason);
		},
	});
}

// 데이터 전송
function formSubmit() {
	// 각 입력 폼 조건 검증 function안에 function
	let conditions = [
		CheckVerifyUserID(),
		CheckUserPassword(),
		checkUserPasswordConfirm(),
		checkUserName(),
		checkUserBirth(),
		checkUserEmail(),
		checkUserPhone(),
		checkUserAddress(),
		checkVerifyConfirmYn(),
	];
	
	// 성공한 개수
	let completeConditions = conditions.filter(function(condition) {
		return condition === true;
	});
	
	// 하나라도 문제가 있으면 submit 종료
	if (conditions.length !== completeConditions.length) {
		return false;
	}
	
	// 사용자 아이디 중복체크 여부
	if (verifyUserID.value == false) {
		let error = userForm.querySelector('#error-userID');
		
		error.textContent = '아이디를 중복체크 해주세요.';
		
		return false;
	}
	
	// 데이터 작성
	let data = {
		userID: userID.value,
		userPassword: userPassword.value,
		userName: userName.value,
		email: `${userEmailName.value}@${userEmailDomain.value}`,
		phoneNumber: `${userPhoneNumber1.value}-${userPhoneNumber2.value}-${userPhoneNumber3.value}`,
		birth: userBirth.value,
		addr1: userAddr1.value,
		addr2: userAddr2.value,
		addr3: userAddr3.value,
	};
	
	$.ajax({
		method: 'POST',
		url: '/koala/user/create',
		headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json',
		},
		data: JSON.stringify(data),
		async: false,
		success: function(response) {
			if (response.status) {
				alert('회원가입 성공!');
				//로그인 페이지로 이동
				location.href="/koala/login";

			} else {
				if (response.message !== undefined) {
					alert(response.message);
				}
			}
		},
		error: function(reason) {
			console.error(reason);
		},
	});
}

// 사용자 ID 검증
function CheckVerifyUserID() {
	let error = userForm.querySelector('#error-userID');
	
	if (userID.value === '') {
		error.textContent = '아이디를 입력해주세요.';
		return false;
	}
	
	if (userID.value.length < 4 || userID.value.length > 10) {
		error.textContent = '아이디는 4자 이상 10자 이하로 입력해주세요.';
		return false;
	}
	
	// 아이디 변경 시 중복 체크 초기화
	if (verifyUserID.value !== userID.value) {
		verifyUserID.value = '';
	}
	
	error.textContent = '';
	
	return true;
}
userID.addEventListener('input', CheckVerifyUserID);

// 사용자 비밀번호 검증
function CheckUserPassword() {
	let error = userForm.querySelector('#error-userPassword');
	
	if (userPassword.value === '') {
		error.textContent = '비밀번호를 입력해주세요.';
		return false;
	}
	
	if (userPassword.value.length < 8 || userPassword.value.length > 20) {
		error.textContent = '비밀번호는 8자 이상 20자 이하로 입력해주세요.';
		return false;
	}
	
	if (new RegExp(/(?=.*[0-9]{2}.*)(?=.*[a-zA-Z]{2}.*)(?=.*[~!@@#$%^&*|₩₩₩'₩";:₩]{2}.*)/).test(userPassword.value) == false) {
		error.textContent = '비밀번호는 영문, 숫자, 특수문자 2자 이상 포함하여 입력해주세요.';
		return false;
	}
	
	error.textContent = '';
	return true;
}
userPassword.addEventListener('input', CheckUserPassword);

// 사용자 비밀번호 확인 검증
function checkUserPasswordConfirm() {
	let error = userForm.querySelector('#error-userPasswordConfirm');
	
	if (userPassword.value !== userPasswordConfirm.value) {
		error.textContent = '비밀번호가 일치하지 않습니다.';
		return false;
	}
	
	error.textContent = '';
	return true;
}
userPasswordConfirm.addEventListener('input', checkUserPasswordConfirm);

// 사용자 이름 검증
function checkUserName() {
	let error = userForm.querySelector('#error-userName');
	
	if (userName.value == '') {
		error.textContent = '이름을 입력해주세요.';
		return false;
	}
	
	if (new RegExp(/[a-z0-9]|[  \[\]{}()<>?|~!@#$%^&*-_+=,.;:\"'\\]/).test(userName.value) == true) {
		error.textContent = '이름은 한글만 입력해주세요.';
		return false;
	}
	
	error.textContent = '';
	return true;
}
userName.addEventListener('input', checkUserName);

// 사용자 생년월일 검증
function checkUserBirth() {
	let error = userForm.querySelector('#error-birth');
	
	if (userBirth.value == '') {
		error.textContent = '생년월일을 입력해주세요.';
		return false;
	}
	
	error.textContent = '';
	return true;
}
userBirth.addEventListener('input', checkUserBirth);

// 사용자 이메일 검증
function checkUserEmail() {
	let error = userForm.querySelector('#error-email');
	
	if (userEmailName.value === '') {
		error.textContent = '이메일 아이디를 입력해주세요.';
		return false;
	}
	
	if (userEmailDomain.value === '') {
		error.textContent = '도메인 주소를 입력해주세요.';
		return false;
	}
	
	error.textContent = '';
	return true;
}
userEmailName.addEventListener('input', checkUserEmail);
userEmailDomain.addEventListener('input', checkUserEmail);

// 사용자 이메일 선택 박스
userEmailDomainSelect.addEventListener('input', function() {
	// 직접입력 조건문
	if (userEmailDomainSelect.selectedIndex === 0) {
		userEmailDomain.removeAttribute('readonly');
		userEmailDomain.value = '';
	} else {
		userEmailDomain.setAttribute('readonly', 'readonly');
		userEmailDomain.value = userEmailDomainSelect.value;
	}
	checkUserEmail();
});

// 사용자 이메일 인증 여부
function checkVerifyConfirmYn() {
	let error = userForm.querySelector('#error-email');
	
	if (verifyConfirmYn.value != '1') {
		
		error.textContent = '이메일 인증을 해주세요.';
		return false;
	}
	
	error.textContent = '';
	return true;
}
verifyConfirmYn.addEventListener('input', checkVerifyConfirmYn);

// 사용자 전화번호 검증
function checkUserPhone() {
	let error = userForm.querySelector('#error-phoneNumber');
	
	if (userPhoneNumber1.value == '') {
		error.textContent = '전화번호 앞자리를 입력해주세요.';
		return false;
	}
	
	if (userPhoneNumber2.value == '') {
		error.textContent = '전화번호 두 번째 자리를 입력해주세요.';
		return false;
	}
	
	if (userPhoneNumber3.value == '') {
		error.textContent = '전화번호 입력을 완료해주세요.';
		return false;
	}
	
	error.textContent = '';
	return true;
}
userPhoneNumber1.addEventListener('input', checkUserPhone);
userPhoneNumber2.addEventListener('input', checkUserPhone);
userPhoneNumber3.addEventListener('input', checkUserPhone);

// 사용자 주소 검증
function checkUserAddress() {
	let error = userForm.querySelector('#error-addr1');
	
	if (userAddr1.value == '') {
		error.textContent = '주소를 입력해주세요.';
		return false;
	}
	
	error.textContent = '';
	return true;
}

// 전화번호 하이픈 변환
function autoHyphen(formControl) {
	formControl.value = formControl.value
		.replace(/[^0-9]/g, '') // 0~9 숫자가 아닌 모든 텍스트 공백으로
		.replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, '$1-$2-$3'); // 숫자에 대해 XXX-XXXX-XXXX 형태로 변경
}

