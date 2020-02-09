<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원관리 시스템</title>
</head>
<%-- 메니저 전체 리스트를 열람, 추가/삭제 해줌. --%>
<body>
	<h3> input data </h3>
	<%=request.getContextPath() %>
	<%--<%=request.getContextPath()%>/addMrgMember --%>
	<form id="addManagerMem" name="addManagerMem" action="<%=request.getContextPath()%>/addMrgMember"  method="POST">
		<input type="textarea" id="test" name="test" >
		<input type="textarea" id="test1" name="test1" >
	<input type="submit"  value="전송버튼">
	
	<!-- <form id="addManagerMem" name="addManagerMem" action="./../../AddMgrMember"  method="post"> -->
	
	
	
		
		
	</form>
	
	


</body>

</html>