<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%=request.getContextPath() %>
	<a href="<%=request.getContextPath() %>/showMrgMember"> 페이지 이동 </a>
	<script type="text/javascript">
	<%--
	window.location.href = '<%=request.getContextPath() %>/showMrgMember';
	--%>
	window.location.href = './addManager.jsp';
	
	</script>
</body>
</html>