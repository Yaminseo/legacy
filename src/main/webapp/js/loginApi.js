//네이버아이디로로그인 버튼 노출 영역
var naverKey = "";
if($(location).attr('host') == "localhost:7070" || $(location).attr('host') == "localhost:7070" || $(location).attr('host') == "localhost") {
	naverKey = '9jyaj7TMINHHl984ricx';
}

var naver_id_login = new naver_id_login(naverKey, "http://" + $(location).attr('host') + "/login/naverCallBack.do");
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 3,50);
naver_id_login.setDomain("http://" + $(location).attr('host'));
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();