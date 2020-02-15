<%@page import="projectutil.ProjectUtil"%>
<%@page import="Dto.ManagerMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="./../../include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");
ManagerMemberDto managerSelectOneDTO = (ManagerMemberDto)request.getAttribute("managerModify1");
%>


	<h1>showmgrMemberDetail</h1>
	
	
	<div class="container">

	  <h2>직원리스트</h2>
	  
	  <div class="addClass">
	  <form action="<%=request.getContextPath() %>/showMgrMemberDetail" id="SelectForm" method="get">
		  <ul class="list-group">
		    <li class="list-group-item">
		    </li>
			<li class="list-group-item">
		     	<label for="mgr_id" class="width50" style="border: none;">메니저 인덱스 : </label>
		    	<input type="text" id="mgr_index" name="mgr_index" value="<%=managerSelectOneDTO.getMgr_index()%>" readonly>
		    </li>
		    <li class="list-group-item">
		     	<label for="mgr_id" class="width50">메니저 아아디 : </label>
		    	<input type="text" id="mgr_id" name="mgr_id" value="<%=managerSelectOneDTO.getMgr_id() %>" >
		    </li>
		    <li class="list-group-item">
		    	<label for="mgr_pw" class="width50">메니저 비밀번호 : </label>
		    	<input type="text" id="mgr_pw" name="mgr_pw" value="<%=managerSelectOneDTO.getMgr_pw() %>" > 
		    </li>
		    <li class="list-group-item">
		    <label for="mgr_name" class="width50">메니저 이름 : </label>	
		    	<input type="text" id="mgr_name" name="mgr_name" value="<%=managerSelectOneDTO.getMgr_name() %>" >
		    </li>
		    <li class="list-group-item">
		    	<label for="loc" class="width50">메니저 지역구:</label>
		    	<input type="text" id="loc" value="<%=ProjectUtil.locationChange(managerSelectOneDTO.getMgr_loc()) %>"  >
				<label for="mgr_loc" class="width50"> 에서 </label>
				<select name="mgr_loc">
					<option value="1">강남구</option>
					<option value="2">성동구</option>
					<option value="3" selected="selected">중랑구</option>
					<option value="4" >기타</option>
				</select>
				<label for="mgr_loc" class="width50"> 로 변경</label>
		    </li>
		    <li class="list-group-item">
		    	<label for="mgr_cell" class="width50">메니저 휴대전화번호:</label>
		    	<input type="text" id="mgr_cell" name="mgr_cell" value="<%=managerSelectOneDTO.getMgr_cell()%>"  >
		    </li>
		    <li class="list-group-item">
		    	<label for="mgr_auth" class="width50">메니저 권한:</label>
		    	<input type="text" id="mgr_auth" name="mgr_auth" value="<%=ProjectUtil.managerLevel(managerSelectOneDTO.getMgr_auth()) %>" >
		    	<label for="mgr_auth" class="width50">에서</label>
		    	<label>
					<select name="authLevel">
						<option value="0"> 최고관리자</option>
						<option value="1" selected="selected"> 매니저</option>
						<option value="2"> 설치기사</option>
					</select>
				</label>
				<label for="mgr_auth" class="width50">로 변경</label>
		    </li>
		    
		    <li class="list-group-item">
		    	<label for="mgr_del" class="width50">메니저 탈퇴여부:</label>
		    	<input type="text" id="mgr_del" value="<%=ProjectUtil.managerStatus(managerSelectOneDTO.getMgr_del())%>" readonly>
		    	
		    	<label>
					<select name="mgr_del">
						<option value="0" selected="selected"> 재직중</option>
						<option value="1"> 퇴사</option>
					</select>
				</label>
		    	
		    </li>
		    <li class="list-group-item">
		    	<button type="submit" class="modify_btn"> 수정완료 </button>
		    </li>
		  </ul>
		</form>
	  </div>
	  
	</div><!-- container  -->

	<div>
		

	
	</div>
		<%--
			권한변경 		auth를 0, 1, 2  로 변경한다. 
			아이디 삭제하기 => del=0 에서 1로 변경 
		--%>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(".delete_btn").click(function(){
				$("#Status_Selector").attr("value","delete");
				$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
				//console.log($("#Status_Selector").attr("value"));
				//console.log($("#mgr_indxe_dto").attr("value"));
				$("#SelectForm").submit();
			});	
			$(".modify_btn").click(function(){
				$("#Status_Selector").attr("value","modify");
				$("#mgr_indxe_dto").attr("value", "<%=managerSelectOneDTO.getMgr_index() %>");
				//console.log($("#Status_Selector").attr("value"));
				//console.log($("#mgr_indxe_dto").attr("value"));
				$("#mgr_index").removeAttr("readonly");
				//$("#SelectForm").submit();
			});	
			$(".mgr_pw").click(function(){
			    alert("hello");
			});
		});

	</script>
	
	
<%@ include file="./../../include/footer.jsp" %>