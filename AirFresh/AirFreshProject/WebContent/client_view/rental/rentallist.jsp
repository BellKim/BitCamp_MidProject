
<%@page import="Dto.PurchaseNameDto"%>
<%@page import="Dto.ModelDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.PurchaseDto"%>
<%@page import="Dao.impl.PurchaseDao"%>
<%@page import="Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="./../include/header.jsp"%>

<%
	MemberDto mem = (MemberDto) session.getAttribute("login");

	//List<PurchaseDto> list = (List<PurchaseDto>) request.getAttribute("list");
	List<PurchaseNameDto> list = (List<PurchaseNameDto>) request.getAttribute("list");
	System.out.println("list 갯수: " + list.size());
%>
<div class="container" style="margin-bottom: 100px;">
	<h1 class="mt-4 mb-3">
		구매내역 <small>Rental List</small>
	</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">마이페이지</a></li>
		<li class="breadcrumb-item active">렌탈내역</li>
	</ol>

	<div style="clear: left"></div>
	<table class="table table-hover">
		<col width="200">
		<col width="200">
		<col width="300">
		<col width="100">
		<col width="100">
		<thead>
			<tr align="center">
				<th scope="col">구매일</th>
				<th scope="col">설치희망일</th>
				<th scope="col">상품명</th>
				<th scope="col">구매취소</th>
				<th scope="col">A/S신청</th>
			</tr>
		</thead>
		<tbody>

			<%
				if (list.size() == 0 || list == null) {
			%>
			<tr align="center">
				<th colspan="5">구매내역이 없습니다.</th>
			</tr>

			<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						PurchaseNameDto dto = list.get(i);

						if (dto.getOrder_auth() == 0) {
			%>
			<tr align="center">
				<td><%=dto.getPur_date()%></td>
				<td><%=dto.getIns_date()%></td>
				<td><img
					src="<%=request.getContextPath()%>/client_view/model/prd_detail_img/<%=dto.getPrd_model_name()%>_m1.png"
					alt="" style="width: 40px; height: 40px;"> <b><%=dto.getPrd_name()%></b>
					(<%=dto.getPrd_model_name()%>)</td>
				<td><a href="#" class="delPer" aaa="<%=dto.getPur_index()%>">구매취소</a></td>
				<td><a
					href="asAppPage?seq=<%=dto.getPur_index()%>&prd_name=<%=dto.getPrd_name()%>">A/S신청</a></td>
			</tr>
			<%
				} else if (dto.getOrder_auth() == 1) { //구매취소된 주문일때
			%>
			<tr align="center">
				<td><%=dto.getPur_date()%></td>
				<td>구매취소</td>
				<td><img
					src="<%=request.getContextPath()%>/client_view/model/prd_detail_img/<%=dto.getPrd_model_name()%>_m1.png"
					alt="" style="width: 40px; height: 40px;"> <b><%=dto.getPrd_name()%></b>
					(<%=dto.getPrd_model_name()%>)</td>
				<td>취소완료</td>
				<td></td>
			</tr>
			<%
				} //else if문종료
					} //for문종료
				} //else문 종료
			%>
		</tbody>
	</table>
</div>
<script>

			$(document).ready(function() {
				$(".delPer").on("click",function() {
					var result = confirm ("정말 취소하시겠습니까?");			
					/*  if(result){
						alert("정상적으로 취소되었습니다.");
					} else return; 
					 */
					 
					 var aa = $(this).attr("aaa");
					 var del = $(this);
					 //alert(aa);
					 //alert(result);
					  if(result){
						$.ajax({
							url:"<%=request.getContextPath()%>/delPur",
							type : "post",
							data : { seq : aa },
					traditional : true,
					datatype : "text",
					success : function(data) {
						//alert("통신성공");
						//data
						//var d = JSON.stringify(data);
						var d = JSON.parse(data);
						//alert("data:"+data+"d: "+d);
						
						
						var tr = del.parent().parent();
						var td = tr.children();

						//alert("tr:" + tr + ", td: " + td);

						if(d=="true"){
							td.eq(1).text("구매취소");
							td.eq(3).children().html("취소완료"); 
							td.eq(4).children().text(" "); 
							//var a = td.eq(1).children().text();
							//alert("a: "+a);
							//alert("true로 옴");
							console.log("클릭한 row의데이터:"+tr.text());
							
						} else {
							alert("실패");
							
						} 
						
						
					/* 	var tt = td.eq(3).children().text(); */
						//alert(tt); 
					},
					error : function() {
						alert("통신실패");
					} //error
				});//ajax
			} //if문
		});//click
	});//document
</script>

<%@ include file="./../include/footer.jsp"%>