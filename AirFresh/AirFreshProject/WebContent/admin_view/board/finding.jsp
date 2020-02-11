<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String str = request.getParameter("isS");
	String command = request.getParameter("command");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if (command.equals("upload")) {
	%>

	<%
		if (str.equals("true")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 추가되었습니다.");
		location.href = "<%=request.getContextPath()%>/noticelist"; //컨트롤러 거쳐야함
	</script>

	<%
		} else {
	%>
	<script type="text/javascript">
		alert("추가되지 않았습니다.");
		location.href = "<%=request.getContextPath()%>/noticelist"; 
	</script>
	<%
		}
	%>
	<%
		} else if(command.equals("delete")){
	%>
	<%
		if (str.equals("true")) {
	%>
	<script type="text/javascript">
		alert("성공적으로 삭제되었습니다.");
		location.href = "<%=request.getContextPath()%>/noticelist"; //컨트롤러 거쳐야함
	</script>

	<%
		} else {
	%>
	<script type="text/javascript">
		alert("삭제되지 않았습니다.");
		location.href = "<%=request.getContextPath()%>/noticelist"; 
	</script>
	<%
		}
	%>
	
	<%
	
	}%>
</body>
</html>