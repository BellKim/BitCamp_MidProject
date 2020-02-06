<%@page import="singleton.singleton"%>
<%@page import="Service.MemberService"%>
<%@page import="ServiceITF.MemberServiceInterface"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String hell = request.getParameter("hel");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%=hell %></h1>
	
	

</body>
</html>