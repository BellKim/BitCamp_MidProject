<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str3 = request.getParameter("isS3");		// updateMem
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

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

</body>
</html>