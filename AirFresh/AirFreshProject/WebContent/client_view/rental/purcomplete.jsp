<%@page import="Dto.PurchaseDto"%>
<%@page import="Dto.ModelDto"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<!-- 여기서 purchase 테이블의  index를 어떻ㄱㅔ 넘길까....??? -->
	<%
		MemberDto mem = (MemberDto) session.getAttribute("login");
		ModelDto model = (ModelDto) session.getAttribute("model");

		String command = request.getParameter("command");

		if (command.equals("true")) {
	%>
	<h1>결제완료</h1>
	<a href="index.jsp">[홈으로]</a>
	<a href="#">[마이페이지]</a>
	<a href="printPurchase?id=<%=mem.getMem_id() %>">[결제내역]</a>
	<%-- <a href="delPur?seq=<%=pur.getPur_index()%>">[구매취소]</a> --%>

	<script>
		
	</script>
	<%
		} else {
	%>
	<script>
		alert("결제에 실패하였습니다.");
		location.href = "index.jsp";
	</script>
	<%
		}
	%>
</body>
</html>