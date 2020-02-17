<%@page import="Dto.AsAppDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	MemberDto mem = (MemberDto)session.getAttribute("login");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>(마이페이지)</h3>
<%
	String command = request.getParameter("command");

	if(command.equals("true")){
%>
		<a href="<%=request.getContextPath() %>/printAsApp?id=<%=mem.getMem_id()%>">수리내역</a>
<%
	} else {
%>
		<h1>AS수리요청 실패</h1>
<%
	}
%>

</body>
</html>