<%@page import="Dto.OrderReviewDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../include/header.jsp" %>
<%
	List<OrderReviewDto> list = request.getAttribute("Orderlist")==null? null:(List<OrderReviewDto>)request.getAttribute("Orderlist");
	
%>
<div class="container" style="margin-bottom: 100px;">
	 <h1 class="mt-4 mb-3">제품설치 리뷰 작성페이지<small>----</small></h1>
	 <table class="table table-hover" border="1">
	 <col width="50"><col width="200"><col width="80"><col width="100">
	 <col width="60"><col width="70">
	 <tr align="center">
	 	<th scope="col">글번호</th>
	 	<th scope="col">제목</th>
	 	<th scope="col">작성일</th>
	 	<th scope="col">아이디</th>
	 	<th scope="col">조회수</th>
	 	<th scope="col">별점</th>
	 </tr>
	 
	 </table> 
</div>	


<%@ include file="./../../include/footer.jsp" %>