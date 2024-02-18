<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="/resources/js/jquery-3.2.1.min.js"></script>
</head>

<style>
</style>

<script>
$(function(){
	if("${param.GBN}" == "SESSIONOUT") {
		alert("세션이 만료되었습니다. 다시 로그인 하여주십시요.");
		// top.location="/login/login.do";
	}
});
</script>

<body>
	<h1>로그인 페이지</h1>
</body>
</html>