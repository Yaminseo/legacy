<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world! 안녕하세요
</h1>

<form action="/hhh">
	<input type="text" name="param" value="@@@" />
	<input type="text" name="param" />
	<button>전송</button>
</form>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
