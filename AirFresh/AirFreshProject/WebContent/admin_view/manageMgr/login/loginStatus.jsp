<%@page import="Dto.ManagerMemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ManagerMemberDto memdto = (ManagerMemberDto )session.getAttribute("managerLogin");
	
	System.out.println(memdto);
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>
		<%=memdto.toString()%>
	</h2>

</body>
</html>