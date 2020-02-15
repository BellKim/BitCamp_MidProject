<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str = request.getParameter("isS");	// addMem
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(str.equals("true")) {
%>
	<script type="text/javascript">
	alert("회원이 되신 것을 환영합니다!");
	location.href = "<%=request.getContextPath() %>/client_view/member/login.jsp";	
	</script>
<%
}else if(str.equals("false")) {
%>
	<script type="text/javascript">
	alert("가입 실패!");
	location.href = "<%=request.getContextPath() %>/client_view/member/register.jsp";
	</script>
<% 
}
%>

</body>
</html>