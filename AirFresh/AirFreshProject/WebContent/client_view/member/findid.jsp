<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str4 = request.getParameter("id");	// FindID(PW)
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

</body>
</html>