<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
String command = request.getParameter("command");
String str = request.getParameter("isS");
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(command.equals("register")){
%>
	<%
	if(str.equals("true")) {
	%>
		<script type="text/javascript">
		alert("회원이 되신 것을 환영합니다!");			//client_view/member/login.jsp
		location.href = "<%=request.getContextPath() %>/login?command=login";	
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
}
%>

<%
if(command.equals("update")){
%>
<%
if(str.equals("true")){
%>
	<script type="text/javascript">	
	alert("성공적으로 수정 되었습니다");
	location.href = "<%=request.getContextPath() %>/updatemem?command=update&id=<%=mem.getMem_id() %>";
	/* response.sendRedirect(request.getContextPath()+"/client_view/main.jsp"); */
	<%-- location.href = "<%=request.getContextPath()%>/noticelist?command=admin"; --%>
	</script>	
<%
}else if(str.equals("false")){
%>
	<script type="text/javascript">	
	alert("수정 되지 않았습니다");	
	location.href = "<%=request.getContextPath() %>/login?command=login";
	</script>
<%
	}
}
%>

</body>
</html>