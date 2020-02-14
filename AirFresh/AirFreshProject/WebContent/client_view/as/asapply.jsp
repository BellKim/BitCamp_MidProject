<%@page import="Dto.PurchaseNameDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
	 MemberDto mem = (MemberDto)session.getAttribute("login");
     String prd_name = request.getParameter("prd");
     String seq = request.getParameter("seq"); 
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
</head>
<body>
<h1>a/s예약</h1>

<form id="frm" action="<%=request.getContextPath() %>/addAsApp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="pur_index" value="<%=seq %>">
	<table border="1">
		<tr>
			<td>회원ID</td>
			<td><input type="text" readonly="readonly" name="mem_id" value="<%= mem.getMem_id() %>"></td>
		</tr>
		<tr>
			<td>AS요청제품</td>
			<td><input type="text" readonly="readonly" name="prd_name" value="<%=prd_name %>"></td>
		</tr>
		<tr>
			<td>as방문희망일</td>
			<td><input type="text" name="req_date" id="datepicker" placeholder="희망 날짜를 선택해주세요" readonly="readonly" ></td>
		</tr>
		<tr>
			<td>이미지첨부</td>
			<td><input type="file" name="fileload" style="width: 400px"></td>
		</tr>
		<tr>
			<td>제목</td>
			<td><input type="text" name="astitle" id="_astitle" size="50"></td>
		</tr>
		<tr>
			<td>증상설명</td>
			<td><textarea rows="20" cols="50" name="ascontent" id="_ascontent"></textarea></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="메인으로" onclick="location.href=''">
				<input type="button" value="A/S신청하기" id="_asBtn">
			</td>
		</tr>
	</table>
</form>
<script>
	$(function () {
		 $( "#datepicker" ).datepicker(
	    			{ minDate: 0, 
	    			  maxDate: "+1M +10D",
	    			  dateFormat: "yy/mm/dd"
	    });
		 
		 $("#_asBtn").click(function() {
/* 			if($("#datepicker").val()==""){
				alert("as방문 희망날짜를 선택해주세요.");
				$("#datepicker").focus();
			} else if($("#_astitle").val()==""){
				alert("제목을 작성해주세요");
				$("#_astitle").focus();
			} else if($("#_ascontent").val()==""){
				alert("증상을 작성해주세요");
				$("#_ascontent").focus();				
			} else {
				alert("as신청이 정상적으로 접수되었습니다.");
				$("#frm").submit();
			} */
			
			 $("#frm").submit();
		});
	});
</script>
</body>
</html>