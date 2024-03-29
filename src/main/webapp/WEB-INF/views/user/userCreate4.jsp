<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="<c:url value='/css/1235.css' />?vers=<%=cashingVersion%>" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

<style>
</style>
<script>

Kakao.init('0a507b0188cb9238804acc6e662ad5cb'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
	Kakao.Auth.login({
		success: function (response) {
		Kakao.API.request({
			url: '/v2/user/me',
			success: function (response) {
			var nname = response.kakao_account;
			top.location="/main/mainPage.do";
			//console.log(response)
			console.log(nickname.nickname)
			console.log(response.properties)

/* 		 	$.ajax({
				type:"POST",
				url : "/login/kakaoCallBack",
				//data: "userId="+encodeURIComponent($('#userId').val()),
				data: "nickname=" + nname.profile.nickname,
				success:function(result) {

					console.log(result)
				},
				error: function(data) {
					alert('에러가 발생하였습니다.');
					return false;
				},
			});
 */

		},
			fail: function (error) {
			console.log(error)
		},
		})
	},
		fail: function (error) {
		console.log(error)
		},
	})
}

$(function(){

	if("${param.MOVE_ERR}" == "ERRORCONTECT") {
		alert("잘못된 접근입니다. 다시 로그인해주세요.");
		top.location="/user/userCreate4.do";
	}

	if("${param.GBN}" == "SESSIONOUT") {
		alert("세션이 만료되었습니다. 다시 로그인 하여주십시요.");
		top.location="/user/userCreate4.do";
	}

	$('#logBtn').on('click', function(){
		if($('#loginUserId').val() === undefined || $('#loginUserId').val() === "" || $('#loginUserId').val().length === 0 || $.trim($('#loginUserId').val()) === "") {
			alert('로그인 ID를 입력하세요');
			$('#loginUserId').focus();
			return false;
		}
		if($('#loginUserPw').val() === undefined || $('#loginUserPw').val() === "" || $('#loginUserPw').val().length === 0 || $.trim($('#loginUserPw').val()) === "") {
			alert('비밀번호를 입력하세요');
			$('#loginUserPw').focus();
			return false;
		}

		$.ajax({
			type:"POST",
			url : "/login/loginCheck.do",
			//data: "userId="+encodeURIComponent($('#userId').val()),
			data: "loginUserId=" + $('#loginUserId').val()+'&loginUserPw=' + $('#loginUserPw').val(),
			success:function(result) {

				if(result === 'fal') {
					alert('아이디 또는 패스워드가 틀렸습니다.')
					return false;
				} else {
					location.href = "/main/mainPage.do";
				}

			},
			error: function(e) {
				alert('에러가 발생하였습니다.');
				return false;
			},
		});
	});
});

function createUser() {

	if($('#userId').val() === undefined || $('#userId').val() === "" || $('#userId').val().length === 0 || $.trim($('#userId').val()) === "") {
		alert('ID를 입력하세요');
		$('#userId').focus();
		return false;
	}

	// 4~20자 이내의 영문,숫자 아이디 (특문 X) , 공백 안됨 , 동일한 5자 이상 안됨
	var regId = /^(?!.*([a-zA-Z0-9])\1{4})[a-zA-Z0-9]{4,20}$/;

	if(!regId.test($("#userId").val())) {
		alert("잘못된 아이디 형식입니다. (4~20자 이내 영문,숫자를 사용한 아이디)");
		$('#userId').val('');
		$('#userId').focus();
		return false;
	};

	if($('#userNm').val() === undefined || $('#userNm').val() === "" || $('#userNm').val().length === 0 || $.trim($('#userNm').val()) === "") {
		alert('이름을 입력하세요');
		$('#userNm').focus();
		return false;
	}

	//2~10자 이내의 한글명
	var regHangul = /^[가-힣]{2,10}$/;

	if(!regHangul.test($("#userNm").val())) {
		alert("2~10자 이내의 한글만 입력 가능합니다.");
		$('#userNm').val('');
		$('#userNm').focus();
		return false;
	};

	if($('#userPw').val() === undefined || $('#userPw').val() === "" || $('#userPw').val().length === 0 || $.trim($('#userPw').val()) === "") {
		alert('비밀번호를 입력하세요');
		$('#userPw').focus();
		return false;
	}

	//	8 ~ 16자 영문, 숫자 조합
	//	/^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,16}$/

	//비밀번호 영문자+숫자+특수조합(8~16자리 입력) 정규식
	var regpw = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

	if(!regpw.test($("#userPw").val())) {
		alert("비밀번호는 영문자+숫자+특수문자 조합으로 8~16자리 사용해야 합니다.");
		$('#userPw').val('');
		$('#userPw').focus();
		return false;
	};

	if($('#userPwCheck').val() === undefined || $('#userPwCheck').val() === "" || $('#userPwCheck').val().length === 0 || $.trim($('#userPwCheck').val()) === "") {
		alert('비밀번호 확인을 입력하세요');
		$('#userPwCheck').focus();
		return false;
	}

	//비밀번호 확인
	if($('#userPwCheck').val() != $('#userPw').val()) {
		alert("비밀번호가 일치하지 않습니다..");
		$('#userPwCheck').val('');
		$('#userPwCheck').focus();
		return false;
	}

	if($('#userEmail').val() === undefined || $('#userEmail').val() === "" || $('#userEmail').val().length === 0 || $.trim($('#userEmail').val()) === "") {
		alert('이메일을 입력하세요');
		$('#userEmail').focus();
		return false;
	}

	// email 유효성검사
	var regemail = /([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;

	if(!regemail.test($("#userEmail").val())) {
		alert("잘못된 Email 형식입니다.");
		$('#userEmail').val('');
		$('#userEmail').focus();
		return false;
	}

	if($('#userPhone').val() === undefined || $('#userPhone').val() === "" || $('#userPhone').val().length === 0 || $.trim($('#userPhone').val()) === "") {
		alert('전화번호를 입력하세요');
		$('#userPhone').focus();
		return false;
	}

	//숫자만 입력하는 정규식
	var regphone = /^(01[016789]{1})[0-9]{3,4}[0-9]{4}$/;

	if(!regphone.test($("#userPhone").val())) {

		alert("전화번호는 숫자만 입력할 수 있으며, 올바른 형식이어야 합니다.");
		$('#userPhone').val('');
		$('#userPhone').focus();
		return false;
	}

	if($('#userFirstAddr').val() === undefined || $('#userFirstAddr').val() === "" || $('#userFirstAddr').val().length === 0 || $.trim($('#userFirstAddr').val()) === "") {
		alert('주소를 입력하세요');
		$('#userFirstAddr').focus();
		return false;
	}

	if($('#userSecondAddr').val() === undefined || $('#userSecondAddr').val() === "" || $('#userSecondAddr').val().length === 0 || $.trim($('#userSecondAddr').val()) === "") {
		alert('상세 주소를 입력하세요');
		$('#userSecondAddr').focus();
		return false;
	}

	var obj = document.joinForm;
	obj.action = "/user/userCreateInsert.do";
	obj.method = "post";
	obj.submit();

	alert("회원가입이 완료 되었습니다.");
}

function idCheck() {

	var userId = $('#userId').val();


	if(userId === undefined || userId === "" || userId.length === 0 || $.trim(userId) === "") {
		alert('ID를 입력하세요');
		$('#userId').focus();
		return false;
	}

	$.ajax({
		type:"POST",
		url : "/user/createIdCheck.do",
		//data: "userId="+encodeURIComponent($('#userId').val()),
		data: "userId=" + userId,
		success:function(result) {

			console.log(result)

			if(result === true) {
				alert("가입된 아이디가 있습니다.")
			} else {
				alert("가입 해")
			}
			/* if(data == "ok") {
				$("#createIdSpan").css("color", "blue").css("font-size", "10px").css("margin-top","5px").css("margin-left","5px").css("width","235px").css("float","left");
				$(".idSuccess").remove();
				document.getElementById("createIdSpan").innerHTML = "사용 할 수 있는 아이디입니다.";
			}
			if(data == "fal") {
				$("#createIdSpan").css("color", "red").css("font-size", "10px").css("margin-top","5px").css("margin-left","5px").css("width","235px").css("float","left");
				document.getElementById("createIdSpan").innerHTML = "중복된 ID가 있습니다. 다른 ID를 입력하여 주십시요.";
			} */
		},
		error: function(data) {
			alert('에러가 발생하였습니다.');
			return false;
		},
	});
}


function sendEmail() {
	$.ajax({
		url : "/mail/joinCode.do",
		type:"POST",
		data : 'joinEmail=youngjin309@naver.com',
		success:function(result) {
			alert('메일이 발송 되었습니다.')
		},
		error: function(e) {
		},
	});
}

function changePw() {
	$.ajax({
		url : "/mail/resetPassword.do",
		type:"POST",
		data : 'pwUserId=skysky&pwEmail=youngjin309@naver.com',
		success:function(result) {
			alert('임시 비번이 발송 되었습니다.')
		},
		error: function(e) {
		},
	});
}
</script>

<div class="header">
	<div class="login-wrap">
		<div class="login-html">
			<input id="tab-1" type="radio" name="tab" class="sign-in" checked /><label for="tab-1" class="tab">로그인</label>
			<input id="tab-2" type="radio" name="tab" class="sign-up" /><label for="tab-2" class="tab">회원가입</label>
			<div class="login-form">
				<div class="sign-in-htm">
					<div class="textForm">
						<input name="loginUserId" id="loginUserId" type="text" class="loginUserId" placeholder="아이디" autocomplete="off" />
					</div>
					<div class="textForm">
						<input name="loginUserPw" id="loginUserPw" type="password" class="loginUserPw" placeholder="비밀번호" autocomplete="off" />
					</div>
					<div class="group">
						<input id="check" type="checkbox" class="check" checked />
						<label for="check"><span class="icon"></span> 아이디 기억하기</label>
					</div>
					<div class="group">
						<button type="button" onclick="" class="button" id="logBtn">로그인</button>
					</div>
					<div class="naverDiv">
						<a class="lodingStart" id="naver_id_login"></a>		<!-- 네이버아이디로로그인 버튼 노출 영역 -->
						<a href="javascript:kakaoLogin()"><img src="/image/kakao_login.png" /></a>	<!-- 카카오아이디로그인 -->
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<a href="#forgot">비밀번호를 잊으셨나요?</a>
					</div>
				</div>
				<form class="" name="joinForm">
					<div class="sign-up-htm">
					<div class="textForm">
						<input name="userId" id="userId" type="text" class="userId" placeholder="아이디" autocomplete="off" />
						<button type="button" style="float: right;" onclick="idCheck();" class="userIdCheck" id="userIdCheck">중복 확인</button>
					</div>
					<div class="textForm">
						<input name="userNm" id="userNm" type="text" class="userNm" placeholder="이름" autocomplete="off" />
					</div>
					<div class="textForm">
						<input name="userPw" id="userPw" type="password" class="userPw" placeholder="비밀번호" autocomplete="off" />
					</div>
					<div class="textForm">
						<input name="userPwCheck" id="userPwCheck" type="password" class="userPwCheck" placeholder="비밀번호 확인" autocomplete="off" />
					</div>
					<div class="textForm">
						<input name="userEmail" id="userEmail" type="text" class="userEmail" placeholder="이메일" autocomplete="off" />
					</div>
					<div class="textForm">
						<input name="userPhone" id="userPhone" type="text" class="userPhone" placeholder=" - 를 제외한 전화번호" autocomplete="off" />
					</div>
					<div class="textForm">
						<input name="userFirstAddr" id="userFirstAddr" type="text" class="userFirstAddr" placeholder="주소" autocomplete="off" />
						<button type="button" style="float: right;" onclick="juso();" class="addrSearch" id="addrSearch">주소 검색</button>
						<input class="userSecondAddr" type="text" name="userSecondAddr" id="userSecondAddr" placeholder="상세 주소" autocomplete="off" />
					</div>
					<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode();" alt="닫기 버튼" />
					</div>
					<div class="group">
						<button type="button" onclick="createUser();" class="button" id="button">회원등록</button><br>
						<button type="button" onclick="sendEmail();" class="button" id="button">인증코드</button><br>
						<button type="button" onclick="changePw();" class="button" id="button">임시비번</button><br>
					</div>
					<div class="hr"></div>
					<div class="foot-lnk">
						<label for="tab-1">이미 회원이신가요?</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<script>
	// 우편번호 찾기 화면을 넣을 element
	var element_layer = document.getElementById('layer');

	function closeDaumPostcode() {
		// iframe을 넣은 element를 안보이게 한다.
		element_layer.style.display = 'none';
	}

	function juso() {
		new daum.Postcode({
			oncomplete: function(data) {
				// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById("userFirstAddr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("userSecondAddr").focus();

				// iframe을 넣은 element를 안보이게 한다.
				// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					element_layer.style.display = 'none';
			},
			width : '100%',
			height : '100%',
			maxSuggestItems : 5
		}).embed(element_layer);

		// iframe을 넣은 element를 보이게 한다.
		element_layer.style.display = 'block';

		// iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
		initLayerPosition();
	}

	// 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
	// resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
	// 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
	function initLayerPosition(){
		var width = 300; //우편번호서비스가 들어갈 element의 width
		var height = 400; //우편번호서비스가 들어갈 element의 height
		var borderWidth = 5; //샘플에서 사용하는 border의 두께

		// 위에서 선언한 값들을 실제 element에 넣는다.
		element_layer.style.width = width + 'px';
		element_layer.style.height = height + 'px';
		element_layer.style.border = borderWidth + 'px solid';
		// 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/25 - borderWidth) + 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
	}
</script>

<script src="<c:url value='/js/loginApi.js' />?vers=<%=cashingVersion%>" charset="utf-8"></script>
