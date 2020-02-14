<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
MemberDto mem = (MemberDto)request.getAttribute("login");	//memLogin
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
if(mem != null && !mem.getMem_id().equals("")){
	session.setAttribute("login", mem);
	session.setMaxInactiveInterval(30*60*60);
%>
	<script type="text/javascript">
	alert("안녕하세요 ♥<%=mem.getMem_name() %>♥님");
	//지예씨 코드   location.href = "./client_view/member/mypage.jsp";
	
	//로그인 성공시 메인페이지로 이동 
	location.href = "<%=request.getContextPath() %>/index.jsp";
	</script>
<%
}else{// 왜 밑에 창이 안뜰까?
%>
	<script type="text/javascript">
	alert("id나 password를 확인하십시오");
	location.href = "./client_view/member/login.jsp";
	</script>	
<% 
}
%>

</body>
</html>