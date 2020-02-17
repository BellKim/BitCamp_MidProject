<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./../include/header.jsp"%>
<div class="container-fluid">
	<h1 class="mt-4 mb-3">렌탈 리스트</h1>
	<hr>
		<form id="noticelistForm" method="post">
			<input type="hidden" name="command" value="multiDelete">
			<table class="table table-hover" width="100%" cellspacing="0">
				<thead>
					<tr>
					<th scope="col"><input type ="checkbox" name ="alldel" onclick="deleteChecks(this.checked)"></th>
						<th>번호</th>
						<th>렌탈번호</th>
						<th>제품번호</th>
						<th>구매 아이디</th>
						<th>비고</th>
					</tr>
				</thead>
				<tbody>

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