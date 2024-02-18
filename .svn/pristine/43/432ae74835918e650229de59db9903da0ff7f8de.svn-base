<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/menu/menuList.do" />
<script>

$(function(){
    $(".passwordDiv").hide();
    $("#saveBtn").hide();
    $("#pwDiv").hide();
    $("#pwChkDiv").hide();
    //$("#userNm").attr("readonly", "true")
    $('#uptBtn').on('click', function(){
        $(".myPageDiv").hide();
        $(".passwordDiv").show();
    })

    $("#pwCheck").on('click', function(){
    	pwCheck();
    })


});


function pwCheck(){
	if($('#updatePwCheck').val() === undefined || $('#updatePwCheck').val() === "" || $('#updatePwCheck').val().length === 0 || $.trim($('#updatePwCheck').val()) === "") {
		alert('비밀번호를 입력하세요');
		$('#userId').focus();
		return false;
	}

	$.ajax({
		type: 'POST',
		url: '/user/pwCheck.do',
		data: {'password': $('#updatePwCheck').val()},
		success: function(result){
			if(result === 'SUCC'){
				$(".passwordDiv").hide();
				$(".myPageDiv").show();
				$("#pwDiv").show();
				$("#pwChkDiv").show();
				$("#userNm").attr("readonly", false)
				$('#userEmail').attr("readonly", false)
				$('#userPhone').attr("readonly", false)
				$('#userSecondAddr').attr("readonly", false)
				$('#saveBtn').show();
				$('#uptBtn').hide();
			} else {
				alert("비밀번호가 올바르지 않습니다");
			}
		},
		error: function(result){
			alert("에러");
		}
	})
}

function updateUser() {
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

	$.ajax({
		type: 'POST',
		url: '/user/userUpdate.do',
		data: $('form[name=userInfo]').serialize(),
		success: function(result){
			if(result === 'SUCC'){
				alert("회원정보 수정 완료되었습니다");
				location.reload();
			} else {
				alert("회원정보 수정 중에 에러가 발생하였습니다");
			}
		},
		error: function(result){
			alert("에러");
		}
	})
}

</script>
	<div class="myPageDiv" >
		<div class="myPageContentDiv">
			<form name="userInfo">
				<div class="inputDiv">
					<div class="inputLabel"><span class="inputLabel">아이디 : </span></div>
					<div class="inputArea"><input type="text" id="userId" value="${userInfo.userId }" readonly="true" name="userId" class="inputUser"></div>
				</div>
				<div class="inputDiv">
					<div class="inputLabel"><span class="inputLabel">이름 : </span></div>
					<div class="inputArea"><input type="text" readonly="true" id="userNm" name="userNm" value="${userInfo.userNm }" class="inputUser"></div>
				</div>
				<div class="inputDiv" id="pwDiv">
					<div class="inputLabel"><span class="inputLabel">새 비밀번호 : </span></div>
					<div class="inputArea"><input type="password" id="userPw" name="userPw" class="inputUser"></div>
				</div>
				<div class="inputDiv" id="pwChkDiv">
					<div class="inputLabel"><span class="inputLabel">새 비밀번호 확인 : </span></div>
					<div class="inputArea"><input type="password" id="userPwCheck" name="userPwCheck" class="inputUser"></div>
				</div>
				<div class="inputDiv">
					<div class="inputLabel"><span class="inputLabel">이메일 : </span></div>
					<div class="inputArea"><input type="text" readonly="true" id="userEmail" name="userEmail" value="${userInfo.userEmail }" class="inputUser"></div>
				</div>
				<div class="inputDiv">
					<div class="inputLabel"><span class="inputLabel">전화번호 : </span></div>
					<div class="inputArea"><input type="text" readonly="true" id="userPhone" name="userPhone" value="${userInfo.userPhone }" class="inputUser"></div>
				</div>
				<div class="inputAddrDiv">
					<div class="inputLabel"><span class="inputLabel">주소 : </span></div>
					<div class="inputArea">
						<input type="text" id="userFirstAddr" readonly="true" name="userFirstAddr" class="inputBasicAddr" value="${userInfo.userFirstAddr }"><button type="button" onclick="juso();" class="zipNoBtn">우편번호</button><br><br>
						<input type="text" id="userSecondAddr" readonly="true" name="userSecondAddr" class="inputAddrDtl">
					</div>
				</div>
				<div class="myPageBtnArea">
					<button type="button" class="zipNoBtn" id="uptBtn">수정</button>
					<button type="button" class="zipNoBtn" id="saveBtn" onclick="updateUser();">저장</button>
				</div>
				<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
					<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode();" alt="닫기 버튼" />
				</div>
			</form>
		</div>
	</div>

	<div class="passwordDiv">
		<div class="passwordContentDiv">
			<div class="inputDiv">
				<div class="inputLabel"><span class="inputLabel"> 비밀번호 입력 : </span></div>
				<div class="inputArea"><input type="password" id="updatePwCheck" class="inputUser"></div><br/>
			</div>
			<div class="myPageBtnArea">
				<button type="button" class="zipNoBtn" id="pwCheck">확인</button>
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
		element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/10 - borderWidth) + 'px';
		element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/3 - borderWidth) + 'px';
	}
</script>
