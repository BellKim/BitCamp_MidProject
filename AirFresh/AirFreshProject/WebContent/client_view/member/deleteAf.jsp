<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str2 = request.getParameter("isS2");		// delMem
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

</body>
</html>