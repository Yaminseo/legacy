<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="<c:url value='/js/chkBrowser.js'/>?vers=<%=cashingVersion%>" charset="utf-8"></script>
</head>
<body>
<script>
var naverKey = "";
if($(location).attr('host') == "localhost:7070" || $(location).attr('host') == "localhost:7070") {
	naverKey = '9jyaj7TMINHHl984ricx';
}

var naver_id_login = new naver_id_login(naverKey, "http://" + $(location).attr('host') + "/login/naverCallBack.do");

// 접근 토큰 값 출력
var state = naver_id_login.oauthParams.access_token;

// 네이버 사용자 프로필 조회
naver_id_login.get_naver_userprofile("naverSignInCallback()");

// 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
function naverSignInCallback() {
	//alert(naver_id_login.getProfileData('email'));
	alert(naver_id_login.getProfileData('nickname')  + ' 님 환영합니다.');
	//alert(naver_id_login.getProfileData('age'));

	// IE에서는 한글을 유니코드 형식으로 변환을 해줘야 재대로 로그인이 된다.(encodeURI())추가
	opener.parent.location='http://' + $(location).attr('host') + '/login/loginCheck2.do?success=success&nickname='+ encodeURI(naver_id_login.getProfileData('nickname')) +'&state=' + state;
	window.close();
}

if(naver_id_login.oauthParams.access_token == null) {
	opener.parent.location='http://' + $(location).attr('host') + '/user/userCreate4.do?MOVE_ERR=ERRORCONTECT';
	window.close();
}
</script>
</body>
</html>