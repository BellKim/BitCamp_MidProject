<%@page import="Dto.PurchaseNameDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<PurchaseNameDto> list = (List<PurchaseNameDto>) request.getAttribute("rentalList");
%>

<%!
	public String purchaseCancle(int order_auth){
		String str = "";
		if (order_auth == 0){
			str = "렌탈 신청";
		} else if(order_auth ==1){
			str = "렌탈 취소";
		}
		return str;
	}

%>
<%@ include file="./../include/header.jsp"%>
<div class="container-fluid">
	<h1 class="mt-4 mb-3">렌탈 리스트</h1>
	<hr>
	<form id="noticelistForm" method="post">
		<input type="hidden" name="command" value="multiDelete">
		<table class="table table-hover" width="100%" cellspacing="0">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" name="alldel"
						onclick="deleteChecks(this.checked)"></th>
					<th>번호</th>
					<th>렌탈번호</th>
					<th>제품명</th>
					<th>구매 아이디</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
				
				<%
					if (list.size() == 0 || list == null) {
				%>
				<tr>
				<td colspan="6" align="center">렌탈 내역이 존재하지 않습니다.</td>
				</tr>
				<%
					} else {
						for(int i = 0; i < list.size(); i++){
							PurchaseNameDto purchase = list.get(i);
				%>
				<tr>
					<td><input type = "checkbox" name = "delck" value = "<%=purchase.getPur_index()%>"></td>
					<th><%=i+1 %></th>
					<td><%=purchase.getPur_index() %></td>
					<td><%=purchase.getPrd_model_name() %></td>
					<td><%=purchase.getMem_id() %></td>
					<td><%=purchaseCancle(purchase.getOrder_auth()) %></td>
				</tr>
				<%	}
				}%>
				
				
			</tbody>
		</table>
	</form>
</div>

<script type="text/javascript">
	function deleteChecks(ch) {
		//alert(ch);
		var arrCheck = document.getElementsByName("delck");
		for (var i = 0; i < arrCheck.length; i++) {
			arrCheck[i].checked = ch;
		}
	}

	
	$(function(){
		$("#delBtn").click(function(){
			var arrCheck = $("input[name='delck']:checked").length;

			if(arrCheck==0){
				alert("삭제할 멤버를 선택해주세요");
				return
			}
			//$("#noticelistForm").attr("action","noticedelete?command=multiDelete").submit();
			
		});
	});
	</script>
<%@ include file="./../include/footer.jsp"%>