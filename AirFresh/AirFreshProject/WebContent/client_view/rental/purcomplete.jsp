<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String isS = request.getParameter("isS");

	if(isS.equals("true")){
%>
	<h1>결제완료</h1>
<%
	} else {
%>
	<h1>결제실패</h1>
<%
	}
%>
</body>
</html>