<%@page import="Dto.ModelReviewPurDto"%>
<%@page import="java.util.List"%>
<%@page import="Dto.OrderReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp"%>

<%
	List<ModelReviewPurDto> list = (List<ModelReviewPurDto>) request.getAttribute("list");
	
%>

<div class="container" style="margin-bottom: 100px;">
	<h1 class="mt-4 mb-3">
		제품 후기<small>----</small>
	</h1>

	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="#">HOME</a></li>
		<li class="breadcrumb-item active">마이페이지</li>
	</ol>
	<hr>
	
		<table class="table table-hover">
				<col width="70">
				<col width="400">
				<col width="120">
				<col width="100">
				<col width="70">
				<thead>
					<tr align="center">
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
						<th scope="col">작성자</th>
						<th scope="col">조회수</th>
					</tr>
				</thead>
				<tbody>

					<%
						if (list.size() == 0 || list == null) {
					%>
					<tr align="center">
						<th colspan="5">작성된 리뷰가없습니다.</th>
					</tr>

					<%
						} else {
							for (int i = 0; i < list.size(); i++) {
								ModelReviewPurDto dto = list.get(i);
								
					%>
					<tr align="center" onclick="location.href='<%= request.getContextPath() %>/reviewDetail?seq=<%=dto.getRe_index() %>'"  style="cursor:pointer;">
						<th><%= i+1 %></th>
						<td align="left">
						<a href="#"><%=dto.getOrder_re_title()%></a>
						</td>
						<td><%=dto.getWdate().substring(0, 10) %></td>
						<td><%=dto.getMem_id()%></td>
						<td><%=dto.getReadcount() %></td>
					</tr>
					<%
							}//.for
						}//.if문
					%>
				</tbody>

			</table>
	
	</div>

<%@ include file="./../include/footer.jsp"%>