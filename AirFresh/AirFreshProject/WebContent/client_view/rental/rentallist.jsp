
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
	System.out.println("list 갯수: "+list.size());

%>
<div class="container" style="margin-bottom: 100px;">
 <h1 class="mt-4 mb-3">구매내역
      <small>Rental List</small>
    </h1>

    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="#">마이페이지</a>
      </li>
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
							
							if(dto.getOrder_auth()==0){	
				%>
				<tr align="center">
					<td><%=dto.getPur_date() %></td>
					<td><%=dto.getIns_date()%></td>
					<td>	<img src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=dto.getPrd_model_name() %>_m1.png" alt="" style="width: 40px;height: 40px;">
						<b><%=dto.getPrd_name()%></b> (<%=dto.getPrd_model_name() %>)</td>
					<td><a href="delPur?seq=<%=dto.getPur_index() %>" id="_delPer">구매취소</a></td>
					<td><a href="asAppPage?seq=<%= dto.getPur_index()%>&prd_name=<%=dto.getPrd_name() %>">A/S신청</a></td>
				</tr>	
				<%
							} else if (dto.getOrder_auth()==1){	//구매취소된 주문일때
				%>
					<tr align="center">
					<td><%=dto.getPur_date() %></td>
					<td>구매취소</td>
					<td>	<img src="<%= request.getContextPath() %>/client_view/model/prd_detail_img/<%=dto.getPrd_model_name() %>_m1.png" alt="" style="width: 40px;height: 40px;">
						<b><%=dto.getPrd_name()%></b> (<%=dto.getPrd_model_name() %>)</td>
					<td>취소완료</td>
					<td>-----</td>
					</tr>	
				<%
							}//else if문종료
						}//for문종료
					}//else문 종료
				%>
			</tbody>
		</table>
	</div>

<%@ include file="./../include/footer.jsp"%>