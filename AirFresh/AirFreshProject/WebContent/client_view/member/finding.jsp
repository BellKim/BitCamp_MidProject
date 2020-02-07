<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str = request.getParameter("isS");
int count = request.getParameter("count");
String str1 = request.getParameter("isS1");
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
	location.href = "memLogin";
	</script>
<%
}else if(str.equals("false")) {
%>
	<script type="text/javascript">
	alert("가입 실패!");
	location.href = "addMem";
	</script>
<% 
}else if(count > 0){
%>
	<script type="text/javascript">
	alert("성공적으로 수정 되었습니다");
	location.href = "";
	</script>	
<%
}else if(count < 0){
%>
	<script type="text/javascript">
	alert("수정 되지 않았습니다");
	location.href = "";	// model의 CustUserAdd controller로 보냄
	</script>
<%
else if(str1.equals("true")){
%>	
	<script type="text/javascript">
	alert("중복된 아이디가 있습니다.");
	location.href = "memLogin";
	</script>
<%
}else if(str1.equals("false")){
%>
	<script type="text/javascript">
	alert("삭제되지 않았습니다");
	location.href = "";
	</script>
<%
}
%>
<%-- <%
else if(str1.equals("true")){
%>	
	<script type="text/javascript">
	alert("정상적으로 삭제되었습니다");
	location.href = "memLogin";
	</script>
<%
}else if(str1.equals("false")){
%>
	<script type="text/javascript">
	alert("삭제되지 않았습니다");
	location.href = "";
	</script>
<%
}
%> --%>

</body>
</html>