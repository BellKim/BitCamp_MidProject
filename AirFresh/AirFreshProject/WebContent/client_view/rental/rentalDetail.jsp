
<%@page import="javax.print.attribute.ResolutionSyntax"%>
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
	//제품 index get
	/* String seq = request.getParameter("seq");
	System.out.println("seq: "+seq); */
	
	ModelDto model = (ModelDto)request.getAttribute("model");
	//System.out.println("model :"+model.toString());
	
	int cell = 0101234567;
	MemberDto mem = new MemberDto();
	mem.setMem_id("bbb");
	mem.setMem_name("성춘향");
	mem.setMem_cell(cell);
	mem.setMem_addr1(15402);
	mem.setMem_addr2("서울특별시어쩌구");
	mem.setMem_addr3("모모아파트 101동101호");
	session.setAttribute("login", mem);
	
	//model session
	session.setAttribute("model", model);

%>
<table border="1">
	<tr>
		<!-- left 상품명, 상품이미지 --> 
		<td><%=model.getPrd_name() %></td>
		<td><img src="./client_view/model/prd_img/<%=model.getPrd_model_name() %>.png" alt="xx" style="width: 180px"></td>
		<td><!-- right 모델명, 방문주기, Q&A, 신청 -->
			<table border="1">
				<tr>
					<td>모델명</td>
					<td><%=model.getPrd_model_name() %></td>
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
					<td><%=model.getPrd_price() %></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" id="_qnawrite" value="Q&A" onclick="location.href='#'">
						<input type="hidden" name="command" value="purcha">
						<input type="button" value="바로신청하기" onclick="location.href='./modelDetail?seq=<%=model.getPrd_index() %>&command=purcha'" >
					</td>
				</tr>
			</table>
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