<%@page import="Dto.ManagerMemberDto"%>
<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	DBConnection.initConnection(); 
	ManagerMemberDto mrgMem = new ManagerMemberDto(6000, 0, "k_admin", null, "왕관리자", 0, 01012341234, 0);
	session.setAttribute("mrgLogin", mrgMem);
	session.setMaxInactiveInterval(3600);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<%=request.getContextPath()%>/noticelist?command=admin">공지사항
		본다</a>
</body>
</html>