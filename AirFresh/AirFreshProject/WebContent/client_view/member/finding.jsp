<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str = request.getParameter("isS");	// addMem
MemberDto mem = (MemberDto)request.getAttribute("login");	//memLogin
String str1 = request.getParameter("isS1");		// idCheck	null;//
String str2 = request.getParameter("isS2");		// delMem	null;//
String str3 = request.getParameter("isS3");		// updateMem	null;//
String str4 = request.getParameter("id");	// FindID(PW)
String str5 = request.getParameter("pw");	// Find(ID)PW
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--  ↓ 문제임!! -->
<%
if(str.equals("true")) {
%>
	<script type="text/javascript">
	alert("회원이 되신 것을 환영합니다!");
	location.href = "./client_view/member/login.jsp";
	</script>
<%
}else if(str.equals("false")) {
%>
	<script type="text/javascript">
	alert("가입 실패!");
	location.href = "./client_view/member/register.jsp";
	</script>
<% 
}
%>

<%
if(mem != null && !mem.getMem_id().equals("")){
	session.setAttribute("login", mem);
	session.setMaxInactiveInterval(30*60*60);
%>
	<script type="text/javascript">
	alert("안녕하세요 <%=mem.getMem_name() %>님");
	location.href = "./client_view/member/mypage.jsp";
	</script>
<%
}else if(mem == null || mem.getMem_id().equals("")){
%>
	<script type="text/javascript">
	alert("id나 password를 확인하십시오");
	location.href = "./client_view/member/login.jsp";
	</script>	
<% 
}
%>	
	
<%
if(str1.equals("true")){
%>	
	<script type="text/javascript">
	alert("중복된 아이디가 있습니다.");
	location.href = "./client_view/member/register.jsp";
	</script>
<%
}else if(str1.equals("false")){
%>
	<script type="text/javascript">
	alert("사용 가능한 아이디입니다");	
	</script>
<% 
}
%>	

<%
if(str2.equals("true")){
%>	
	<script type="text/javascript">
	alert("정상적으로 삭제되었습니다");
	location.href = "./client_view/member/login.jsp";
	</script>
<%
}else if(str2.equals("false")){
%>
	<script type="text/javascript">
	alert("삭제되지 않았습니다");
	location.href = "./client_view/member/mypage.jsp";
	</script>
<% 
}
%>	

<%
if(str3.equals("true")){
%>
	<script type="text/javascript">
	alert("성공적으로 수정 되었습니다");	
	</script>	
<%
}else if(str3.equals("false")){
%>
	<script type="text/javascript">
	alert("수정 되지 않았습니다");	
	</script>
<% 
}
%>
	
<% 
if(str4 != null && !str4.equals("")){	
%>
	<script type="text/javascript">
	alert("가입하신 아이디는 " + str4 + "입니다.");
	location.href = "./client_view/member/login.jsp";
	</script>
<%
}else if(str4 == null || str4.equals("")){
%>
	<script type="text/javascript">
	alert("찾으시는 아이디가 없습니다.");
	location.href = "./client_view/member/searchidpw.jsp";
	</script>
<% 
}
%>
		
<% 
if(str5 != null && !str5.equals("")){	
%>
	<script type="text/javascript">
	alert("귀하의 비밀번호는 " + str5 + "입니다.");
	location.href = "./client_view/member/login.jsp";
	</script>
<%
}else if(str5 == null || str5.equals("")){
%>
	<script type="text/javascript">
	alert("가입하신 내역이 없거나 잘못 입력하셨습니다");
	location.href = "./client_view/member/searchidpw.jsp";
	</script>	
<%
}
%>
</body>
</html>