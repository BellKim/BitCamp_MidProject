<%@page import="db.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--
DBConnection.initConnection();
--%>
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
		<div>id<input type="text" id="manager_id" name="manager_id" ></div>
		<div>pw<input type="text" id="manager_pw" name="manager_pw" ></div>
		<div>이름<input type="text" id="manager_name" name="manager_name" ></div>
		<!-- 
		<div>근무지<input type="text" id="manager_loc" name="manager_loc" ></div>
		 -->
		<div>
		근무지역선택 
			<select name="manager_loc">
			  <option value="1">강남구</option>
			  <option value="2">성동구</option>
			  <option value="3" selected="selected">중랑구</option>
			</select>
		</div>
		<div>
		직원구분
			<select name="authLevel">
				<option value="0"> 최고관리자</option>
				<option value="1"> 매니저</option>
				<option value="2"> 설치기사</option>
			</select>
		</div>
		<div>핸드폰번호<input type="text" id="manager_phNum" name="manager_phNum" ></div>
		
		
	<input type="submit"  value="전송버튼">
	
	
	
	
		
		
	</form>
	
	


</body>

</html>