<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str = request.getParameter("isS");	// addMem
MemberDto mem = (MemberDto)session.getAttribute("login");	//memLogin
String str1 = request.getParameter("isS1");		// idCheck
String str2 = request.getParameter("isS2");		// delMem
String str3 = request.getParameter("isS3");		// updateMem
//int count = Integer.parseInt(request.getParameter("count"));	// ???
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
	location.href = "memlogin";
	</script>
<%
}else if(str.equals("false")) {
%>
	<script type="text/javascript">
	alert("가입 실패!");
	location.href = "addmem";
	</script>
<% 
}else if(mem != null && !mem.getMem_id().equals("")){
	session.setAttribute("login", mem);
	session.setMaxInactiveInterval(30*60*60);
%>
	<script type="text/javascript">
	alert("안녕하세요 <%=mem.getMem_name() %>님");
	location.href = "./mypage.jsp";
	</script>
<%
}else if(mem == null || mem.getMem_id().equals("")){
%>
	<script type="text/javascript">
	alert("id나 password를 확인하십시오");
	location.href = "./login.jsp";
	</script>	
<%
}else if(str1.equals("true")){
%>	
	<script type="text/javascript">
	alert("중복된 아이디가 있습니다.");
	location.href = "memlogin";
	</script>
<%
}else if(str1.equals("false")){
%>
	<script type="text/javascript">
	alert("사용 가능한 아이디입니다");	
	</script>
<%
}else if(str2.equals("true")){
%>	
	<script type="text/javascript">
	alert("정상적으로 삭제되었습니다");
	location.href = "memLogin";
	</script>
<%
}else if(str2.equals("false")){
%>
	<script type="text/javascript">
	alert("삭제되지 않았습니다");
	location.href = "./mypage.jsp";
	</script>
<%
}else if(str3.equals("true")){
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
</body>
</html>