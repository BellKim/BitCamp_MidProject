<%@page import="db.DBConnection"%>
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
DBConnection.initConnection(); 
response.sendRedirect(request.getContextPath()+"/client_view/main.jsp");
%>

</body>
</html>