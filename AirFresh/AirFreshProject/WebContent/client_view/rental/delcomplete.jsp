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
	String command = request.getParameter("command");
	System.out.println("command: "+command);
	
	if(command.equals("true")){
%>
		<h1>주문 취소 성공</h1>
<%
	}
%>

</body>
</html>