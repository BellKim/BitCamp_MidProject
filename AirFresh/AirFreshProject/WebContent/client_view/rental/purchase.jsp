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
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
<%
	
	MemberDto mem = (MemberDto)session.getAttribute("login");
	ModelDto model = (ModelDto)session.getAttribute("model");
	
	
%>
<h1>주문결제</h1>
	<form id="frm" action="./../../addPurchase" method="post">
		<table border="1">
			<tr>
				<td><img src="../model/prd_img/thumb-4_450x450.png" alt="xx"
					style="width: 80px; height: 80px;"></td>
				<td>신청상품: <%=model.getPrd_model_name() %></td>
			</tr>
			<tr>
				<td colspan="2">배송지 정보</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" value="<%=mem.getMem_name() %>"
					size="20" readonly="readonly"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" value="<%=mem.getMem_cell() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" value="<%=mem.getMem_addr2() %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>설치 희망일</td>
				<td>
					<input type="text" name="ins_date" id="datepicker" placeholder="선택해주세요" readonly="readonly" >
				</td>
			</tr>
		</table>
		<hr>
		
		<table>
			<tr>
				<td colspan="2">약관동의/주문정보</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="_agree">개인정보약관 제공에 동의합니다
					<a href="#">[상세보기]</a>
				</td>
				<td>
					<table>
						<tr>
							<td>렌탈금액</td>
							<td><%=model.getPrd_price() %>원</td>
						</tr>
						<tr>
							<td>설치비용</td>
							<td>면제</td>
						</tr>
						<tr>
							<td>배송비</td>
							<td>무료</td>
						</tr>
						<tr>
							<td>방문주기</td>
							<td>4개월/2개월</td>
						</tr>
						<tr>
							<td>총 렌탈 금액</td>
							<td><%=model.getPrd_price() %>원</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- rentalDetail.jsp?seq=model.getPrd_index() -->
					<input type="button" value="취소" onclick="location.href='rentalDetail.jsp'">
					<input type="button" value="신청하기" id="_purBtn">
				</td>
			</tr>
		</table>
	</form>
	 <script>
		  $( function() {
			
		    $( "#datepicker" ).datepicker(
		    			{ minDate: -20, 
		    			  maxDate: "+1M +10D",
		    			  dateFormat: "yy/mm/dd"
		    			});
		    
		    $("#_purBtn").click(function() {
		    	var check = $("#_agree").is(":checked");
		    	
		    	 if($("#datepicker").val() == ""){
						alert("설치를 희망하는 날짜를 선택해주세요");
						$("#datepicker").focus();
				 } else if (check == false ){
					alert("개인정보약관 제공에 동의해주세요");
					$("#_agree").prop("checked",true);
				} else {
					$("#frm").submit();
				}
			});
		  } );
  </script>
</body>
</html>