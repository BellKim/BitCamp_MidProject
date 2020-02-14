<%@page import="projectutil.ProjectUtil"%>
<%@page import="Dto.ManagerMemberDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
ManagerMemberDto managerSelectOneDTO = (ManagerMemberDto)request.getAttribute("managerModify1");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>직원 정보 수정 페이지 입니다.</title>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
  
  <link rel="stylesheet" type="text/css" href="../assets/css/showMgrMemberDetail.css">
  
  
</head>
<body>
	<h1>showmgrMemberDetail</h1>
	
	
	<div class="container">

	  <h2>직원리스트</h2>
	  
	  <div class="addClass">
	  <form action="<%=request.getContextPath() %>/showMgrMemberDetail" id="SelectForm" method="get">
		  <ul class="list-group">
		    <li class="list-group-item">
		    </li>
			<li class="list-group-item">
		     	<label for="Mgr_id" class="width50" style="border: none;">메니저 인덱스 : </label>
		    	<input type="text" id="Mgr_index" name="Mgr_index" value="<%=managerSelectOneDTO.getMgr_index()%>" readonly>
		    </li>
		    <li class="list-group-item">
		     	<label for="Mgr_id" class="width50">메니저 아아디 : </label>
		    	<input type="text" id="Mgr_id" name="Mgr_id" value="<%=managerSelectOneDTO.getMgr_id() %>" >
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_pw" class="width50">메니저 비밀번호 : </label>
		    	<input type="text" id="Mgr_pw" name="Mgr_pw" value="<%=managerSelectOneDTO.getMgr_pw() %>" > 
		    </li>
		    <li class="list-group-item">
		    <label for="Mgr_name" class="width50">메니저 이름 : </label>	
		    	<input type="text" id="Mgr_name" name="Mgr_name" value="<%=managerSelectOneDTO.getMgr_name() %>" >
		    </li>
		    <li class="list-group-item">
		    	<label for="loc" class="width50">메니저 지역구:</label>
		    	<input type="text" id="loc" value="<%=ProjectUtil.locationChange(managerSelectOneDTO.getMgr_loc()) %>"  >
				<label for="Mgr_loc" class="width50"> 에서 </label>
				<select name="Mgr_loc">
					<option value="1">강남구</option>
					<option value="2">성동구</option>
					<option value="3" selected="selected">중랑구</option>
					<option value="4" >기타</option>
				</select>
				<label for="Mgr_loc" class="width50"> 로 변경</label>
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_cell" class="width50">메니저 휴대전화번호:</label>
		    	<input type="text" id="Mgr_cell" name="Mgr_cell" value="<%=managerSelectOneDTO.getMgr_cell()%>"  >
		    </li>
		    <li class="list-group-item">
		    	<label for="Mgr_auth" class="width50">메니저 권한:</label>
		    	<input type="text" id="Mgr_auth" name="Mgr_auth" value="<%=ProjectUtil.managerLevel(managerSelectOneDTO.getMgr_auth()) %>" >
		    	<label for="Mgr_auth" class="width50">에서</label>
		    	<label>
					<select name="authLevel">
						<option value="0"> 최고관리자</option>
						<option value="1" selected="selected"> 매니저</option>
						<option value="2"> 설치기사</option>
					</select>
				</label>
				<label for="Mgr_auth" class="width50">로 변경</label>
		    </li>
		    
		    <li class="list-group-item">
		    	<label for="Mgr_del" class="width50">메니저 탈퇴여부:</label>
		    	<input type="text" id="Mgr_del" name="Mgr_del" value="<%=ProjectUtil.managerStatus(managerSelectOneDTO.getMgr_del())%>" readonly>
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
				$("#Mgr_index").removeAttr("readonly");
				//$("#SelectForm").submit();
			});	
			$(".Mgr_pw").click(function(){
			    alert("hello");
			});
		});

	</script>
	
	
</body>
</html>