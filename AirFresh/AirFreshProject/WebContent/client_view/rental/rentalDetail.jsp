
<%@page import="Dao.impl.MemberDao"%>
<%@page import="Dto.ModelDto"%>
<%@page import="Dto.MemberDto"%>
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
<%
	String prd_index = "100000";
	MemberDto mem = new MemberDto();
	mem.setMem_id("bbb");
	mem.setMem_addr2("서울특별시 강서구");

	session.setAttribute("login", mem);
	
	//ModelDto model = new ModelDto(10000,"공기청정기1","ACL141MA",28900);
	
%>
<table border="1">
	<tr>
		<!-- left 상품명, 상품이미지 -->
		<td>상품명</td>
		<td><img src="../model/prd_img/thumb-4_450x450.png" alt="xx"></td>
		<td><!-- right 모델명, 방문주기, Q&A, 신청 -->
			<form action="./../../addPurchase" method="post">
				<input type="hidden" name="prd_index" value="<%=prd_index%>">	<!-- 제품 index prd_index -->
				
				<table border="1">
					<tr>
						<td>모델명</td>
						<td>ACL141MA (14평형)</td>
					</tr>
					<tr>
						<td>방문주기</td>
						<td>4개월/2개월</td>
					</tr>
					<tr>	
						<td>의무사용기간</td>
						<td>24개월/ 24개월이후 소유권이전</td>
					</tr>
					<tr>
						<td>렌탈가</td>
						<td>28,900</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="button" id="_qnawrite" value="Q&A">
							<input type="submit" value="바로신청하기" >
						</td>
					</tr>
				</table>
			</form>
		</td>
	</tr>
</table>
<table border="1" style="width: 500px">
	<tr>
		<td>상세이미지</td>
	</tr>
</table>
</body>
</html>