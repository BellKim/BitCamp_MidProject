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
<!-- 여기서 purchase 테이블의  index를 어떻ㄱㅔ 넘길까....??? -->
<%
	MemberDto mem = (MemberDto)session.getAttribute("login");
	ModelDto model = (ModelDto)session.getAttribute("model");
	
	String isS = request.getParameter("isS");

	if(isS.equals("true")){
%>
	<h1>결제완료</h1>
	<a href="index.jsp">[홈으로]</a> <a href="#">[마이페이지]</a> 
	<p id="delp">[구매취소]</p>
	
	<script>
		$(function() {
			$("#delp").click(function() {
				$.ajax(function() {
					url:"delPur",
					type:"post",
					datatype:"json",
					data:"seq="
				});
			});
		});
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