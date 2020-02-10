<%@page import="Dto.InstallDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
	</head>
	
	<body>
		<div align="center">
			<form action="<%=request.getContextPath() %>/addAs">
				<button type="button">이동!</button>
			</form>
			<table style="width: 100%">
				<col width="20"><col width="20"><col width="20"><col width="20"><col width="20">
				<tr>
					<th>모델명</th><th>회원아이디</th><th>구매일자</th><th>설치 희망일</th><th>주소</th>
				</tr>
			</table>
		</div>
		
		
		<script type="text/javascript">
			$("document").ready(function name() {
				
				$("button").click(function () {
					
					$.ajax({
						url:'<%=request.getContextPath() %>/addAs',
						type:"post",
						data:"",
						datatype:"json",
						
						success: function ( data ) {
							alert("성공");
						},
						
						error: function () {
							alert("실패");
						}
					});
					
				});	
			});
		
			
		</script>
	</body>
</html>