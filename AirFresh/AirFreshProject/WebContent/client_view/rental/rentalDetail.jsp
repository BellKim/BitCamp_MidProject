
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

	String id = "aaa";
	String name = "홍길동";
	int cell = 12345678;
	int addr1 = 15402;
	String addr2 = "서울특별시";
	String addr3 = "모모아파트 101동101호";
	
%>
<table>
	<tr>
		<!-- left 상품명, 상품이미지 -->
		<td>상품명</td>
		<td><img src="../prd_image/thumb-4_450x450.png"></td>
		<td><!-- right 모델명, 방문주기, Q&A, 신청 -->
			<form action="addPurchase" method="post">
				<input type="hidden" name="prd_index" value="<%=prd_index%>">	<!-- 제품 index prd_index -->
				<table>
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
							<input type="button" id="_qnawrite" value="Q&A" style="text-align: center;">
							<input type="submit" value="바로신청하기" style="text-align: center;">
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